package com.boot.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
//@NoArgsConstructor
public class Standard {
	private int pageNum;// 페이지 번호
	private int amount;// 페이지당 글 갯수
	
	private String careerType;// 경력
	private String stackType;// 기술 스택
	private String locationType;// 지역
	private String hitType;// 지역
	private String keyword;//검색
	
	public Standard() {//카드 형식의 목록은 12개가 한 페이지 갯수
		this(1, 12);
	}

	public Standard(int pageNum, int amount) {//검색을 위해 추가
		this.pageNum = pageNum;
		this.amount = amount;		
	}
	
	
}
