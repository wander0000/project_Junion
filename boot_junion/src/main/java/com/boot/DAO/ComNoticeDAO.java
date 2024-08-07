package com.boot.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.RecentNoticeDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SubmitDTO;

public interface ComNoticeDAO {
	public ArrayList<ComNoticeDTO> JobPostCard();//채용공고(카드형) 목록 가져오기
	
	// 상세공고로 이동
	public void hitUP(int notice_num);//채용공고 선택시 조회수 증가
	public ComNoticeDTO JobPost(int notice_num);//상세 채용공고 정보 가져오기
	public ArrayList<ComNoticeDTO> otherJobPost(int notice_num);//상세 채용공고, 해당 기업의 다른 공고 정보 가져오기

	
	// 기업 상세페이지 : 사이드 공고 부분
	public ArrayList<ComNoticeDTO> getNoticeLimit(String com_eamil);//기업정보 상세, 해당 기업의 다른 공고 정보 가져오기
	
	
	// 지원하기 팝업 발생
	public ComNoticeDTO getNoticeInfo(int notice_num);//지원하기 클릭, 팝업창에 공고 정보 가져오기
	public ArrayList<ResumeDTO> getProfileList(String user_email);//지원하기 클릭, 팝업창에 이력서 정보 가져오기
	public int getOfferNum(@Param("notice_num") int notice_num, @Param("user_email") String user_email);//지원하기 클릭, 제안한 내용이 있는지 확인 0804연주
	public void updateOfferStatus(@Param("notice_num") int notice_num, @Param("user_email") String user_email);//offer_agree=지원완료, resume_submitDate=현재날짜 offer테이블에 저장하기 0804 연주
	
	//공고 지원 처리
	public ArrayList<SubmitDTO> getResumeNum(int notice_num);//이력서 선택, 지원 완료시 submit 테이블에 이력서 배열값 가져오기
	public boolean findOfferUser(HashMap<String, String> param);//지원 버튼 클릭시, 포지션 제안을 받은 회원인지 확인
	

	public void updateSubmitData(HashMap<String, String> param);//이력서지원정보 저장
		
	

    
	public void registerNotice(ComNoticeDTO comNoticeDTO); //공고등록
	public void noticeInsertStack(ComNoticeDTO comNoticeDTO); //공고등록-스택 테이블 insert
	public void noticeStauts(ComNoticeDTO comNoticeDTO); //공고 상태 업데이트
	
	public List<String> getNoticeStack(ComNoticeDTO comNoticeDTO); //공고수정-스택 테이블 select
	public void updateRegisterNotice(ComNoticeDTO comNoticeDTO); //공고 수정
	public void noticeDeleteStack(int notice_num); //공고수정- 스택 삭제
	
//	파일업로드는 파라미터를 DTO 사용
	public void registInsertFile(ComNoticeAttachDTO vo);  // 파라미터가 ComNoticeAttachDTO / 파일추가
	public List<ComNoticeAttachDTO> registGetFileList(int notice_num); // int타입 notice_num파라미터를 list타입 <ComNoticeAttachDTO> getFileList로 사용하려함 / 파일열람
	public void registDeleteFile(String notice_num);  // notice_num 맞춰서 파일삭제로직 / 파일삭제
	
    public List<Integer> getNoticeNums(@Param("com_email") String com_email); //notice_num 배열 가져오기
    
    
    public int checkRecentNotice(RecentNoticeDTO dto); //최근본공고테이블에 같은 값이 있는지 확인(연주0730)
    public void updateRecentNotice(RecentNoticeDTO dto); //공고파일 열람하면 최근본공고테이블에 정보저장(연주0730)

	
}
