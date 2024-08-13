package com.boot.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.ResumeDTO;
import com.boot.DTO.SNSDTO;
import com.boot.DTO.SNSIntroDTO;
import com.boot.DTO.UserDTO;
import com.boot.Service.SNSMyPageService;
import com.boot.Service.SNSService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SNSMyPageController {
	
	@Autowired
	private SNSMyPageService snsMyPageService;

	@Autowired
	private SNSService snsService;

	@RequestMapping("/snsUserPage")
	public String SNSUserPage(@RequestParam HashMap<String, String> param, Model model, HttpServletRequest httpServletRequest, String user_email) {
		log.info("@# snsUserPage");
		
		HttpSession session = httpServletRequest.getSession();
        session.getAttribute("login_usertype");
        session.getAttribute("login_email");
        
        model.addAttribute("login_usertype", session.getAttribute("login_usertype"));
        model.addAttribute("login_email", session.getAttribute("login_email"));

        // SNS 목록 가져오기
        ArrayList<SNSDTO> snsList = snsService.snsList();
        log.info("@# list" + snsList);
        // 모델에 SNS 목록 추가
        model.addAttribute("snsList", snsList);
		
//		ArrayList<SNSPostDTO> snsPostList = snsMyPageService.snsPostList();
//		log.info("@# list"+snsPostList);
		
//		String userEmail = "choimin0915@naver.com"; // 임시
//	    SNSIntroDTO snsIntro = snsMyPageService.getSNSIntro(userEmail);
//	    model.addAttribute("snsIntro", snsIntro);
	    
	    ResumeDTO resumeDTO = snsMyPageService.resumeInfo(param);
//        List<ResumeDTO> resumeDTO = snsMyPageService.resumeInfo(param);
	    model.addAttribute("resumeInfo", resumeDTO);
	    
//	    String user_email = (String)session.getAttribute("login_email");
	    UserDTO userDTO = snsMyPageService.getUserInfo(user_email);
	    log.info("@# UserInfo: " + userDTO);
	    model.addAttribute("userInfo", userDTO);
	    
	    SNSIntroDTO introDTO = snsMyPageService.getSNSIntro(user_email);
	    model.addAttribute("userIntro", introDTO);
	    
	    List<SNSIntroDTO> getSNSStack = snsMyPageService.getSNSStack(user_email);
	    model.addAttribute("SNSStack", getSNSStack);
	    
	    List<SNSIntroDTO> getSNSJob = snsMyPageService.getSNSJob(user_email);
	    model.addAttribute("SNSJob", getSNSJob);
	    
		
//		model.addAttribute("snsPostList", snsPostList);
		return "/snsUserPage";
	}
	
	@RequestMapping("/snsCompanyPage")
//	public String SNSCompanyPage(@RequestParam(value = "com_email", required = false) String com_email , Model model, HttpSession session) {
	public String SNSCompanyPage(String com_email , Model model, HttpSession session) {
		log.info("@# snsCompanyPage");
		
        ArrayList<SNSDTO> snsList = snsService.snsList();
        log.info("@# list" + snsList);
        // 모델에 SNS 목록 추가
        model.addAttribute("snsList", snsList);
		
		CompanyInfoDTO companyDTO = snsMyPageService.companyInfo(com_email);
		log.info("@# snsCompanyPage" + companyDTO);
		model.addAttribute("company", companyDTO);
		
		return "/snsCompanyPage";
	}
	
//	@RequestMapping("/snsMain")
//	public String SNSMain() {
//		log.info("@# snsMain");
//		
//		return "/snsMain";
//	}
	
}
