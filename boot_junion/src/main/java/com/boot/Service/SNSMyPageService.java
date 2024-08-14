package com.boot.Service;

import java.util.HashMap;
import java.util.List;

import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SNSIntroDTO;
import com.boot.DTO.UserDTO;
import com.boot.DTO.UserImageUploadDTO;

public interface SNSMyPageService {
	
//	public List<ResumeDTO> resumeInfo(HashMap<String, String> param); //이력서 정보
	public ResumeDTO resumeInfo(HashMap<String, String> param); //이력서 정보
	
	public CompanyInfoDTO companyInfo(String email); //기업 정보
	
	public UserDTO getUserInfo(String user_email); //개인정보

	public SNSIntroDTO getSNSIntro(String user_email); //자기소개
	
	public List<SNSIntroDTO> getSNSStack(String user_email); //개인 스택
	
	public List<SNSIntroDTO> getSNSJob(String user_email); //개인 선호 직무
	
	public List<UserImageUploadDTO> getUserImage(String user_email); //개인 사진
}