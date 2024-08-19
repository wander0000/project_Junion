package com.boot.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SNSDTO {
	private int sns_num; // 게시글 넘버
	private String login_email; // 로그인 이메일
	private char user_type; // 유저 타입
	private String sns_title; // 제목
	private String sns_content; // 내용
	private String sns_date; // 날짜
	
	private String user_name; // 이름
	private String com_name; // 이름
	
	private String user_email; // 개인 이메일
	private String com_email; // 기업 이메일
	
	private String sns_name; // 이름
	private String sns_email; //이메일
	
	private List<SNSAttachDTO> SNSAttachList;  // 파일업로드 attachDTO를 가져와서 attachList에 담음
	
	private int sns_comment_num; //댓글 넘버
	private String sns_comment_content; // 댓글 내용
	private String sns_comment_date; //댓글 날짜
	
	private int commentCount; //댓글 갯수
}
