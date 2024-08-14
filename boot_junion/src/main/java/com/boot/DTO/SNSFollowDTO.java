package com.boot.DTO;

import lombok.Data;

@Data
public class SNSFollowDTO {
    private String loginEmail;
    private String followEmail;
    private int followUserType;
}
