package com.boot.DTO;

import lombok.Data;

@Data
public class SNSRecommendUserDTO {
	private String user_email;
	private String user_name;
	private String sns_intro;
	private String stack_names;
	private char user_type;
	
	private String com_email;
	private String com_name;
	private String com_content;
}
