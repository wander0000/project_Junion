<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>snsCompanypage</title>
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
                                            <!-- <p class="com_content">${company.com_content}</p> -->
                                            <button class="following">팔로잉</button>
                                            <a href="comDetail?com_email=${com_email}" type="button"
                                                class="detailPage">상세
                                                페이지</a>
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

                                    </div>
                                    <div class="content info">
                                        <div class="tabWrap">
                                            <div class="tab board active">게시글</div>
                                        </div>


                                        <div class="contentBoard active">
                                            <div class="contentBoardWrap">
                                                <c:if test="${com_email == sessionScope.login_email}">
                                                    <button class="writing">작성하기</button>
                                                </c:if>
                                                <c:forEach items="${snsList}" var="dto">
                                                    <c:if test="${dto.login_email == com_email}">
                                                        <div class="detailBox" data-sns-num="${dto.sns_num}">
                                                            <div class="userBox" data-user-type="${dto.user_type}"
                                                                data-user-email="${dto.login_email}">
                                                                <div class="left">
                                                                    <div class="UserImage">
                                                                        <ul>
                                                                            <img src="images/people.svg" alt="#"
                                                                                class="img">
                                                                        </ul>
                                                                    </div>
                                                                </div><!--left 끝-->
                                                                <div class="nameBox">
                                                                    <!-- <h4>수지야</h4> -->
                                                                    <h4>${dto.sns_name}</h4>
                                                                </div><!--nameBox 끝-->
                                                                <div class="right">
                                                                    <button type="button">
                                                                        팔로잉
                                                                    </button>
                                                                    <c:if
                                                                        test="${com_email == sessionScope.login_email}">
                                                                        <span class="icon">
                                                                            <i
                                                                                class="fa-solid fa-ellipsis-vertical"></i>
                                                                        </span>
                                                                        <div class="option">
                                                                            <!-- <h5>수정하기</h5> -->
                                                                            <h5>삭제하기</h5>
                                                                        </div>
                                                                    </c:if>
                                                                </div><!--right 끝-->
                                                            </div> <!--userBox 끝-->

                                                            <div class="detailContent">
                                                                <div class="mainGetResult">
                                                                    <ul>
                                                                        <!-- <img src="images/suji.jpg" alt="#" class="img"> -->
                                                                    </ul>
                                                                </div>
                                                                <div class="detailTitle">
                                                                    <h4>${dto.sns_title}</h4>
                                                                </div>
                                                                <textarea readonly>${dto.sns_content}</textarea>
                                                            </div> <!--detailContent 끝-->

                                                            <div class="iconBox">
                                                                <span class="icon">
                                                                    <i class="fa-regular fa-heart"></i>
                                                                </span>
                                                                <span class="commentIcon">
                                                                    <i class="fa-regular fa-comment"></i>
                                                                </span>
                                                                <h5>${dto.sns_date}</h5>
                                                            </div> <!--iconBox 끝-->

                                                        </div> <!--detailBox 끝-->
                                                    </c:if>
                                                </c:forEach>
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

                // 각 detailBox 내에서 .option 활성화
                $('span.icon').click(function () {
                    // 현재 아이콘의 가장 가까운 .detailBox를 찾고 그 안의 .option을 활성화
                    $(this).closest('.detailBox').find('.option').addClass('active');
                });

                // .option의 h5 클릭 시, 해당 .option을 비활성화
                $('.option h5').click(function () {
                    // 클릭된 h5의 부모 .option을 비활성화
                    $(this).closest('.option').removeClass('active');
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

                $('.detailBox').each(function () {
                    var sns_num = $(this).data('sns-num');

                    var uploadResultContainer = $(this).find('.mainGetResult ul');

                    if (sns_num) {
                        $.ajax({
                            url: '/snsGetFileList',
                            type: 'GET',
                            data: { sns_num: sns_num },
                            dataType: 'json',
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
                                console.error('Error fetching file list for com_email ' + sns_num + ':', error);
                            }
                        });
                    }
                });

                $('.userBox').each(function () {
                    var user_type = $(this).data('user-type');
                    var email = $(this).data('user-email')

                    var uploadResultContainer = $(this).find('.UserImage ul');

                    if (user_type) {
                        var url;
                        var emailParam = '';

                        if (user_type == 1) {
                            url = '/getUserImageList';
                            emailParam = { user_email: email }
                        } else if (user_type == 2) {
                            url = '/mainComFileList';
                            emailParam = { com_email: email }
                        }
                        $.ajax({
                            url: url,
                            type: 'GET',
                            data: emailParam, // 이메일만 데이터로 전송
                            dataType: 'json',
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
                                console.error('Error fetching file list for email ' + email + ':', error);
                            }
                        });
                    }
                });
                function showUploadResult(uploadResultArr, uploadResultContainer) {
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
                        str += "<img src='/snsDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";
                        str += "</div></li>";
                    });

                    uploadResultContainer.empty().append(str);
                }

            });
        </script>