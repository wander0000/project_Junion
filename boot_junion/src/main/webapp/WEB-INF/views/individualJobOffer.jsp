<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-마이페이지-탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/individualMain.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<style>
	:root 
	{
	  /* 컬러 모음 */
	  --main-color:#FFA500;
	  --color-black: #111;
	  --color-white: #fff;
	  --color-gray: #787878;
	  --input-gray: #e5e5ec;
	  --button-gray: #f7f7f7;
	  --border-color-gray: #dadada;
	  --font-size32: 32px;
	  --font-size24: 24px;
	  --font-size16: 16px;
	  --font-size14: 14px;
	  --font-size12: 12px;
	}

	

	/* 드롭다운 메뉴 */
	.dorpdowmMain
	{
	display: flex;
	}

	.dropdown
	{
	display: flex;
	align-items: center;
	}

	.dropdownSub
	{
	display: flex;
	}

	.dropdownContent 
	{
	position: absolute;
	display: none;
	text-align: center;
	margin-top: 20px;
	width: 160px;
	background-color: var(--color-white);
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0,0,0,0.2);
	right: 11px;
	}

	.dropdownContent a 
	{
	color: var(--color-black);
	padding: 12px;
	text-decoration: none;
	display: block;
	font-size: var(--color-black);
	}
	
	/* 네비게이션 옆 컨텐츠 영역 */
.mainContent 
{
  width: calc( 100% - 260px);
  min-height: 100vh;
}

/* 헤더 */
.mainContent header 
{
  width: 100%;
  height: 90px;
  border-bottom: 1px solid var(--input-gray);
  padding: 0 40px;
  display: flex;
  align-items: center;
  box-sizing: border-box;
}

/* 헤더 아이디 영역 */
.mainContent header .userWrapper
{
  display: flex;
  white-space: nowrap;
  margin-left: auto;
  align-items: center;
}

.mainContent header .userWrapper img
{
  margin-right: 12px;
  width: 36px;
  height: 36px;
  border-radius: 50%;   
}

.mainContent header .userWrapper h4.name 
{
  font-size: var(--font-size14);
  margin-right: 12px;
}

/* 메인 */
main 
{
  display: flex;
  justify-content: center;
  padding: 50px 0 120px;  
}

main .mainContainer 
{
  max-width:1200px;
}

/* 프로필 : 사진 + 이름 */
main .mainContainer .memberInfo 
{
  display: flex;
  align-items: center;
  margin-bottom: 40px;
}

main .mainContainer .memberInfo img.memberImg 
{
  width:64px;
  height: 64px;
  margin-right: 20px;
}

main .mainContainer .memberInfo .memberName 
{
  font-size: var(--font-size32);
  font-weight: 600;
} 

main .mainContainer
{
display: flex;
flex-direction: column; 
min-width: 1200px;
gap: 40px 0;
}


	/* 타이틀 + 숫자*/
	.mainContainer .subtitle
	{
		display: flex;
		font-size: var(--font-size32);
		color: var(--color-black);
		/* margin-top: 70px; */
		gap : 0 20px;
  
	}

	.mainContainer .subtitle .listNum
	{
	color: var(--main-color);
	}


	/*sort tab 전체*/
	.mainContainer .listTable .searchWrap
	{
	  display: flex;
	  max-width: 1200px;
	  margin-bottom: 10px;
	  
	}


	/*sort tab 왼쪽*/
	.mainContainer .searchWrap .optionSortLeft
	{
	  display: flex;
	  align-items: center;
	  gap : 20px;
	  padding-left: 20px;
	}
	/*삭제 체크박스*/
	.mainContainer .searchWrap .optionSortLeft input
	{
	  width: 20px;
	  height: 20px;
	  border:1px solid var(--border-color-gray);
	  border-radius: 3px;
	  cursor: pointer;
	}

	/*삭제버튼*/
	.mainContainer .searchWrap .optionSortLeft button
	{
	  width: 65px;
	  height: 36px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  color: var(--color-gray);
	  font-size: var(--font-size16);
	  border-radius: 6px;
	  align-items:center;
	  justify-content:center;
	  cursor: pointer;
	}



	/*sort tab 오른쪽( 최신순, 마감인박) */
	.mainContainer .searchWrap .optionSorRight
	{
	  display: flex;
	  gap : 35px;
	  margin-left: auto ;
	  align-items:center;
	  font-size: 14px;
	}

	/*sort tab 오른쪽( 최신순, 마감인박) */
	.mainContainer .searchWrap .optionSorRight span
	{
	  display: flex;
	  gap: 5px;
	  margin-left: auto ;
	  align-items:center;
	  color: #222;
	}
	.mainContainer .searchWrap .optionSorRight label
	{
	  cursor: pointer;

	}

	/*sort tab 오른쪽( 최신순, 마감인박) */
	.mainContainer .searchWrap .optionSorRight input
	{
	  width: 15px;
	  height: 15px;
	  border:1px solid var(--border-color-gray);
	  border-radius: 3px;
	}




	/*제안 리스트*/
	main .mainContainer .offerList
	{
	  display: flex;
	  flex-direction: column;
	  gap: 20px 0;
	}

	/*하나의 제안 박스*/
	.mainContainer .offerList .postBox
	{
	  display: flex;
	  border: 1px solid var(--input-gray);
	  border-radius: 10px;
	  box-sizing: border-box;
	  padding: 20px;
	  width: 1200px;
	  height: 140px;
	  justify-content: flex-start;
	}

	/*제안박스 왼쪽*/
	.mainContainer .offerList .postBox .boxLeft
	{
	  width: 170px;
	  white-space: nowrap;
	  display: flex;
	  align-items:center;
	  gap: 20px;
	  color: #222;
	}

	/*제안박스 왼쪽(체크박스)*/
	.mainContainer .offerList .postBox .boxLeft input
	{
	  width: 20px;
	  height: 20px;
	  cursor: pointer;
	}

	/*제안박스 중간- 기업정보*/
	.mainContainer .offerList .postBox .boxMiddle
	{
	  width: 650px;
	  display: flex;
	  flex-direction: column;
	  /* align-items:center; */
	  justify-content:center;
	  gap: 10px 0;
	  padding-left: 60px;
	  cursor: pointer;
	  color: #222;
	}

	/* 기업명 */
	.postBox .boxMiddle .comStar
	{
	  display: flex;
	  gap: 0 10px;
	}
	postBox .boxMiddle .comStar .com_name
	{
	  font-size: var(--font-size16);
	}

	.postBox .boxMiddle .comInfo
	{
	  /* display: flex; */
	  font-size: var(--font-size14);
	  
	}




	/*제안 박스 오른쪽*/
	.mainContainer .offerList .postBox .boxRight
	{
	  margin-left: auto;
	  /* width: 175px; */
	  display: flex;
	  /* justify-content:center; */
	  align-items:center;
	  gap: 20px;
	}

	/* 미응답 자세히보기 */
	.boxRight span
	{
	  display: flex;
	  width: 135px;
	  height: 32px;
	  /* box-sizing: ; */

	}

	/*미응답,제안거절,지원완료*/
	.boxRight .offer_agree button
	{
	  width: 135px;
	  font-size: var(--font-size16);
	  align-items:center;
	  justify-content:center; 
	  border: none;
	  background:none;
	  color: #222;
	}

	/*자세히보기 버튼*/
	.boxRight .open 
	{
	  width: 135px;
	  height: 32px;
	  background-color: var(--button-gray);
	  border:1px solid var(--border-color-gray);
	  color: var(--color-gray);
	  font-size: var(--font-size16);
	  border-radius: 6px;
	  cursor: pointer;
	}


	/*휴지통아이콘*/ 
	.postBox .boxRight .delIcon
	{
	  font-size: var(--font-size16);
	  cursor: pointer;
	  color: #222;
	}





	/*팝업*/ 

	.popUp
	{
	  display: none;
	}


	.popBg 
	{
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100vw;
	  height: 100vh;
	  background:rgba(0,0,0,0.6);
	}

	.popCon
	{
	  background-color: #fff;
	  width: 800px;
	  /* height: 1000px; */
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%,-50%);
	  padding: 40px;
	}

	.postBox .popUp .popCon
	{
	  display: flex;
	  flex-direction: column;
	  gap: 40px 0;
	}

	.popH
	{
	  display: flex;
	  border-bottom: 1px solid var(--input-gray);
	  padding-bottom: 5px;
	}

	.popH .popHLeft
	{
	  display: flex;
	  flex-direction: column;
	  gap: 15px 0;
	}

	.popH h3
	{
	  font-size: var(--font-size24);
	}
	.popH h5
	{
	  font-size: var(--font-size14);
	}

	.popH .popHLeft .popH3
	{
	  display: flex;
	  gap:0 30px;
	}

	.popH .popHLeft .popH3 span
	{
	  display: flex;
	  gap: 0 5px;
	  color: var(--color-gray);
	}

	.popH .popHRight
	{
	  margin-left: auto;
	  width: 30px;
	  height: 30px;
	  font-size: 30px;
	}

	.popM
	{
	  display: flex;
	  flex-direction: column;
	  gap: 40px 0;
	  padding: 40px 0;
	}

	.popM .popM1
	{
	  line-height: 1.5em;
	  font-size: var(--font-size14);
	}

	/*이직제안 입력할 때 textarea로 넣은걸
	그대로 받으면 아래로 쓸수도 있음*/
	/* textarea {
	  width: 100%;
	  height: 6.25em;
	  border: none;
	  resize: none;
	} */


	.popM .popM2
	{
	  display: flex;
	  width: 720px;
	  height: 116px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  border-radius: 10px;
	  align-items:center;
	  /* justify-content:center; */
	  padding: 20px;
	}

	.popM .popM2 .popM2Left
	{
	  display: flex;
	  flex-direction: column;
	  gap: 10px 0;
	  font-size: var(--font-size16);
	}

	.popM .popM2 .popM2Left .detail
	{
	  display: flex;
	  gap: 0 40px;
	}
	.popM .popM2 .popM2Left h5
	{
	  font-size: var(--font-size14);
	}

	.popM .popM2 .popM2Right
	{
	 margin-left: auto;
	}

	.popM .popM3
	{
	  display: flex;
	  flex-direction: column;
	  gap: 10px 0;
	}

	.popM .popM3 .popM3Con
	{
	  font-size: var(--font-size14);
	}


	.popM .popM4
	{
	  display: flex;
	  width: 720px;
	  height: 116px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  border-radius: 10px;
	  align-items:center;
	  /* justify-content:center; */
	  padding: 20px;
	  gap: 0 40px;
	}

	.popM .popM4 .logo
	{
	  width: 120px;
	}

	.popM .popM4 .detail
	{
	  display: flex;
	  flex-direction: column;
	  gap: 10px 0;
	}

	.popM .popM4 .detail p
	{
	  font-size: var(--font-size1);
	}

	.popM .popM4 .detail label
	{
	  font-size: var(--font-size14);
	}

	.popM .popM4 .detail .detailB
	{
	  display: flex;
	  gap: 0 10px;
	}

	.popB
	{
	  display: flex;
	  gap: 0 20px;
	  justify-content: center;
	}

	.popB button
	{
	  width: 150px;
	  height: 46px;
	  background-color: initial;
	  border:1px solid var(--border-color-gray);
	  color: var(--color-gray);
	  font-size: var(--font-size16);
	  border-radius: 6px;
	  align-items:center;
	  justify-content:center;
	}



	/*페이징*/
	.mainContainer .listPaging
	{
	  display: flex;
	  justify-content:center;
	  max-width: 1200px;
	  margin-bottom: 70px;
	}


	
</style>
</head>
<body>
	<div class="container">
		<%@ include file="nav_individual.jsp" %>
	     <div class="mainContent">        
			<header>
				<div class="userWrapper">
					<img src="images/people.svg"alt="">
					<div class="dorpdowmMain">
						<div class="dropdown">
							<div class="dropdownSub" id="dropdownSub">
								<h4 class="name" name="user_name" style="cursor: pointer;">${login_name}</h4>
								<div class="dropdownContent" id="dropdownContent">
									<a href="userInfo"><div>개인 정보 관리</div></a>
									<a href="logout"><div>로그아웃</div></a>
								</div> <!-- dropdownContent 끝-->
								<span class="icon">
									<i id="iconDown" class="fa-solid fa-caret-down" style="display: block; cursor: pointer;"></i>
									<i id="iconUp" class="fa-solid fa-caret-up" style="display: none; cursor: pointer;"></i>
								</span>
							</div> <!--dropdownSub 끝-->
						</div> <!--dropdown 끝-->
					</div><!--dropdownMain 끝-->
				 </div>
			</header>    
	         <main>
	             <div class="mainContainer">
	                 <div class="subtitle">
	                     <h4 class="title">받은 제안</h4>
	                     <h4 class="listNum">${pageMaker.total}</h4>
	                 </div>
	                 <div class="listTable">
	                     <div class="searchWrap">
	                         <div class="optionSortLeft">
	                             <input type="checkbox" id="check_all" value="회사명">
								 <button class="selectDel">삭제</button>
	                         </div><!-- optionSortLeft 끝 -->
	                         <div class="optionSorRight">
	                             <span>
	                                 <input type="checkbox" id="desc" value="desc">
	                                 <label for="desc">최신순</label>
	                             </span>
	                             <span>
	                                 <input type="checkbox" id="urgent" value="urgent">
	                                 <label for="urgent">마감임박</label>
	                             </span>
	                         </div> <!-- optionSorRight 끝 -->                   
	                     </div><!-- searchWrap 끝 -->  
	                     <div class="offerList">
	                         <div class="postBox"><!-- 제안박스 시작 -->  
								 <c:forEach items="${offerList}" var="dto">		
									<div class="boxLeft">
										<input type="checkbox" name="offerListRow" id= "" class="normal">
										<p class="offer_date">${dto.offer_date}</p>
									</div><!-- boxLeft 끝-->
									<div class="boxMiddle">
										<h4 class="com_name">${dto.com_name}</h4>
										<div class="comInfo">
											<p>[${dto.notice_job}] [${dto.notice_career}] ${dto.notice_title}</p>
										</div><!-- comInfo 끝-->
									</div><!-- boxMiddle  끝-->
									<div class="boxRight">
										<div class="reponseStatus"> 
											<!-- 제안거절/지원완료/미응답 분기처리 --> 
											<!-- <button onclick="location.href='#'">미응답</button> -->
											<c:choose>
												<c:when test="${dto.offer_agree == 미응답}">
													<button>미응답</button>
													<!-- notice_num 가져갈 수 있도록 hidden -->
													<input type="hidden"id="noticeNum" value="${dto.notice_num}">  
												</c:when>
												<c:when test="${dto.offer_agree == 지원완료}">
													<button>지원완료</button>
													<!-- notice_num 가져갈 수 있도록 hidden -->
													<input type="hidden"id="resumeNum" value="${dto.resume_num}">  
												</c:when>
												<c:otherwise>
													<button>제안거절</button>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- <spn class="open"> -->
											<!-- <input type="button" id="opendetail" class="open" value="자세히보기"> -->
											<button  class="detailBtn">자세히보기</button>
										<!-- <label for="opendetail">자세히보기<label> -->
										<!-- </spn> -->
										<span class="delIcon">
											<i class="fa-regular fa-trash-can"></i>
										</span>
									</div><!-- boxRight 끝 -->   
									<!-- pop 영역 -->
									<div class="popUp disN">
										<div class="popBg">
											<div class="popCon disF flexD">
												<div class="popH">
													<div class="popHLeft">
														<div class="popH1">
															<!-- <h3 class="notice_title">[Junion][경력] 백엔드 개발자 채용</h3> -->
															<h3 class="notice_title">[${dto.notice_job}] [${dto.notice_career}] ${dto.notice_title}</h3>
														</div>
														<div class="popH2">
															<h5 class="com_name">${dto.com_name}</h5>
														</div>
														<div class="popH3">
															<span>
																<h5>제안일</h5>
																<h5>${dto.offer_date}</h5>
															</span>
															<span>
																<h5>응답기한</h5>
																<h5>${dto.notice_endDate}</h5>
															</span>
														</div>
													</div><!-- popHLeft 끝 -->
													<div class="popHRight" >
														<span class="icon cancel fs24">
															<i class="fa-solid fa-xmark"></i>
														</span>
													</div>
												</div><!-- popH 끝 -->  
												<div class="popM">
													<div class="popM1">
														<pre>${dto.offer_content}</pre><!-- 제안입력단 textarea 정보랑 일치시킬 것 -->
														<!-- <pre>안녕하세요. 주니온 입니다.<br>저희가 찾고있는 포지션에 적합한 인재라고 생각되어 이렇게 제안 드립니다.<br>긍정적인 검토 부탁 드리며, 관련 자세한 내용이 궁금하시다면 응답기간 내 회신 부탁 드립니다.</pre>제안입력단 textarea 정보랑 일치시킬 것 -->
														<!-- <textarea cols="50" rows="8"><c:out value="${content}" /></textarea>제안입력단 textarea 정보랑 일치시킬 것 -->
													</div>
													<div class="popM2">
														<div class="popM2Left">
															<h4 class="title">${dto.notice_title}</h4>
															<div class="detail">
																<p class="com_name">${dto.com_name}</p>
																<p class="com_location">${dto.com_location}</p>
															</div>
														</div>
														<div class="popM2Right">
															<a href="/jobPostDetail?notice_num=${dto.notice_num}">
																<i class="fa-solid fa-chevron-right"></i>
															</a>
														</div>
													</div>
													<div class="popM3">
														<h4 class="popM3Con title">인사담당자 정보</h4>
														<p class="popM3Con">${dto.com_person}</p>
														<p class="popM3Con">${dto.com_tel}</p>
														<p class="popM3Con">${dto.com_email}</p>
													</div>
													<div class="popM4">
														<!-- <div class="logo">
															<a href="#">
																<img src="images/logo.svg" alt="#">
															</a>
														</div> -->
														<div class="detail">
															<h4 class="com_name">${dto.com_name}</h4>
															<div class="detailB">
																<label for="comInfo" class="com_info">기업정보 보러가기</label>
																<div id="comInfo" class="chevron-right">
																	<a href="/comDetail?com_email=${dto.com_email}">
																		<i class="fa-solid fa-chevron-right"></i>
																	</a>
																</div>
															</div>
														</div>

													</div>
												</div><!-- popM 끝 --> 
												<div class="popB">
													<!-- <button class="submit tabBtn">거절</button> -->
													<!-- <button class="submit tabBtn">지원하기</button>이미지원했으면 지원완료로 떠야함 -->
													<c:choose>
														<c:when test="${dto.offer_agree == 미응답}">
															<input type="button" value="거절">
															<!-- offer_num 가져갈 수 있도록 hidden -->
															<input type="hidden"id="noticeNum" value="${dto.offer_num}">  
															<c:choose>
																<c:when test="${dto.resume_submitDate == null}">
																	<input type="button" class="submitResume" value="지원하기">
																	<!-- offer_num 가져갈 수 있도록 hidden -->
																	<input type="hidden"id="noticeNum" value="${dto.offer_num}">  
																</c:when>
																<c:otherwise>
																	<button>지원완료</button>
																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<button>${dto.offer_agree}</button>
														</c:otherwise>
													</c:choose>
												</div>    
											</div>
										</div> 
									</div><!-- pop 영역 끝 -->   
								</div><!-- postBox 하나의 제안 끝 --> 
							</c:forEach> 
	                     </div><!-- offerList 끝 -->    
	                 </div><!-- listTable 끝 --> 
					 <div class="div_page">
						<!-- <h5> 1  2  3  4  5  6  7  8 </h5> -->
						<ul>
						  <c:if test="${pageMaker.prev}">
							<!-- <li>Previous</li> -->
							<li class="paginate_button">
							  <a href="${pageMaker.startpage - 1}">
								Previous
							  </a>
							</li>
						  </c:if>
						  <c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
							<!-- <li>${num}</li> -->
							<!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}>${num}</li> -->
							<!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}> -->
							<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='border:2px solid #FFA500; font-weight: 900';'" : ""}>
							  <a href="/individualNoticeScrap?pageNum=${num}">
								${num}
							  </a>
							</li>
						  </c:forEach>
						  <c:if test="${pageMaker.next}">
							<!-- <li>next</li> -->
							<li class="paginate_button"><input type="hidden" name="">
							  <a href="${pageMaker.endpage + 1}">
								Next
							  </a>
							</li>
						  </c:if>
						</ul>
								</div><!-- div_page 끝 -->   
					  <!-- 데이터를 가지고 컨트롤러단으로 가기때문에 -->
						<!-- <form action="listWithPaging" method="get" id="actionForm"> -->
						<!-- <form action="list" method="get" id="actionForm"> -->
					  <form method="get" id="actionForm">
						<!-- 페이지 번호를 "pageNum" 이라는 이름으로 가져감 이건 굳이 보일필요는없기때문에 hidden type-->
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<!-- 페이지 검색시 페이지번호 클릭할 때 필요한 파라미터 -->
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					  </form> 
				  </div> <!-- mainContainer -->
	         </main>
	     </div><!-- mainContent-->
	 </div><!-- container 끝 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	$(document).ready(function()
	{
		/*
	    2024-07-02 서연주 
	    체크박스 선택
	    */
	   //체크박스 전체선택
	    $(".optionSortLeft input").on("click", function () {
	        var checked = $(this).is(":checked");
	        console.log("check_all");
	        console.log(checked);
	        
	        if(checked){
	            $(".offerList").find('input').prop("checked", true);
	        } else {
	            $(".offerList").find('input').prop("checked", false);
	        }
	    });
	    
	    // 체크박스 개별 선택
	    $(".normal").on("click", function() {
	        var checked = $(this).is(":checked");
	        console.log("click normal");
	        console.log(checked);
	    
	        if (!checked) {
	            $(".optionSortLeft input").prop("checked", false);
	        }else {
	            var is_checked = true;
	            
	            $(".normal").each(function(){
	              is_checked = is_checked && $(this).is(":checked");
	            });
	            
	            $(".optionSortLeft input").prop("checked", is_checked);
	          }
	    });
	
	    /*
	        2024-08-01 서연주
	     
	        자세히보기 누르면 팝업열리기
	    */
	    $("button.detailBtn").on("click",function(e){
	
	        e.preventDefault();
	        $(this).parents().siblings(".popUp").css({"display":"flex"});
	    });
	        
	    $('.popUp .icon.cancel').click(function(){
	        console.log("click");
	        $(this).parents('.popUp').css({"display":"none"}); 
	    }); 
	
	    $('button.cancel').click(function(){
	        console.log("click");
	        $(this).parents('.popUp').css({"display":"none"}); 
	    }); 
	
	
	
	
	
    /*
		2024-07-27 서연주 
		체크박스 누르고 삭제하기(휴지통버튼이나, 삭제하기 버튼 누르면)
		*/
		$(".selectDel").on("click", deleteValue);//삭제버튼 누르면 function 호출
		$("span.delIcon").on("click", deleteValue);//삭제버튼 누르면 function 호출

		function deleteValue() { //function 정의
			var cnt = $("input[name='offerListRow']:checked").length;
			var arr = new Array();
			$("input[name='offerListRow']:checked").each(function() {
				arr.push($(this).attr('id'));
			});
			//alert(arr);//com_email이 배열로 잘 담기는지 확인
			if(cnt == 0){
				alert("선택된 항목이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?");
				if (chk) {
					$.ajax
					({
						url:"offerDelete",
						type:'POST',
						traditional : true, //배열로 보내는 방법
						// dataType: 'json',
						data:{"arrStr" : arr},
						success: function(data) {
							if (data != 1) {
								alert("삭제성공");
								location.href = "individualJobOffer";
							} else {
								alert("삭제에 실패했습니다.");
							}
						},
						error: function() {
							alert("삭제를 완료하지 못했습니다. 다시 시도해주세요."); // 오류 시 알림
						}
					});// ajax 끝
				}
			}
		}// function deleteValue 끝

 /*
    2024-07-31 서연주 
    기업이름 누르면 기업정보 상세페이지로 새창(기업이메일 값 가지고 새 탭으로 이동)
    */
    $('.com_name').click(function(e){
      console.log("기업명 클릭 click");
      // window.open('/comDetail?com_email=${dto.com_email}','com_detail','top=100, left=200, width=1200, height=800, status=no, menubar=no, toolbar=no, resizable=yes, channelmode=yes');
      window.open('/comDetail?com_email=${dto.com_email}');//새 탭으로 이동으로 변경
    });

    /*
    2024-07-31 서연주 
    공고명 누르면 공고 상세페이지로 새창(공고번호 값 가지고 새 탭으로 이동)
    */
    // $('.jobPostTitle').click(function(e){
    //   console.log("공고명 클릭 click");
    //   // hidden input의 값(공고번호)를 가져옴
    //   // var noticeNumStr = $(this).siblings('.noticeNum').find('input[type="hidden"]').val(); // hidden input의 값(공고번호)를 가져옴
    //   var noticeNumStr = $(this).siblings('.noticeNum').val(); // hidden input의 값(공고번호)를 가져옴
    //   // alert(noticeNumStr);
      
    //   // noticeNumStr 값을 정수로 파싱합니다.
    //   var noticeNum = parseInt(noticeNumStr, 10);
    //   var url = '/jobPostDetail?notice_num=' + noticeNum; // url도 변수로 받음
      
    //   //새창으로 열기
    //   // window.open(url, 'notice_detail', 'top=100, left=200, width=1200, height=800, status=no, menubar=no, toolbar=no, resizable=yes');
    //   //새 탭으로 열기
    //   window.open(url);
      
    // });
    
    /*
    2024-07-31 서연주 
    지원하기 누르면 지원하기 페이지 새창(공고번호 가지고 새 창으로 /profileInfo매핑)
    */
   
    $('.submitResume').click(function(e){
      console.log("지원하기 클릭 click");
      // hidden input의 값(공고번호)를 가져옴
      // var noticeNumStr = $(this).siblings('.noticeNum').val(); // hidden input의 값(공고번호)를 가져옴
      var noticeNumStr = $(this).siblings('input[type="hidden"]').val(); // hidden input의 값(공고번호)를 가져옴
      // alert(noticeNumStr);

      // noticeNumStr 값을 정수로 파싱합니다.
      var noticeNum = parseInt(noticeNumStr, 10);
      var url = '/profileInfo?notice_num=' + noticeNum; // url도 변수로 받음
      //새창으로 열기
      window.open(url,'profileInfo','top=150, left=600, width=560, height=440, resizable = no, scrollbars = no');
      // window.open('/profileInfo?notice_num=${dto.notice_num}','profileInfo','top=100, left=200,width=500, height=270, resizable = no, scrollbars = no');
    });
    



    /*
    2024-07-29 서연주 
    필터링 선택하면 목록다시 조회(이벤트 리스너)
    */
    $('select#orderBy').on('change', function(event) {
      // alert("정렬버튼 누름")
        switchTab(this.value);
    });
    
    function switchTab(value) {
      // 선택된 값을 가진 새로운 폼을 동적으로 생성
      var form = $('<form>', {
          method: 'get',
          action: $('#searchForm').attr('action')
      });
  
      // 선택된 옵션값을 폼 데이터로 추가
      form.append($('<input>', {
          type: 'hidden',
          name: 'orderBy',
          value: value
      }));
  
      // 기존의 숨겨진 필드들을 폼에 추가
      form.append($('<input>', {
          type: 'hidden',
          name: 'pageNum',
          value: $('input[name="pageNum"]').val()
      }));
  
      form.append($('<input>', {
          type: 'hidden',
          name: 'amount',
          value: $('input[name="amount"]').val()
      }));
  
      // 폼을 바디에 추가하고 제출
      form.appendTo('body').submit();
  }


	});
</script>
<script>
    // 드롭다운 메뉴 (하지수)

    function dropdown() {
        let click = document.getElementById("dropdownContent");
        let iconDown = document.getElementById("iconDown");
        let iconUp = document.getElementById("iconUp");

        if (click.style.display === "none" || click.style.display === "") {
            click.style.display = "block";
            iconDown.style.display = "none";
            iconUp.style.display = "block";
        } else {
            click.style.display = "none";
            iconDown.style.display = "block";
            iconUp.style.display = "none";
        }
    }
    document.getElementById("dropdownSub").addEventListener("click", dropdown); // 드롭다운 메뉴 끝
</script>