package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.SNSAttachDAO;
import com.boot.DAO.SNSDAO;
import com.boot.DTO.SNSDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SNSService")
public class SNSServiceImpl implements SNSService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<SNSDTO> snsList() {
		log.info("@#SNSServiceImpl snsList");
		
		SNSDAO dao = sqlSession.getMapper(SNSDAO.class);
		ArrayList<SNSDTO> list = dao.snsList();
		
		return list;
	}

	@Override
	public SNSDTO findBySNSNum(int sns_num) {
		log.info("@#SNSServiceImpl findBySNSNum");
		
		SNSDAO dao = sqlSession.getMapper(SNSDAO.class);
		SNSDTO dto = dao.findBySNSNum(sns_num);
		
		return dto;
	}

	@Override
	public void snsWrite(SNSDTO snsDTO) {
		log.info("@#SNSServiceImpl snsWrite");
		
		SNSDAO dao = sqlSession.getMapper(SNSDAO.class);
		dao.snsWrite(snsDTO);
		
		SNSAttachDAO daos = sqlSession.getMapper(SNSAttachDAO.class);
//		첨부파일 있는지 체크
		log.info("@# snsDTO.getSNSAttachList()=>"+snsDTO.getSNSAttachList());
		if (snsDTO.getSNSAttachList() == null || snsDTO.getSNSAttachList().size() == 0) {
			log.info("@# null");
			return;
		}
		
//		첨부파일이 있는 경우 처리
		snsDTO.getSNSAttachList().forEach(attach -> {
			attach.setSns_num(snsDTO.getSns_num());
			daos.snsInsertFile(attach);
		});
	}

	@Override
	public List<SNSDTO> searchName(String searchName) {

		SNSDAO dao = sqlSession.getMapper(SNSDAO.class);
		List<SNSDTO> list = dao.searchName(searchName);
		
		return list;
	}


}







