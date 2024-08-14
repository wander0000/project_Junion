package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import com.boot.DTO.SNSDTO;

public interface SNSService { 
	public ArrayList<SNSDTO> snsList();
	
	public SNSDTO findBySNSNum(int sns_num);
	public void snsWrite(SNSDTO snsDTO);
	
	List<SNSDTO> searchName(String searchName);
	
}