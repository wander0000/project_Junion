package com.boot.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.SNSRecommendUserDAO;
import com.boot.DTO.SNSRecommendUserDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SNSRecommendUserService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<SNSRecommendUserDTO> RecommendUserList(String login_email) {
		log.info("@# RecommendUserList");
		
		SNSRecommendUserDAO dao = sqlSession.getMapper(SNSRecommendUserDAO.class);
		
		List<String> stackNames = dao.getStackNames(login_email);
		log.info("@# stackNames=>"+stackNames);
		
		List<SNSRecommendUserDTO> userList = dao.RecommendUserList(stackNames, login_email);
//		log.info("@# userList=>"+userList);
		
		
		return userList;
	}
	
	public List<SNSRecommendUserDTO> RecommendComList(String login_email) {
		log.info("@# RecommendUserList");
		
		SNSRecommendUserDAO dao = sqlSession.getMapper(SNSRecommendUserDAO.class);
		
		List<String> stackNames = dao.getStackNames(login_email);
		log.info("@# stackNames=>"+stackNames);
		
		List<SNSRecommendUserDTO> comList = dao.RecommendComList(stackNames, login_email);
//		log.info("@# comList=>"+comList);
		
		
		return comList;
	}
}
