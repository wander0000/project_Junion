package com.boot.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SNSFeedbackDTO;
import com.boot.DTO.SNSFollowDTO;
import com.boot.DTO.SNSIntroDTO;
import com.boot.DTO.UserDTO;
import com.boot.DTO.UserImageUploadDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface SNSMyPageDAO {
	
	public List<ResumeDTO> resumeInfo(HashMap<String, String> param); //이력서 정보
//	public ResumeDTO resumeInfo(HashMap<String, String> param); //이력서 정보
	
	public CompanyInfoDTO companyInfo(String email); //기업 정보
	
	public UserDTO getUserInfo(String user_email);

	public SNSIntroDTO getSNSIntro(String user_email);
	
	public void modifySNSIntro(HashMap<String, String> param);
	
	public List<SNSIntroDTO> getSNSStack(String user_email);
	
	public List<SNSIntroDTO> getSNSJob(String user_email);
	
	public List<UserImageUploadDTO> getUserImage(String user_email); //개인 사진
	
	public void deletePost(HashMap<String, String> param); //게시글 삭제
	
	public void writeFeedback(SNSFeedbackDTO snsFeedbackDTO); //피드백 작성
	
	public List<SNSFeedbackDTO> getFeedback(HashMap<String, String> param); // 피드백 불러오기
	
	public void deleteFeedback(HashMap<String, String> param); //피드백 삭제

	public SNSFollowDTO followCount(String user_email);
}
