package com.boot.DTO;


import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SNSFeedbackDTO {
	private String login_email;
	private String user_name;
	private int resume_num;
    private char user_type;
    private String feedback_content;
    private LocalDate  feedback_date;
	
}
