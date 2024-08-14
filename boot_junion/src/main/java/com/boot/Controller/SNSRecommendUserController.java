package com.boot.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SNSRecommendUserController {
	
	@RequestMapping("/SNSRecommendUser")
	public String recommendUserList(Model model, HttpServletRequest request) {
    	log.info("@# recommendUserList");
    	HttpSession session = request.getSession();
		
    	if ((String)session.getAttribute("login_email") == null) {
    		return "redirect:login";
		} else {
	    	String login_email = (String)session.getAttribute("login_email");
	    	log.info("@# login_email=>"+login_email);
//	    	model.addAttribute("login_email",login_email);
	    	return "SNSRecommendUser";
		}
	}
}
