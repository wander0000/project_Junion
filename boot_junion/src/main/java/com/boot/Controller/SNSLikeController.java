package com.boot.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.boot.DTO.SNSLikeDTO;
import com.boot.Service.SNSLikeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/sns")
public class SNSLikeController {

    @Autowired
    private SNSLikeService snsLikeService;

    @PostMapping("/like")
    @ResponseBody
    public String likePost(@RequestParam int snsNum, @RequestParam String loginEmail, @RequestParam int userType) {
        SNSLikeDTO snsLikeDTO = new SNSLikeDTO();
        snsLikeDTO.setSnsNum(snsNum);
        snsLikeDTO.setLoginEmail(loginEmail);
        snsLikeDTO.setUserType(userType);
        snsLikeService.likePost(snsLikeDTO);
        return "OK";
    }

    @PostMapping("/unlike")
    @ResponseBody
    public String unlikePost(@RequestParam int snsNum, @RequestParam String loginEmail, @RequestParam int userType) {
        SNSLikeDTO snsLikeDTO = new SNSLikeDTO();
        snsLikeDTO.setSnsNum(snsNum);
        snsLikeDTO.setLoginEmail(loginEmail);
        snsLikeDTO.setUserType(userType);
        snsLikeService.unlikePost(snsLikeDTO);
        return "OK";
    }

    @GetMapping("/like/count")
    @ResponseBody
    public int getLikeCount(@RequestParam int snsNum) {
        SNSLikeDTO snsLikeDTO = new SNSLikeDTO();
        snsLikeDTO.setSnsNum(snsNum);
        return snsLikeService.getLikeCount(snsLikeDTO);
    }

    @GetMapping("/like/status")
    @ResponseBody
    public boolean isLiked(@RequestParam int snsNum, @RequestParam String loginEmail, @RequestParam int userType) {
        SNSLikeDTO snsLikeDTO = new SNSLikeDTO();
        snsLikeDTO.setSnsNum(snsNum);
        snsLikeDTO.setLoginEmail(loginEmail);
        snsLikeDTO.setUserType(userType);
        return snsLikeService.isLiked(snsLikeDTO);
    }
}
