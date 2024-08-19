package com.boot.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.DTO.SNSDTO;
import com.boot.DTO.SNSRecommendUserDTO;
import com.boot.Service.SNSRecommendUserService;
import com.boot.Service.SNSService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SNSController {

    @Autowired
    private SNSService snsService;
    
    @Autowired
    private SNSRecommendUserService snsRecommendService;
    

    @RequestMapping("/snsMain")
    public String snsMain(HttpServletRequest httpServletRequest, Model model) {
        log.info("@# snsMain");

        HttpSession session = httpServletRequest.getSession();
        int userType = Integer.parseInt(String.valueOf(session.getAttribute("login_usertype")));
        String email = (String) session.getAttribute("login_email");

        if (userType == 2) {
            return "redirect:/snsCompanyPage?com_email="+email;
        }

        // 로그인한 경우
        model.addAttribute("login_usertype", userType);
        model.addAttribute("login_email", email);

        // SNS 목록 가져오기
        ArrayList<SNSDTO> snsList = snsService.snsList();
        log.info("@# list" + snsList);

        // 모델에 SNS 목록 추가
        model.addAttribute("snsList", snsList);
        
        List<SNSRecommendUserDTO> userList = snsRecommendService.RecommendUserList(email);
    	model.addAttribute("userList",userList);
    	
    	List<SNSRecommendUserDTO> comList = snsRecommendService.RecommendComList(email);
    	model.addAttribute("comList",comList);

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
    
    // 실시간 검색 처리
    @GetMapping("/api/searchName")
    @ResponseBody
    public List<SNSDTO> searchName(@RequestParam("query") String query) {
        log.info("@# searchName with query: " + query);

        // 검색된 이름 목록 가져오기
        List<SNSDTO> filteredList = snsService.searchName(query);
        log.info("@# filteredList: " + filteredList);

        log.info("@# searchName with query: " + query);
        log.info("@# filteredList: " + filteredList);

        return filteredList;
    }
    
    // 댓글 작성 처리 (추가된 부분)
    @PostMapping("/api/commentWrite")
    @ResponseBody
    public SNSDTO commentWrite(@RequestBody SNSDTO snsDTO, HttpSession session) {
        log.info("@# commentWrite");

        // 세션에서 사용자 정보 가져오기
        String login_email = (String) session.getAttribute("login_email");
        char user_type = (char) session.getAttribute("login_usertype");
        String login_name = (String) session.getAttribute("login_name");

        // SNSDTO 객체에 로그인한 사용자 정보 설정
        snsDTO.setLogin_email(login_email);
        snsDTO.setUser_type(user_type);
        snsDTO.setSns_name(login_name);

        // 댓글 작성 서비스 호출
        snsService.snsCommentWrite(snsDTO);
        

        log.info("@# CommentDTO=>" + snsDTO);

        // 작성된 댓글 정보를 반환 (JSON 형식)
        return snsDTO;
    }
    
    @GetMapping("/api/snsCommentList")
    @ResponseBody
    public List<SNSDTO> snsCommentList(@RequestParam("sns_num") int snsNum) {
        return snsService.snsCommentList(snsNum);
    }
}
