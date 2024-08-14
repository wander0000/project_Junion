package com.boot.DAO;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.SNSFollowDTO;

@Mapper
public interface SNSFollowDAO {

	public void insertFollow(SNSFollowDTO followDTO);
	public void deleteFollow(SNSFollowDTO followDTO);
	public int isFollowed(SNSFollowDTO followDTO);
}
