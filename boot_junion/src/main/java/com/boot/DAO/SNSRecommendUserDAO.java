package com.boot.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.SNSRecommendUserDTO;

@Mapper
public interface SNSRecommendUserDAO {
	
	public List<String> getStackNames(String login_email);
	public List<SNSRecommendUserDTO> RecommendUserList(@Param("stackNames") List<String> stackNames,@Param("login_email") String login_email); // 추천인 개인 리스트
	public List<SNSRecommendUserDTO> RecommendComList(@Param("stackNames") List<String> stackNames,@Param("login_email") String login_email); // 추천인 기업 리스트
//	public List<String> getSNSIntroList(String login_email);
}
