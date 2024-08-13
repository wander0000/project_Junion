package com.boot.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SNSIntroDTO {
	private String user_email;
	private String sns_intro;
	
//	선호 직무, 스택
	private String stack_name;
	private String job_name;
}
