package com.boot.Controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.DTO.SNSRoom;
import com.boot.Service.SNSChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/rooms")
public class SNSRoomController {
	
	private final SNSChatService chatService;
	
    public SNSRoomController(SNSChatService roomService) {
        this.chatService = roomService;
    }

    @PostMapping
    public ResponseEntity<SNSRoom> createRoom(@RequestBody SNSRoom room) {
    	log.info("@# createRoom");
    	chatService.createRoom(room);
        return ResponseEntity.status(HttpStatus.CREATED).body(room);
    }

    @GetMapping
    public ResponseEntity<List<SNSRoom>> getAllRooms(String senderId) {
    	log.info("@# getAllRooms");
        List<SNSRoom> rooms = chatService.getAllRooms(senderId);
        return ResponseEntity.ok(rooms);
    }
}
