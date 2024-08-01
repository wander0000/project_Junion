package com.boot.Controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DAO.ComNoticeDAO;
import com.boot.DTO.CardPageDTO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.Standard;
import com.boot.Service.CardPageService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class CardPageController {// 카드 형태 목록 페이징 처리를 위한 컨트롤러
	
	@Autowired
	private CardPageService pageService;
	
	@RequestMapping("/cardPageList")
//	@RequestMapping("/jobPostList")
	public String cardPageList(Standard std,Model model) {
		log.info("@# cardPage controller");
		log.info("@# cardPage controller std!!=>"+std);
		
		ArrayList<ComNoticeDAO> list = pageService.cardPageList(std);
		model.addAttribute("jobPost", list);
		model.addAttribute("paging", new CardPageDTO(123, std));
		return "/recruitmentNotice/jobPostList";
	}
	
	
// 2024-08-01 지수 (공고 목록 사진 들고오기)
//	이미지파일을 받아서 화면에 출력(byte 배열타입)
	@GetMapping("/cardPageDisplay")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName=>"+fileName);
		
//		업로드 파일경로+이름
		File file = new File("C:\\devv\\upload\\"+fileName);
		log.info("@# file=>"+file);
		
		ResponseEntity<byte[]> result=null;
		HttpHeaders headers=new HttpHeaders();
		
		try {
//			파일타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GetMapping(value = "/cardPageFileList")
	public ResponseEntity<List<ComNoticeAttachDTO>> cardPageFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# cardPageFileList()");
		log.info("@# param=>"+param);
		log.info("@# param=>"+param.get("notice_num"));
		
		return new ResponseEntity<>(pageService.cardPageFileList(Integer.parseInt(param.get("notice_num"))), HttpStatus.OK);
	}

}
