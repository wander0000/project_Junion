package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.CardPageDAO;
import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.Standard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CardPageService")
public class CardPageServiceImpl implements CardPageService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<ComNoticeDAO> cardPageList(Standard std) {
//	public ArrayList<ComNoticeDAO> cardPageList(CardPageDAO dao) {
		log.info("CardPageServiceImpl");
		
		CardPageDAO dao = sqlSession.getMapper(CardPageDAO.class);
//		CardPageDAO daos = sqlSession.getMapper(CardPageDAO.class);
		ArrayList <ComNoticeDAO> list = dao.cardPageList(std);
//		ArrayList <ComNoticeDAO> list = daos.cardPageList(dao);
		
		return list;
	}

	
	// 2024-08-01 지수 (공고 목록 사진 들고오기)
	@Override
	public List<ComNoticeAttachDTO> cardPageFileList(int notice_num) {
		log.info("CardPageServiceImpl cardPageFileList");
		CardPageDAO dao = sqlSession.getMapper(CardPageDAO.class);
		
		return dao.cardPageFileList(notice_num);
	}

}
