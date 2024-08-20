package com.boot.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.DTO.SNSChat;
import com.boot.DTO.SNSRoom;

@Mapper
public interface SNSChatDAO {
    public List<SNSRoom> selectAllRooms(String senderId); // 모든 채팅방 조회
    public int checkRooms(@Param("senderId") String senderId, @Param("receiverId") String receiverId); // 채팅방 유무 확인
    public int getRooms(@Param("senderId") String senderId, @Param("receiverId") String receiverId); // 채팅방 아이디 가져옴
    public void insertRoom(SNSRoom room); // 새로운 채팅방 생성
    
    public List<SNSChat> selectMessagesByRoomId(int roomId); // 특정 채팅방 메시지 조회
    public void insertMessage(SNSChat chat); // 새로운 메시지 삽입
    public void insertMessageStatus(SNSChat chat); // 새로운 메시지 삽입
    
	public String getUserName(String receiver_id); // 채팅상대 이름 가져옴

	public void markMessageAsRead(@Param("chatRoom_id") int chatRoom_id, @Param("user_id") String user_id); // 메시지 읽음으로 표시
}
