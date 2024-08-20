package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import com.boot.DTO.SNSDTO;

public interface SNSService { 
	public ArrayList<SNSDTO> snsList();
	public ArrayList<SNSDTO> snsFollowPostList(String email);
	
	public SNSDTO findBySNSNum(int sns_num);
	public void snsWrite(SNSDTO snsDTO);
	
	public void snsCommentWrite(SNSDTO snsDTO);
	public ArrayList<SNSDTO> snsCommentList(int sns_num);
	
	List<SNSDTO> searchName(String searchName);
	
}