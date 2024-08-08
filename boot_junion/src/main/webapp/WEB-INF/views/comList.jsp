<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!-- 경력계산 민중 07/25 12:07 -->
			<%@ page import="java.util.Calendar" %>
				<%@ page import="java.util.Date" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<meta http-equiv="X-UA-Compatible" content="IE=edge">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title>기업정보</title>
						<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
						<link rel="stylesheet"
							href="${pageContext.request.contextPath}/css/jobpostingIndividualSupport.css">
						<!-- import font-awesome, line-awesome -->
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
						<!-- import pretendard font -->
						<link rel="stylesheet" as="style" crossorigin
							href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
						<!-- import js -->
						<script src="https://code.jquery.com/jquery-3.6.3.min.js"
							integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
							crossorigin="anonymous"></script>
						<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->

					</head>
					<style>
						:root {
							/* 컬러 모음 */
							--main-color: #FFA500;
							--color-black: #111;
							--color-white: #fff;
							--color-gray: #787878;
							--input-gray: #e5e5ec;
							--button-gray: #f7f7f7;
							--border-color-gray: #dadada;
							--font-size32: 32px;
							--font-size24: 24px;
							--font-size20: 20px;
							--font-size16: 16px;
							--font-size14: 14px;
							--font-size12: 12px;
						}




						/*    섹션    */

						section {
							display: flex;
							justify-content: center;

						}

						.wrap {
							min-width: 1200px;
							padding: 70px 0;
							box-sizing: border-box;
							display: flex;
						}

						.devlist {
							width: 1200px;
						}


						.selectbox {
							display: flex;
						}




						.selectbox .select .title {
							padding-left: 20px;
							margin: 0 0 30px 0;
							border: 1px solid var(--input-gray);
							border-radius: 10px;
							padding: 16px 20px;
							width: 1158px;
							display: flex;
						}

						.selectbox .icon {
							position: absolute;
						}

						.selectbox .icon {
							right: 380px;
							margin-top: 16px;
						}



						.filterbox {
							display: flex;
							margin-bottom: 64px;
						}


						.filterbox .right {
							width: initial;
							display: flex;
							margin-left: auto;
						}


						.filterbox .left {
							display: flex;
						}



						/* 버튼시작 */
						/* 
					240801 버튼 css수정
					민중
					 */
						.right .f1 .tab-btn.fil2 {
							margin-left: 8px;
							border: 1px solid var(--input-gray);
							background-color: var(--color-white);
							border-radius: 10px;

							width: 80px;
							height: 40px;
							cursor: pointer;
							background: #fff;
							color: #111;

							&:hover {
								background: var(--main-color);
								color: #fff;
							}
						}

						.right .f1 .tab-btn.fil2.active {
							background: #111;
							color: #fff;
						}

						/* 북마크 : 스크랩 기능 관련 CSS */
						.fa-bookmark {
							font-size: 20px;
							color: var(--input-gray);
							cursor: pointer;
						}

						.fa-bookmark.active {
							color: var(--main-color);
						}

						/* 버튼 끝 */


						/* .filterbox .fil
	{
	    margin: 0 14px 0 0;
	    border: 1px solid var(--input-gray);
	    border-radius: 10px;
	    padding: 14px 18px;
	    width: initial;
	    display: flex;
	    background-color: var(--color-white);
	} */


						.filterbox .fil .filter .last,
						.filterbox .fil2 .but1,
						.filterbox .fil3 .but1,
						.menutitle .company .c1,
						.menutitle .location .l1 {
							font-size: var(--font-size14);
							font-weight: 300;
						}

						.selectbox .title {
							font-size: var(--font-size16);
							font-weight: 300;
							width: 1100px;
							border: none;
							resize: none;

						}

						.sbox .select1 {
							height: 40px;
							border-radius: 10px;
							border: solid 1px var(--input-gray);
							padding: 0 15px;
							font-size: var(--font-size14);
							font-weight: 200;
							margin-right: 14px;
						}





						.menutitle .company {
							margin-bottom: 4px;
						}

						.mtlist {
							display: grid;
							grid-template-columns: 270px 270px 270px 270px;
							gap: 40px;
						}

						.menutitle {
							max-width: 270px;

						}

						/* 
					240801 기업이름 css수정
					민중
					 */
						.menutitle .title .t1 {
							font-size: var(--font-size16);
							font-weight: 600;
							/* 추가 */
							color: #111;
						}

						.menubox {
							display: flex;
							margin-bottom: 16px;
							position: relative;
						}

						/*
					24/08/05
					민중 기업목록 이미지
					css 수정 시작
					*/
						.menubox .con .image {
							width: 270px;
							height: 180px;
							/* background-image: url(../images/company.svg); */
							background-color: #dad1d1;
							background-position: center;
							background-size: cover;
							border-radius: 10px;

						}

						.con .uploadResult img {
							width: 270px;
							height: 180px;
							border-radius: 10px;
						}

						/*
					24/08/05
					민중 기업목록 이미지
					css 수정 끝
					*/

						.menubox .scrap {
							position: absolute;
							top: 15px;
							right: 12px
						}

						.menubox .a:hover {
							border: 1px solid var(--main-color);
							background-color: var(--main-color);
							color: var(--main-color);
						}






						.titlebox {
							width: 270px;
							height: 90px;
						}

						.titlebox .title {
							margin-bottom: 8px;
						}



						.mtlist {
							margin-bottom: 60px;
						}

						/* 페이징커스텀 */
						.div_page {
							margin-top: 40px;
						}

						.div_page ul {
							display: flex;
							align-items: center;
							justify-content: center;
							gap: 0 20px;
						}

						.paginate_button {
							text-decoration: none;
							padding: 8px 14px;
							border-radius: 6px;
						}

						.paginate_button a {
							color: #111;
						}
					</style>

					<body>
						<%@ include file="header.jsp" %>

							<!-- 섹션-->


							<!-- 섹션-->
							<section>
								<div class="wrap">
									<div class="devlist">
										<form method="get" id="searchForm">
											<div class="selectbox">
												<div class="select">
													<input class="title" type="text" name="keyword"
														value="${pageMaker.cri.keyword}" placeholder="검색어를 입력해 주세요">
												</div> <!-- 콘텐트박스 끝-->

												<div class="icon">
													<div class="i1">
														<a href="#" class="fa-solid fa-magnifying-glass"
															style="color: #ffa500;"></a>
													</div>
												</div>
											</div> <!-- selectbox 끝-->

											<!-- 추천순/최신순 탭 정보 보냄 -->
											<input type="hidden" name="orderType" id="orderType" value="${orderType}">
											<div class="filterbox">
												<div class="left">
													<div class="sbox">
														<select class="select1" id="stackSelect" name="stackType">
															<option value="" <c:out
																value="${pageMaker.cri.stackType == null ? 'selected':''}" />
															>기술스택 무관</option>
															<c:forEach var="stack" items="${stackList}">
																<option value="${stack}" <c:out
																	value="${pageMaker.cri.stackType eq stack ? 'selected':''}" />
																>${stack}</option>
															</c:forEach>
														</select>
													</div>
													<!-- selectbox 끝  -->
													<div class="sbox">
														<select class="select1" id="locationselect" name="locationType">
															<option value="" <c:out
																value="${pageMaker.cri.locationType == null ? 'selected':''}" />
															>지역 무관</option>
															<c:forEach var="location" items="${locationList}">
																<option value="${location}" <c:out
																	value="${pageMaker.cri.locationType eq location ? 'selected':''}" />
																>${location}</option>
															</c:forEach>
														</select>
														<button class="fil2">
															<div class="f1">
																<h5 class="but1">
																	검색
																</h5>
															</div>
														</button>
													</div>
													<!-- selectbox 끝  -->

												</div> <!-- 레프트 끝-->

												<div class="right">
													<div class="f1">
														<button
															class="tab-btn fil2 ${orderType == 'recommendation' ? 'active' : ''}"
															onclick="switchTab('recommendation', event)">추천순</button>
													</div>
													<div class="f1">
														<button
															class="tab-btn fil2 ${orderType == 'latest' ? 'active' : ''}"
															onclick="switchTab('latest', event)">최신순</button>
													</div>
													${orderType}
												</div>

												<input type="hidden" name="pageNum" value="1">
												<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
												<!-- 라이트 끝 -->
											</div>
										</form>
										<!-- filterbox 끝 -->

										<!-- <div class="selbox"> -->
										<!-- </div> -->
										<!-- <div class="selbox">
										<div class="sel">
											<button class="tab-btn active"
												onclick="switchTab(this, 'recommendation', event)">추천순</button>
										</div>
										<div class="sel">
											<button class="tab-btn"
												onclick="switchTab(this, 'latest', event)">최신순</button>
										</div>
									</div> -->

										<!-- ${comList} -->
										<div class="mtlist">
											<c:forEach var="dto" items="${comList}">
												<div class="menutitle">
													<div class="menubox">
														<a class="con" href="/comDetail?com_email=${dto.com_email}"
															data-com-email="${dto.com_email}">
															<div class="image">
																<div class="uploadResult">
																	<ul>

																	</ul>
																</div>
															</div>
														</a>
														<div class="scrap">
															<div class="s1">
																<c:choose>
																	<c:when
																		test="${fn:contains(getScrapList, dto.com_email)}">
																		<i id="bookmark${dto.com_email}"
																			class="fa-solid fa-bookmark active"></i>
																	</c:when>
																	<c:otherwise>
																		<i id="bookmark${dto.com_email}"
																			class="fa-solid fa-bookmark"></i>
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
													</div>

													<div class="titlebox">
														<a href="/comDetail?com_email=${dto.com_email}">
															<div class="title">
																<h5 class="t1">
																	${dto.com_name}
																</h5>
															</div>
														</a>
														<!-- <a href="연동 기업상세/index.html"> -->
														<div class="company">
															<h5 class="c1">
																★ ${dto.com_star}
															</h5>
														</div>
														<div class="location">
															<h5 class="l1">
																${dto.com_location} • ${dto.experienceYears}년차
																(${dto.com_year})
															</h5>
														</div>
													</div>
												</div>
											</c:forEach>
										</div> <!--  mtlist 끝-->

										<!-- 페이징 기능 시작-->
										<!--									<h3>${pageMaker}</h3>-->
										<div class="div_page">
											<ul>
												<c:if test="${pageMaker.prev}">
													<!-- <li>Previous</li> -->
													<li class="paginate_button">
														<a href="${pageMaker.startpage - 1}">
															Previous
														</a>
													</li>
												</c:if>
												<c:forEach var="num" begin="${pageMaker.startpage}"
													end="${pageMaker.endpage}">
													<!-- <li>${num}</li> -->
													<!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}>${num}</li> -->
													<!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}> -->
													<li class="paginate_button" ${pageMaker.cri.pageNum==num
														? "style='border:2px solid #FFA500; font-weight: 900';'" : "" }>
														<a href="${num}">
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
										</div> <!-- div_page-->

										<form id="actionForm" method="get">
											<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
											<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
											<!-- 페이징 검색시 페이지 번호 클릭할 때 필요한 파라미터 -->
											<input type="hidden" name="stackType" value="${pageMaker.cri.stackType}">
											<input type="hidden" name="locationType"
												value="${pageMaker.cri.locationType}">
											<!-- hidden 값 미스매치로 페이지가 나오지 않는 오류 있었음 -->
										</form>

									</div> <!-- devlist 끝 -->
								</div> <!-- wrap 끝 -->
							</section> <!--section 끝 -->

							<%@ include file="footer.jsp" %>
					</body>

					</html>
					<script>
						$(document).ready(function () {
							// 검색 버튼 클릭 이벤트
							$(".fa-magnifying-glass").on("click", function () {
								$("#searchForm").submit();
							});

							// 필터 버튼 클릭 이벤트
							$(".fil2").on("click", function () {
								$("#searchForm").submit();
							});

							// 추천순/최신순 탭 클릭 이벤트
							$(".tab-btn").on("click", function (event) {
								event.preventDefault();
								switchTab(this, this.innerText.trim() === "추천순" ? "recommendation" : "latest");
							});

							// 페이지 버튼 클릭 이벤트
							$(".paginate_button a").on("click", function (event) {
								event.preventDefault();
								var form = $('<form>', {
									method: 'get',
									action: 'comList'
								}).append($('<input>', {
									type: 'hidden',
									name: 'pageNum',
									value: $(this).attr("href")
								}));
								$('body').append(form);
								form.submit();
							});

							// con 클래스 반복하면서 데이터 가져옴
							$('.con').each(function () {
								var comEmail = $(this).data('com-email');
								var uploadResultContainer = $(this).find('.uploadResult ul');

								if (comEmail) {
									$.ajax({
										url: '/comFileList',
										type: 'GET',
										data: { com_email: comEmail },
										dataType: 'json',
										success: function (data) {
											showUploadResult(data, uploadResultContainer);
										},
										error: function (xhr, status, error) {
											console.error('Error fetching file list for com_email ' + comEmail + ':', error);
										}
									});
								}
							});
						});

						// 다른 탭 눌렀을 때 input 정보 삭제
						function switchTab(tab, type) {
							// 모든 tab-btn에서 'active' 클래스를 제거
							$('.tab-btn').removeClass('active');
							$(tab).addClass('active');

							// 'orderType' 히든 필드의 값을 설정하고 폼을 제출
							$('#orderType').val(type);
							$('#searchForm').submit();
						}

						function showUploadResult(uploadResultArr, uploadResultContainer) {
							if (!uploadResultArr || uploadResultArr.length === 0) {
								return;
							}

							var str = "";
							$(uploadResultArr).each(function (i, obj) {
								var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

								str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
								str += "<div>";
								str += "<span style='display:none;'>" + obj.fileName + "</span>";
								str += "<img src='/comListDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";
								str += "</div></li>";
							});

							uploadResultContainer.empty().append(str);
						}



						// 24.08.07 하진 : 관심 기업 정보 기능 추가
						var user_type = "${login_usertype}";
						$(".fa-bookmark").click(function () {
							if (user_type == 1) {

								let getid = $(this).attr("id");//해당 북마크의 id를 찾음
								let com_email = getid.replace("bookmark", "");
								const user_email = "${login_email}";
								var bookmark = document.getElementById(getid);

								$.ajax({
									type: "POST",
									url: "/comListScrap",
									data: {
										user_email: user_email,
										com_email: com_email
									},
									success: function (response) {
										if (response == true) {
											alert("관심 기업으로 등록되었습니다.");//아예 class명을을 삭제, 변경이 아니고 추가일 경우
											bookmark.classList.add('active');
										} else {
											alert("관심 기업에서 삭제되었습니다.");
											bookmark.classList.remove('active');

										}
									}
								});//end of ajax
							} else if (!user_type) {//user_type이 없으면 login 페이지로 이동
								location.href = "/login";
							}
						});//end of fa-bookmark clcik function

					</script>