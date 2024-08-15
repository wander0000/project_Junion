package com.boot.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.DTO.SNSFollowDTO;
import com.boot.Service.SNSFollowService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/follow")
public class SNSFollowController {

	@Autowired
	private SNSFollowService followService;
	
    @PostMapping("/toggle")
    public int toggleFollow(@RequestBody SNSFollowDTO followDTO) {
    	log.info("@# toggleFollow");
    	log.info("@# followDTO=>"+followDTO);
    	
    	followService.toggleFollow(followDTO);
//        boolean success = followService.toggleFollow(followDTO);
//        log.info("@# success=>"+success);
        
//        return success ? "success" : "error";
        return followService.isFollowed(followDTO);
    }

    @PostMapping("/status")
    public int isFollowed(@RequestBody SNSFollowDTO followDTO) {
    	log.info("@# isFollowed");
    	log.info("@# followDTO=>"+followDTO);
    	log.info("@# followService.isFollowed()=>"+followService.isFollowed(followDTO));
    	
        return followService.isFollowed(followDTO);
    }
}
