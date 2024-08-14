package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.SNSDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface SNSDAO {  
	public ArrayList<SNSDTO> snsList();
	
	public SNSDTO findBySNSNum(int sns_num);
	public void snsWrite(SNSDTO snsDTO);
	
}


