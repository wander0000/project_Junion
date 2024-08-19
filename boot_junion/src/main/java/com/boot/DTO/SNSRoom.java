package com.boot.DTO;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SNSRoom {
    private int chatRoom_id;
    private String senderId;
    private String receiverId;
    
    private String user_name;
    private String sender_id;
    private String message;
    private Timestamp timestamp;
}
