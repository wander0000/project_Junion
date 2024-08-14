package com.boot.DTO;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SNSFeedbackDTO {
	private String login_email;
	private int resume_num;
    private char user_type;
    private String feedback_content;
    private Timestamp feedback_date;
	
}
