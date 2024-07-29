<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>
 
</head>
<body>
    <%@ include file="header.jsp" %>

    <main>
        <div class="banner">
            <div class="mainBanner">
                <div class="content">
                    <h5 class="comTitle">JUNION</h5>
                    <h5 class="mainTitle">주니온에서 지원하는</h5>
                    <h5 class="mainTitle">신입개발자 취업성공패키지</h5>
                    <div class="descText">면접에서부터 실무에서 필요한 스킬력까지 책임집니다.</div>
                    <div class="descText">면접에서부터 실무에서 필요한 스킬력까지 책임집니다.</div>
                </div>
                <div class="bannerImage"></div>
            </div>
        </div><!--banner 끝-->
            <div class="innerCon">
                <section>
                    <div class="sectionA">
                        <div class="sectionName">
                            <div class="subtitle">신입 개발자 채용</div>
                                <a href="#" class="more">더보기
                                    <i class="fa-solid fa-angle-right"></i>
                                </a>
                        </div><!--sectionName-->

                        <div class="cardPost">
                            <c:forEach items="${mainNotice}" var="dto">
                                <a class="con" href="jobPostDetail?notice_num=${dto.notice_num}" data-notice-num="${dto.notice_num}">
                                    <div class="image">
                                        <div class="uploadResult">
                                            <ul>

                                            </ul>
                                        </div>
                                        <!-- <input type="hidden" name="notice_num" value="${dto.notice_num}"> -->
                                    </div>
                                    <div class="postSub">
                                        <div class="category">
                                            ${dto.com_name}
                                        </div>
                                        <div class="name">
                                            ${dto.notice_title}
                                        </div>
                                    </div>
                                </a><!-- con 끝 -->
                            </c:forEach>
                        </div><!-- cardPost 끝 -->
                        
                    </div><!--sectionA 끝-->
                    <div class="sectionB">
                        <div class="sectionName">
                            <div class="subtitle">기업 공고</div>
                            <a href="#" class="more">더보기
                                <i class="fa-solid fa-angle-right"></i>
                            </a>
                        </div><!--sectionName-->
                        <div class="themaCon">
                            <div class="postThema">
                                <div class="sectionName">
                                    <h5 class="subtitle"><span>신입</span> TOP 50</h5>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <c:forEach items="${mainNewCareer}" var="dto" varStatus="status">
                                            <a href="jobPostDetail?notice_num=${dto.notice_num}">
                                                <li class="data a ${status.first ? 'first-item' : ''}">
                                                    <h5 class="number"><span>${status.index+1}</span></h5>
                                                    <div class="name">
                                                        <div class="conTitle">${dto.com_name}</div>
                                                        <div class="conSub">${dto.notice_title}</div>
                                                    </div>
                                                    <div class="dDay"><span>D-${dto.noticeDday == 0 ? 'DAY' : dto.noticeDday}</span></div>
                                                </li>
                                            </a>
                                        </c:forEach> 
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                            <div class="postThema">
                                <div class="sectionName">
                                    <div class="subtitle"><span>경력</span> 인기 TOP 50</div>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <c:forEach items="${mainCareerhit}" var="dto" varStatus="status">
                                            <a href="jobPostDetail?notice_num=${dto.notice_num}">
                                                <li class="data a ${status.first ? 'first-item' : ''}">
                                                    <h5 class="number"><span>${status.index+1}</span></h5>
                                                    <div class="name">
                                                        <div class="conTitle">${dto.com_name}</div>
                                                        <div class="conSub">${dto.notice_title}</div>
                                                    </div>
                                                    <div class="dDay"><span>D-${dto.noticeDday == 0 ? 'DAY' : dto.noticeDday}</span></div>
                                                </li>
                                            </a>
                                        </c:forEach> 
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                            <div class="postThema">
                                <div class="sectionName">
                                    <div class="subtitle"><span>오늘</span> 뜬 인기 TOP 50</div>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <c:forEach items="${mainTodayhit}" var="dto" varStatus="status">
                                            <a href="jobPostDetail?notice_num=${dto.notice_num}">
                                                <li class="data a ${status.first ? 'first-item' : ''}">
                                                    <h5 class="number"><span>${status.index+1}</span></h5>
                                                    <div class="name">
                                                        <div class="conTitle">${dto.com_name}</div>
                                                        <div class="conSub">${dto.notice_title}</div>
                                                    </div>
                                                    <div class="dDay"><span>D-${dto.noticeDday == 0 ? 'DAY' : dto.noticeDday}</span></div>
                                                </li>
                                            </a>
                                        </c:forEach> 
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                        </div><!--themaCon-->
                    </div><!--sectionB 끝-->
                </section>
            </div><!--innerCon 끝-->
            
            <div class="subBanner">
                <a href="#" class="content">
                    <div class="bannerTitle">주니온에서 지원하는 신입개발자 취업성공패키지</div>
                    <div class="bannerSubTitle">면접에서 부터 실무에서 필요한 스킬력까지 책임집니다.</div>
                </a><!--content 끝-->
            </div><!--subBanner 끝-->
            
            <div class="innerCon">
                <div class="sectionC">
                    <div class="sectionName">
                        <div class="subtitle">추천 기업</div>
                        <a href="#" class="more">더보기
                            <i class="fa-solid fa-angle-right"></i>
                        </a>
                    </div><!--sectionName 끝-->
                    <div class="postSection">
                        <c:forEach items="${mainRecommendCom}" var="dto">
                            <div class="a" data-com-email="${dto.com_email}">
                                <div class="conImage">
                                    <div class="uploadResult">
                                        <ul>

                                        </ul>
                                    </div>
                                </div>
                                <div class="conProfile">
                                    <div class="conTitle">${dto.com_name}</div>
                                    <div class="conSec">여기에 뭐 넣어여?</div>
                                </div>
                                <button type="button" class="more">바로가기</button>
                            </div>
                        </c:forEach>
                    </div><!--postSection 끝-->
                </div><!--sectionC 끝-->
            </div><!--innerCon 끝-->
        </main>



        <footer>
            <div class="footerInner">
                <div class="left_conWrap f_conWrap">
                    <h5 class="logo">
                        <a href="#">
                            <img src="images/logo.svg" alt="#">
                        </a>
                    </h5>
                    <p class="textWrap">
                        부산광역시 부산진구 중앙대로 688 한준빌딩 2층<br>
                        대표이사 : 주니온<br>
                        사업자등록번호 : 123-45-67890 / 통신판매업신고 : 9999-12345호<br>
                        이메일 : abcde@naver.com
                    </p>
                </div>
                <div class="right_conWrap f_conWrap">
                    <h3>1234-5678</h3>
                    <p class="textWrap">                        
                        오전 9시 ~ 오후 6시(토요일, 공휴일 휴무)<br>
                        Copyright ⓒ JUNION ALL RIGHTS RESERVED.
                    </p>
                </div>
            </div>
        </footer><!--footer 끝-->
    </div>
</body>
</html>
<script>

 $(document).ready(function () {
    // con클래스 반복하면서 데이터 가져옴
    $('.con').each(function () {
        // con클래스 data-notice-num 속성에서 값을 가져옴
        var noticeNum = $(this).data('notice-num');
        
        // 현재 con클래스 .uploadResult 요소를 선택
        var uploadResultContainer = $(this).find('.uploadResult ul');

        if (noticeNum) {
            $.ajax({
                url: '/mainRegistFileList',
                type: 'GET',
                data: { notice_num: noticeNum },
                dataType: 'json',
                success: function(data) {
                    showUploadResult(data, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for notice_num ' + noticeNum + ':', error);
                }
            });
        } 
    });
    $('.a').each(function () {
        var comEmail = $(this).data('com-email');
        
        var uploadResultContainer = $(this).find('.uploadResult ul');

        if (comEmail) {
            $.ajax({
                url: '/mainComFileList',
                type: 'GET',
                data: { com_email: comEmail },
                dataType: 'json',
                success: function(data) {
                    showUploadResult(data, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for com_email ' + comEmail + ':', error);
                }
            });
        }
    });
});

function showUploadResult(uploadResultArr, uploadResultContainer){
    if (!uploadResultArr || uploadResultArr.length == 0) {
        return;
    }

    var str = "";

    $(uploadResultArr).each(function (i, obj) {
        var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

        str += "<li data-path='" + obj.uploadPath + "'";
        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
        str += "<div>";
        str += "<span style='display:none;'>" + obj.fileName + "</span>";
        str += "<img src='/mainDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
        str += "</div></li>";
    });

    uploadResultContainer.empty().append(str);
}

</script>