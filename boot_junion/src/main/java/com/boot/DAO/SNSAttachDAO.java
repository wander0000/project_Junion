package com.boot.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.SNSAttachDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface SNSAttachDAO {  // 파일추가, 열람, 삭제
//	파일업로드는 파라미터를 DTO 사용
	public void snsInsertFile(SNSAttachDTO vo);  // 파라미터가 SNSAttachDTO / 파일추가
	public List<SNSAttachDTO> snsGetFileList(int sns_num); // int타입 sns_num파라미터를 list타입 <SNSAttachDTO> getFileList로 사용하려함 / 파일열람
	public void snsDeleteFile(String sns_num);  // sns_num 맞춰서 파일삭제로직 / 파일삭제
}
















