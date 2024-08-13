<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>snsMypage</title>
            <!-- import font-awesome, line-awesome -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}css/snsCompanypage.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
            <!-- import js -->
            <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        </head>

        <body>
            <c:set var="com_email" value="${param.com_email}" />
            <div class="snsContainer">
                <%@ include file="sns_nav.jsp" %>

                    <div class="snsContent">
                        <%@ include file="sns_header.jsp" %>

                            <main>
                                <section class="snsCompanyPage">
                                    <div class="bgH"></div>
                                    <div class="contentWrap">
                                        <div class="content profile">
                                            <div class="profileInfo">
                                                <img class="img" src="/images/n.png" alt="">
                                                <h3 class="name">${company.com_name}</h3>
                                                <p class="com_content">${company.com_content}</p>
                                                <button class="following">팔로잉</button>
                                            </div>
                                            <div class="profileCon follower">
                                                <div class="follow">
                                                    <h5 class="proflieConTitle">팔로워</h5>
                                                    <span class="icon">
                                                        <i class="fa-regular fa-thumbs-up" style="cursor: pointer;"></i>
                                                    </span>
                                                </div>
                                                <h3 class="followerNum">20</h3>
                                            </div>
                                            <div class="profileCon CEO">
                                                <h5 class="proflieConTitle">CEO</h5>
                                                <div class="positionWrap">
                                                    <h3>${company.com_person}</h3>
                                                </div>
                                            </div>
                                            <div class="profileCon tel">
                                                <h5 class="proflieConTitle">번호</h5>
                                                <div class="positionWrap">
                                                    <h3>${company.com_tel}</h3>
                                                </div>
                                            </div>
                                            <div class="profileCon location">
                                                <h5 class="proflieConTitle">주소</h5>
                                                <div class="positionWrap">
                                                    <h3>
                                                        ${company.com_location}
                                                    </h3>
                                                </div>
                                            </div>
                                            
                                            <!--				임시로 네이버로 연결-->
                                            <a href="comDetail?com_email=${com_email}" type="button"
                                                class="detailPage">상세 페이지</a>
                                        </div>
                                        <div class="content info">
                                            <div class="tabWrap">
                                                <div class="tab board active">게시글</div>
                                            </div>

                                            <div class="contentBoard active">
                                                <div class="contentBoardWrap">
                                                    <button class="writing">작성하기</button>
                                                    <div class="boardProCon">
                                                        <img class="img" src="/images/n.png" alt="">
                                                        <h5 class="boardWriter">네이버</h5>
                                                        <span class="icon">
                                                            <i class="fa-solid fa-ellipsis-vertical"></i>
                                                        </span>
                                                        <div class="option">
                                                            <h5>수정하기</h5>
                                                            <h5>삭제하기</h5>
                                                        </div>
                                                    </div>
                                                    <div class="boardContent">
                                                        <img class="boardImg" src="/images/n2.jpg" alt="">
                                                        <p>
                                                            메인 화면은 네이버 서비스 시작 이래 웹 페이지 디자인 트렌드가 사실적인 묘사에서 심플하고
                                                            직관적인 묘사를 중시하는 방향으로 변화함에 따라, 화면 상단에 있는 일명 '초록창'이라 불리는
                                                            검색창과 실시간 검색어 서비스라는 큰 틀은 유지한 채 지속적으로 개편되어 왔다.
                                                            실시간 검색어 서비스의 경우 사회 이슈나 트렌드 파악에 많은 도움이 되었으나,
                                                            선거 등 각종 커다란 사회 및 정치적 이슈 등이 발생할 때마다 조작 등의 의혹이 불거져 온 탓에
                                                            2020년 4월 15일 21대 총선 투표 종료 이후 검색어 설정을 한 상태에서만 실시간 검색어가 표시되도록
                                                            정책이 바뀌었으나, 2021년 2월 25일부로 완전 폐지되었다.# 현재 서비스 중인 항목은 아래와 같으며
                                                            폐지한 항목은 취소선 처리했다.
                                                        </p>
                                                    </div>
                                                    <div class="boardIcon">
                                                        <div class="left_icon">
                                                            <!-- 좋아요 -->
                                                            <i class="fa-regular fa-heart fa-xl"></i>
                                                            <!-- 댓글 -->
                                                            <i class="fa-regular fa-comment fa-xl"></i>
                                                        </div>
                                                    </div>
                                                </div> <!-- contentBoardWrap -->
                                            </div> <!-- contentBoard -->
                                        </div>
                                    </div>
                                </section>
                            </main>
                    </div>
            </div>
        </body>

        </html>
        <script>
            $(document).ready(function () {

                $('span.icon').click(function () {
                    $('.option').addClass('active');
                });

                $('.option h5').click(function () {
                    $('.option.active').removeClass('active');
                });

                // '작성하기' 버튼 클릭 시 모달 열기
                $('.writing').on('click', function (event) {
                    event.preventDefault();
                    $('#writeModal').css('display', 'flex');
                    $('body').css({
                        'overflow': 'hidden',
                        'margin-right': '0px' // 스크롤바 너비만큼 오른쪽 마진 추가
                    });
                });

            });
        </script>