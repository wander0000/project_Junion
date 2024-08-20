package com.boot.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boot.DAO.SNSChatDAO;
import com.boot.DTO.SNSChat;
import com.boot.DTO.SNSRoom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SNSChatService {
	
	private final SNSChatDAO snsChatDAO;
	
	//생성자
    public SNSChatService(SNSChatDAO snsChatDAO) {
        this.snsChatDAO = snsChatDAO;
    }

    // roomService
    // 모든 채팅방 조회
    public List<SNSRoom> getAllRooms(String senderId) {
    	log.info("@# getAllRooms");
        return snsChatDAO.selectAllRooms(senderId);
    }

    // 채팅방 유무 조회
    public int checkRooms(String senderId, String receiverId) {
    	log.info("@# checkRooms");
    	return snsChatDAO.checkRooms(senderId, receiverId);
    }
    
    // 채팅방 조회
    public int getRooms(String senderId, String receiverId) {
    	log.info("@# getRooms");
    	return snsChatDAO.getRooms(senderId, receiverId);
    }

    // 채팅방 생성
    public void createRoom(SNSRoom snsRoom) {
    	log.info("@# createRoom");
    	snsChatDAO.insertRoom(snsRoom);
    }
    
    
    // chatService
    public List<SNSChat> getMessagesByRoomId(int roomId) {
    	log.info("@# getMessagesByRoomId");
    	log.info("@# roomId=>"+roomId);
    	List<SNSChat> list = snsChatDAO.selectMessagesByRoomId(roomId);
    	log.info("@# list=>"+list);
        return list;
    }

    public void addMessage(SNSChat snsChat) {
    	log.info("@# addMessage");
    	log.info("@# snsChat=>"+snsChat);
    	snsChatDAO.insertMessage(snsChat);
    }

	public String getUserName(String receiver_id) {
		String receiverName = snsChatDAO.getUserName(receiver_id);
		return receiverName;
	}
}
