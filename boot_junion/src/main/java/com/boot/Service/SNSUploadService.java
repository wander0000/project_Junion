package com.boot.Service;

import java.util.List;

import com.boot.DTO.SNSAttachDTO;

public interface SNSUploadService {
	public List<SNSAttachDTO> snsGetFileList(int sns_num); // int타입 sns_num파라미터를 list타입 <SNSAttachDTO> getFileList로 사용하려함 / 파일열람
	public void snsDeleteFile(List<SNSAttachDTO> fileList);
}
