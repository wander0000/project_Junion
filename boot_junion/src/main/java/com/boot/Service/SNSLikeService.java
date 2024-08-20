package com.boot.Service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.SNSLikeDAO;
import com.boot.DTO.SNSLikeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SNSLikeService {
	
	@Autowired
	private SqlSession sqlSession;
	
    public void likePost(SNSLikeDTO snsLikeDTO) {
    	log.info("@# SNSLikeService likePost");
    	SNSLikeDAO dao = sqlSession.getMapper(SNSLikeDAO.class);
        // 좋아요가 이미 눌려 있는지 확인
        if (dao.snsUserLike(snsLikeDTO) == 0) {
            dao.snsInsertLike(snsLikeDTO);  // 좋아요 추가
        }
    }

    public void unlikePost(SNSLikeDTO snsLikeDTO) {
    	SNSLikeDAO dao = sqlSession.getMapper(SNSLikeDAO.class);
        // 좋아요가 눌려 있는 경우에만 삭제
        if (dao.snsUserLike(snsLikeDTO) > 0) {
        	dao.snsDeleteLike(snsLikeDTO);  // 좋아요 삭제
        }
    }

    public int getLikeCount(SNSLikeDTO snsLikeDTO) {
    	SNSLikeDAO dao = sqlSession.getMapper(SNSLikeDAO.class);
        return dao.snsCountLike(snsLikeDTO);  // 특정 게시글의 좋아요 수 조회
    }

    public boolean isLiked(SNSLikeDTO snsLikeDTO) {
    	SNSLikeDAO dao = sqlSession.getMapper(SNSLikeDAO.class);
        return dao.snsUserLike(snsLikeDTO) > 0;  // 사용자가 해당 게시글에 좋아요를 눌렀는지 확인
    }
	
}
