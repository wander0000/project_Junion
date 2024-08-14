package com.boot.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.SNSAttachDAO;
import com.boot.DTO.SNSAttachDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SNSUploadService")
public class SNSUploadServiceImpl implements SNSUploadService{
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<SNSAttachDTO> snsGetFileList(int sns_num) {
		log.info("@# SNSUploadServiceImpl snsGetFileList");

		SNSAttachDAO dao = sqlSession.getMapper(SNSAttachDAO.class);
		
		return dao.snsGetFileList(sns_num);
	}


	@Override
	public void snsDeleteFile(List<SNSAttachDTO> fileList) {
		log.info("@# SNSUploadServiceImpl deleteFiles");
		log.info("@# SNSUploadServiceImpl fileList 값 =>"+fileList);
		
		if (fileList == null || fileList.size() == 0) {
			return;
		}
		
		fileList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\"
											 +attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\devv\\upload\\"+attach.getUploadPath()+"\\s_"
							+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error"+e.getMessage());
			}
		});//end of forEach
	}


}
















