package com.boot.Service;

import java.util.List;

import com.boot.DTO.ResumeUploadDTO;

public interface ResumeUploadService {
	public List<ResumeUploadDTO> resumeGetFileList(int resume_num);
	public void resumeDeleteFile(List<ResumeUploadDTO> fileList);
	void deleteResumeImage(int resume_num);
	void resumeInsertFile(ResumeUploadDTO vo);
}
