package com.boot.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DTO.SNSDTO;
import com.boot.Service.SNSService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SNSController {

    @Autowired
    private SNSService snsService;

    // SNS 메인 페이지로 이동
//    @RequestMapping("/snsMain")
//    public String snsMain(HttpServletRequest httpServletRequest, Model model) {
//        log.info("@# snsMain");
//
//        HttpSession session = httpServletRequest.getSession();
//        session.getAttribute("login_usertype");
//        session.getAttribute("login_email");
//        
//        model.addAttribute("login_usertype", session.getAttribute("login_usertype"));
//        model.addAttribute("login_email", session.getAttribute("login_email"));
//
//        // SNS 목록 가져오기
//        ArrayList<SNSDTO> snsList = snsService.snsList();
//        log.info("@# list" + snsList);
//
//        // 모델에 SNS 목록 추가
//        model.addAttribute("snsList", snsList);
//
//        return "snsMain"; // snsMain 페이지 반환
//    }
    @RequestMapping("/snsMain")
    public String snsMain(HttpServletRequest httpServletRequest, Model model) {
        log.info("@# snsMain");

        HttpSession session = httpServletRequest.getSession();
        Object userType = session.getAttribute("login_usertype");
        Object email = session.getAttribute("login_email");

        // 사용자가 로그인하지 않은 경우
        if (userType == null || email == null) {
            // 로그인 페이지로 리디렉션
            return "redirect:/login"; 
        }

        // 로그인한 경우
        model.addAttribute("login_usertype", userType);
        model.addAttribute("login_email", email);

        // SNS 목록 가져오기
        ArrayList<SNSDTO> snsList = snsService.snsList();
        log.info("@# list" + snsList);

        // 모델에 SNS 목록 추가
        model.addAttribute("snsList", snsList);

        return "snsMain"; // snsMain 페이지 반환
    }
    
    // SNS 게시물 작성
    @RequestMapping("/snsPost")
    public String snsPost(SNSDTO snsdto, HttpServletRequest httpServletRequest, Model model) {
        log.info("@# snsPost");

        HttpSession session = httpServletRequest.getSession();
        session.getAttribute("login_usertype");
        session.getAttribute("login_email");
        
        model.addAttribute("login_usertype", session.getAttribute("login_usertype"));
        model.addAttribute("login_email", session.getAttribute("login_email"));


        // SNS 게시물 저장
        snsService.snsWrite(snsdto);
        log.info("@# SNSDTO=>" + snsdto);


        // 첨부 파일이 있을 경우 로그에 출력
        if (snsdto.getSNSAttachList() != null) {
            snsdto.getSNSAttachList().forEach(attach -> log.info("@# attach=>" + attach));
        }
        
        httpServletRequest.setAttribute("msg", "작성 완료!");
		httpServletRequest.setAttribute("url", "/snsMain");// snsMain 페이지로 리다이렉트

        return "alert"; 
    }
}
