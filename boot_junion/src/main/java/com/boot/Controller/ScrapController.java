package com.boot.Controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.Service.ScrapService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScrapController {	@Autowired
	private ScrapService scrapService;
//
//@Autowired
//private PageService pageService;

@RequestMapping("/comScrap")
//public void comScrap(HashMap<String, String> param){//관심기업 스크랩
public ResponseEntity<Boolean> comScrap(@RequestParam HashMap<String, String> param){//관심기업 스크랩
	log.info("comScrap controller!!!");
	log.info("comScrap controller param!!! "+param);
	
	boolean result = scrapService.comScrap(param);
	return new ResponseEntity<Boolean>(result, HttpStatus.OK);
}

//@RequestMapping("/individualNoticeScrap") //스크랩 공고
//public String individualNoticeScrap(HttpServletRequest request, Model model, Criteria2 cri2) {
//	log.info("@# noticeScrap");	
//	
//	HttpSession session = request.getSession();
//	String user_email = (String)session.getAttribute("login_email");
//	log.info("@# noticeScrap  user_email=>"+user_email);	
//	
//	// 사용자정보의 스크랩 채용공고 목록 가져오기
//	ArrayList<ComNoticeDTO> list = pageService.noticelistWithPaging(cri2, request);
//	log.info("@# noticeScrap getNoticeScrapList=>"+list);		
//	model.addAttribute("noticeList", list);
//	log.info("@# noticeList=>" + list);
//	
//	int total = pageService.getNoticeTotalCount(user_email);
//	log.info("@# total=>"+total);
//	
//	log.info("@# cri2=>"+cri2);		
//	log.info("@# cri2 깃 수정중=>"+cri2);		
//	
//	model.addAttribute("pageMaker", new PageDTO(total,cri2));			
//					
//	
//	return "individualNoticeScrap";
//}





}
















