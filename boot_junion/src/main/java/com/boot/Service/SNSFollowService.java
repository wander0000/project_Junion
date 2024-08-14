package com.boot.Service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.DAO.SNSFollowDAO;
import com.boot.DTO.SNSFollowDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SNSFollowService {
	
	@Autowired
	private SqlSession sqlSession;
	
//	public void insertFollow(SNSFollowDTO followDTO) {
//		log.info("@# followUser");
//		SNSFollowDAO dao = sqlSession.getMapper(SNSFollowDAO.class);
//		dao.insertFollow(followDTO);
//	}
	
    @Transactional
    public void toggleFollow(SNSFollowDTO followDTO) {
    	log.info("@# SNSFollowService toggleFollow");
    	log.info("@# SNSFollowService followDTO=>"+followDTO);
    	SNSFollowDAO dao = sqlSession.getMapper(SNSFollowDAO.class);
        if (dao.isFollowed(followDTO) == 1) {
            // 이미 팔로우 중인 경우 삭제
        	dao.deleteFollow(followDTO);
//            return dao.deleteFollow(followDTO) > 0;
        } else {
            // 팔로우가 아닌 경우 삽입
        	dao.insertFollow(followDTO);
//            return dao.insertFollow(followDTO) > 0;
        }
    }

    @Transactional(readOnly = true)
    public int isFollowed(SNSFollowDTO followDTO) {
    	log.info("@# SNSFollowService isFollowed");
    	log.info("@# SNSFollowService followDTO=>"+followDTO);
    	SNSFollowDAO dao = sqlSession.getMapper(SNSFollowDAO.class);

    	log.info("@# SNSFollowService dao.isFollowed(followDTO)=>"+dao.isFollowed(followDTO));
    	
        return dao.isFollowed(followDTO);
    }
}
