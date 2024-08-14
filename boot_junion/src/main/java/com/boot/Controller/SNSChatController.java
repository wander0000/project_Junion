package com.boot.Controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.DTO.SNSChat;
import com.boot.Service.SNSChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/messages")
public class SNSChatController {
	
	private final SNSChatService chatService;
	
    public SNSChatController(SNSChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping("/room/{roomId}")
    public ResponseEntity<List<SNSChat>> getMessagesByRoomId(@PathVariable int roomId) {
    	log.info("@# getMessagesByRoomId");
        List<SNSChat> messages = chatService.getMessagesByRoomId(roomId);
        return ResponseEntity.ok(messages);
    }

    @PostMapping
    public ResponseEntity<SNSChat> sendMessage(@RequestBody SNSChat chat) {
    	log.info("@# sendMessage");
        chatService.addMessage(chat);
        return ResponseEntity.status(HttpStatus.CREATED).body(chat);
    }
}
