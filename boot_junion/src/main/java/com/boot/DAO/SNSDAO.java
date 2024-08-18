package com.boot.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.SNSDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface SNSDAO {  
	public ArrayList<SNSDTO> snsList();
	
	public SNSDTO findBySNSNum(int sns_num);
	public void snsWrite(SNSDTO snsDTO);
	
	public void snsCommentWrite(SNSDTO snsDTO);
	public ArrayList<SNSDTO> snsCommentList(int sns_num);
	
	List<SNSDTO> searchName(String searchName);
	
}


