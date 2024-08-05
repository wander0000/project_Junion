package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.Standard;

public interface CardPageService {
	public ArrayList<ComNoticeDAO> cardPageList(Standard std);// 페이징을 위한 메소드
//	public ArrayList<ComNoticeDAO> cardPageList(CardPageDAO dao);// 페이징을 위한 메소드
	
	public List<ComNoticeAttachDTO> cardPageFileList(int notice_num); // 2024-08-01 지수 (공고 목록 사진 들고오기)
}
