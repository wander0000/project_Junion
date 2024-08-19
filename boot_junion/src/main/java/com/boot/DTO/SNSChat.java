package com.boot.DTO;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SNSChat {
    private int chat_id;
    private int chatRoom_id;
//    private String user_name;
    private String sender_id;
    private String receiver_id;
    private String message;
    private Timestamp timestamp;
}
