package com.boot.DAO;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.SNSLikeDTO;

@Mapper
public interface SNSLikeDAO {

	public void snsInsertLike(SNSLikeDTO snsLikeDTO);
	public void snsDeleteLike(SNSLikeDTO snsLikeDTO);
	public int snsCountLike(SNSLikeDTO snsLikeDTO);
	public int snsUserLike(SNSLikeDTO snsLikeDTO);
}
