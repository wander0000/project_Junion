package com.boot.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.SNSChat;
import com.boot.DTO.SNSRoom;

@Mapper
public interface SNSChatDAO {
    public List<SNSRoom> selectAllRooms(String senderId);
    public int checkRooms(@Param("senderId") String senderId, @Param("receiverId") String receiverId);
    public int getRooms(@Param("senderId") String senderId, @Param("receiverId") String receiverId);
    public void insertRoom(SNSRoom room);
    
    public List<SNSChat> selectMessagesByRoomId(int roomId);
    public void insertMessage(SNSChat chat);
}
