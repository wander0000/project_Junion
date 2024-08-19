package com.boot.DTO;

import lombok.Data;

@Data
public class SNSFollowDTO {
    private String loginEmail;
    private String followEmail;
    private int followUserType;
    private int followCount;
    private String user_name;
    private String com_name;
    }
