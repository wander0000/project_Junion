package com.boot.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.DTO.SNSRecommendUserDTO;
import com.boot.Service.SNSRecommendUserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SNSRecommendUserController {
	
	@Autowired
	private SNSRecommendUserService service;
	
	@RequestMapping("/SNSRecommendUser")
	public String recommendUserList(Model model, HttpServletRequest request) {
    	log.info("@# recommendUserList");
    	HttpSession session = request.getSession();
		
    	if ((String)session.getAttribute("login_email") == null) {
    		return "redirect:login";
		} else {
	    	String login_email = (String)session.getAttribute("login_email");
//	    	log.info("@# login_email=>"+login_email);
	    	model.addAttribute("login_email",login_email);
	    	
	    	List<SNSRecommendUserDTO> userList = service.RecommendUserList(login_email);
//	    	log.info("@# userList=>"+userList);
	    	model.addAttribute("userList",userList);
	    	
	    	List<SNSRecommendUserDTO> comList = service.RecommendComList(login_email);
//	    	log.info("@# comList=>"+comList);
	    	model.addAttribute("comList",comList);
	    	
	    	return "SNSRecommendUser";
		}
	}
}
