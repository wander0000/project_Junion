package com.boot.DTO;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class noticeBoardCommentDTO {
	private int commentNo;
//	private String com_email;
	private String commentContent;
	private int board_no;
	private Timestamp commentCreatedTime;
	
	
	private String login_email;
}
