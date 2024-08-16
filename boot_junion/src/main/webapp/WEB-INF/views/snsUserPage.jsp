<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>snsUserpage</title>
            <!-- import font-awesome, line-awesome -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
            <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"> -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}css/snsUserPage.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
            <!-- import js -->
            <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
            <style>
                /* CSS 스타일 추가 */
                .feedbackModal {
                    display: none;
                    /* 초기에는 숨김 */
                    position: fixed;
                    z-index: 1000;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgba(0, 0, 0, 0.5);
                    /* 반투명 배경 */
                    justify-content: center;
                    align-items: center;
                }

                .feedbackModal .feedbackPopupBox {
                    background-color: #fff;
                    margin: auto;
                    padding: 20px;
                    border: 1px solid #888;
                    width: 480px;
                    border-radius: 15px;
                    display: flex;
                    flex-direction: column;
                }

                .viewFeedback {
                    display: none;
                    /* 초기에는 숨김 */
                    position: fixed;
                    z-index: 1000;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    overflow: auto;
                    background-color: rgba(0, 0, 0, 0.5);
                    /* 반투명 배경 */
                    justify-content: center;
                    align-items: center;
                }

                .viewFeedback .feedbackPopupBox {
                    background-color: #fff;
                    margin: auto;
                    padding: 20px;
                    border: 1px solid #888;
                    width: 480px;
                    border-radius: 15px;
                    display: flex;
                    flex-direction: column;
                }

                .feedbackPopupBox button {
                    background: none;
                    border: none;
                    font-weight: 400;
                    font-size: var(--font-size16);
                    color: var(--color-gray);
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                }

                .feedbackPopupBox {
                    width: 480px;
                    height: 670px;
                    border: 1px solid var(--border-color-gray);
                    border-radius: 15px;
                }

                .feedbackPopupBox .boxButton {
                    display: flex;
                    justify-content: flex-end;
                    margin: 20px;
                }

                .feedbackPopupBox .boxButton h5 {
                    font-weight: 400;
                    font-size: var(--font-size16);
                    color: var(--color-gray);
                    cursor: pointer;
                }

                .feedbackPopupBox .postButton {
                    color: #fff;
                    border: 1px solid #e5e5ec;
                    border-color: #FFA500;
                    border-radius: 10px;
                    padding: 2px 8px;
                    background-color: #FFA500;
                }

                .feedbackPopupBox .boxTitle {
                    display: flex;
                    align-items: center;
                }

                .feedbackPopupBox .boxTitle .uploadResultAB img {
                    width: 40px;
                    height: 40px;
                    margin: 0px 20px 0px 30px;
                }

                .feedbackPopupBox .boxTitle .titleContent input {
                    border: none;
                    outline: none;
                    width: 320px;
                    height: 40px;
                    font-size: var(--font-size14);
                }

                .feedbackPopupBox .uploadImage input {
                    display: none;
                }

                .feedbackPopupBox .uploadImage .uploadFile {
                    display: flex;
                    align-items: center;
                    margin: 20px 36px 0px 36px;
                    padding: 0 0 20px 0;
                    cursor: pointer;
                    border-bottom: solid 1px var(--border-color-gray);
                }

                .feedbackPopupBox .uploadImage .uploadFile .icon {
                    font-size: 24px;
                }

                .feedbackPopupBox .uploadImage .uploadFile h5 {
                    font-weight: 400;
                    font-size: var(--font-size14);
                    margin-left: 12px;
                }

                .feedbackPopupBox .boxContent textarea {
                    border: none;
                    outline: none;
                    width: 400px;
                    height: 400px;
                    font-size: var(--font-size14);
                    margin: 20px;
                    resize: none;
                }

                .uploadResultAB ul {
                    padding-left: 0px;
                    margin-bottom: 0px;
                }

                .feedbackSubmit {
                    display: flex;
                    justify-content: flex-end;
                    padding: 0px 20px;
                }

                /*
				아코디언 css
				*/

                .accordion {
                    width: 420px;
                    padding: 20px;
                }

                .accordionItem {
                    margin-bottom: 10px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                }

                .accordionButton {
                    background-color: #f9f9f9;
                    color: #444;
                    cursor: pointer;
                    padding: 10px;
                    width: 100%;
                    text-align: left;
                    outline: none;
                    font-size: 16px;
                    border: none;
                    transition: background-color 0.2s ease;
                    border-radius: 5px;
                }

                .accordionButton:hover {
                    background-color: #eee;
                }

                .accordionContent {
                    padding: 20px;
                    display: none;
                    overflow: hidden;
                    background-color: #f9f9f9;
                    border-top: 1px solid #ddd;
                    border-radius: 0 0 5px 5px;
                }

                .accordionItem .accordionButton .uploadResultC img {
                    width: 40px;
                    height: 40px;
                    margin: 0px 20px 0px 10px;
                }

                .accordionItem .accordionButton h5 {
                    margin-bottom: 0px;
                }

                .uploadResultC ul {
                    padding-left: 0px;
                    margin-bottom: 0px;
                }
            </style>
        </head>

        <body>
            <div class="snsContainer">
                <%@ include file="sns_nav.jsp" %>
                    <div class="snsContent">
                        <%@ include file="sns_header.jsp" %>
                            <main>
                                <section class="snsMypage">
                                    <div class="bgH"></div>
                                    <div class="contentWrap">
                                        <div class="content profile">
                                            <div class="profileInfo">
                                                <img class="img" src="/images/1.jpg" alt="">
                                                <h3 class="name">${userInfo.user_name}</h3>
                                                <p class="intro">
                                                    <c:if test="${user_email == sessionScope.login_email}">
                                                        <span class="icon" id="editIntroIcon">
                                                            <i class="fa-regular fa-pen-to-square"></i>
                                                        </span>
                                                    </c:if>
                                                    ${userIntro.sns_intro}
                                                </p>

                                                <!-- 사용자 자신의 페이지인 경우 소개 수정 폼 추가 -->
                                                <c:if test="${user_email == sessionScope.login_email}">
                                                    <div id="introEditForm" style="display: none;">
                                                        <form id="modifyIntroForm" method="post"
                                                            action="${pageContext.request.contextPath}/snsUserPage">
                                                            <input type="hidden" name="user_email"
                                                                value="${user_email}">
                                                            <textarea name="sns_intro" rows="4"
                                                                style="width:100%; border-radius: 5px; padding: 5px; margin-top: 20px;"
                                                                maxlength="100">${userIntro.sns_intro}</textarea>
                                                            <div class="modifyButton">
                                                                <button type="submit" class="postButton">수정 완료</button>
                                                                <button type="button" id="cancelEdit"
                                                                    class="postButton">취소</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </c:if>
                                                <c:if test="${user_email != sessionScope.login_email}">
                                                    <div class="profileButton">
                                                        <button class="following">팔로잉</button>
                                                        <button class="message">메시지</button>
                                                    </div>
                                                </c:if>
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
                                            <div class="profileCon position">
                                                <h5 class="proflieConTitle">희망 직무</h5>
                                                <div class="positionWrap">
                                                    <c:forEach items="${SNSJob}" var="dto">
                                                        <h3>${dto.job_name}</h3>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="profileCon">
                                                <h5 class="proflieConTitle">기술 스택</h5>
                                                <div class="positionWrap">
                                                    <c:forEach items="${SNSStack}" var="dto">
                                                        <h3>${dto.stack_name}</h3>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="content info">
                                            <div class="tabWrap">
                                                <div class="tab active information">정보</div>
                                                <div class="tab board">게시글</div>
                                            </div>
                                            <div class="contentInfoWrap active">
                                                <c:choose>
                                                    <c:when test="${resumeInfo == null}">
                                                        <div class="nullResume">
                                                            <h2 class="nullResumeText">등록된 이력서가 없습니다.</h2>
                                                            <c:if test="${user_email == sessionScope.login_email}">
                                                                <a href="${pageContext.request.contextPath}/resumeList"
                                                                    class="addResume">이력서 등록하기</a>
                                                            </c:if>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select name="" id="resumeSelect">
                                                            <option value="">이력서1</option>
                                                            <option value="">이력서2</option>
                                                            <option value="">이력서3</option>
                                                        </select>
                                                        <div class="infoConWrap">
                                                            <h3 class="infoConWrapTitle">경력</h3>
                                                            <div class="infoCon">
                                                                <div style="display: flex; flex-direction: column;">
                                                                    <div class="infoConTitle">
                                                                        ${resumeInfo.resume_comName}</div>
                                                                    <div class="infoConSubTitleWrap">
                                                                        <h5 class="infoConPosition">
                                                                            ${resumeInfo.resume_comPart}</h5>
                                                                        <h5 class="infoConCareer">
                                                                            ${resumeInfo.career_years}년${resumeInfo.career_months}개월
                                                                        </h5>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="infoConWrap">
                                                            <h3 class="infoConWrapTitle">학력</h3>
                                                            <div class="infoCon">
                                                                <div style="display: flex; flex-direction: column;">
                                                                    <div class="infoConTitle">
                                                                        ${resumeInfo.resume_eduName}</div>
                                                                    <div class="infoConSubTitleWrap">
                                                                        <h5 class="infoConPosition">
                                                                            ${resumeInfo.resume_eduMajor}</h5>
                                                                        <h5 class="infoConCareer">
                                                                            ${resumeInfo.edu_years}년${resumeInfo.edu_months}개월
                                                                        </h5>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="infoConWrap">
                                                            <h3 class="infoConWrapTitle">포트폴리오</h3>
                                                            <div class="infoCon">
                                                                <div style="display: flex; flex-direction: column;">
                                                                    <div class="infoConTitle">
                                                                        ${resumeInfo.resume_portfolio_name}</div>
                                                                    <h5 class="infoConPosition">
                                                                        <a href="http://${resumeInfo.resume_portfolio_url}"
                                                                            style="color:#111">${resumeInfo.resume_portfolio_url}</a>
                                                                    </h5>
                                                                </div>
                                                                <c:if test="${user_email != sessionScope.login_email}">
                                                                    <button class="estimatePortfolio">평가하기</button>
                                                                </c:if>
                                                                <c:if test="${user_email == sessionScope.login_email}">
                                                                    <button class="viewEstimate">평가보기</button>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="infoConWrap">
                                                            <h3 class="infoConWrapTitle">자격 / 수상</h3>
                                                            <div class="infoCon">
                                                                <div style="display: flex; flex-direction: column;">
                                                                    <div class="infoConTitle">
                                                                        ${resumeInfo.resume_licenseContent}</div>
                                                                    <h5 class="infoConPosition">
                                                                        ${resumeInfo.resume_licenseDate}</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="contentBoard">
                                                <div class="contentBoardWrap">
                                                    <c:if test="${user_email == sessionScope.login_email}">
                                                        <button class="writing">작성하기</button>
                                                    </c:if>
                                                    <c:forEach items="${snsList}" var="dto">
                                                        <c:set var="user_email" value="${param.user_email}" />
                                                        <c:if test="${dto.login_email == user_email}">
                                                            <div class="detailBox" data-sns-num="${dto.sns_num}">
                                                                <div class="userBox" data-user-type="${dto.user_type}"
                                                                    data-user-email="${dto.login_email}">
                                                                    <div class="left">
                                                                        <div class="UserImage">
                                                                            <ul>
                                                                                <!-- 이미지 삽입 부분 -->
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="nameBox">
                                                                        <h4>${dto.sns_name}</h4>
                                                                    </div>
                                                                    <div class="right">
                                                                        <c:if
                                                                            test="${user_email != sessionScope.login_email}">
                                                                            <button type="button">팔로잉</button>
                                                                        </c:if>
                                                                        <c:if
                                                                            test="${user_email == sessionScope.login_email}">
                                                                            <span class="icon">
                                                                                <i
                                                                                    class="fa-solid fa-ellipsis-vertical"></i>
                                                                            </span>
                                                                            <div class="option">
                                                                                <h5>삭제하기</h5>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="detailContent">
                                                                    <div class="mainGetResult">
                                                                        <ul>
                                                                            <!-- 업로드된 파일 목록 삽입 부분 -->
                                                                        </ul>
                                                                    </div>
                                                                    <div class="textArea">
                                                                        <div class="detailTitle">
                                                                            <h4 class="snsntitle">${dto.sns_title}</h4>
                                                                        </div>
                                                                    </div>
                                                                    <h5 class="snsn" id="snsnTextarea" readonly>
                                                                        ${dto.sns_content}</h5>
                                                                    <button type="button" class="more-btn"
                                                                        style="display:none;">더보기</button>
                                                                </div>
                                                                <div class="iconBox">
                                                                    <span class="icon">
                                                                        <i class="fa-regular fa-heart"></i>
                                                                    </span>
                                                                    <span class="commentIcon">
                                                                        <i class="fa-regular fa-comment"></i>
                                                                    </span>
                                                                    <h5>${dto.sns_date}</h5>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
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
                $('.tab.information').click(function () {
                    $('.tab').removeClass('active');
                    $(this).addClass('active');
                    $('.contentBoard').removeClass('active');
                    $('.contentInfoWrap').addClass('active');
                });
                $('.tab.board').click(function () {
                    $('.tab').removeClass('active');
                    $(this).addClass('active');
                    $('.contentInfoWrap').removeClass('active');
                    $('.contentBoard').addClass('active');
                });

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
                $('.estimatePortfolio').on('click', function (event) {
                    event.preventDefault();
                    $('#writeFeedback').css('display', 'flex');
                    $('body').css({
                        'overflow': 'hidden',
                        'margin-right': '0px' // 스크롤바 너비만큼 오른쪽 마진 추가
                    });
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

                // 평가하기 '취소' 버튼 클릭 시 모달 닫기
                $('#writeCancelButton').on('click', function (event) {
                    event.preventDefault();
                    $('#writeFeedback').hide();
                    $('body').css({
                        'overflow': 'auto',
                        'margin-right': '0' // 오른쪽 마진 원래대로
                    });
                });
                // 평가보기'취소' 버튼 클릭 시 모달 닫기
                $('#viewCancelButton').on('click', function (event) {
                    event.preventDefault();
                    $('#viewFeedback').hide();
                    $('body').css({
                        'overflow': 'auto',
                        'margin-right': '0' // 오른쪽 마진 원래대로
                    });
                });

                // 모달 외부 클릭 시 모달 닫기
                $(window).on('click', function (event) {
                    if ($(event.target).is('#writeFeedback')) {
                        $('#writeFeedback').hide();
                        $('body').css({
                            'overflow': 'auto',
                            'margin-right': '0' // 오른쪽 마진 원래대로
                        });
                    }
                });

                // 폼 제출 시 처리
                $('.popupBox').on('submit', function (event) {
                    event.preventDefault();
                    // 여기서 폼 데이터를 서버로 전송하는 로직을 추가할 수 있습니다.
                    alert('작성 완료!');
                    $('#writeFeedback').hide();
                    $('body').css({
                        'overflow': 'auto',
                        'margin-right': '0' // 오른쪽 마진 원래대로
                    });
                });

                // '평가보기' 버튼 클릭 시 모달 열기
                $('.viewEstimate').on('click', function (event) {
                    event.preventDefault();
                    $('#viewFeedback').css('display', 'flex');
                    $('body').css({
                        'overflow': 'hidden',
                        'margin-right': '0px' // 스크롤바 너비만큼 오른쪽 마진 추가
                    });
                });

                // 모달 외부 클릭 시 모달 닫기 (피드백 보기)
                $(window).on('click', function (event) {
                    if ($(event.target).is('#viewFeedback')) {
                        $('#viewFeedback').hide();
                        $('body').css({
                            'overflow': 'auto',
                            'margin-right': '0' // 오른쪽 마진 원래대로
                        });
                    }
                });

                // 평가보기 아코디언
                document.querySelectorAll('.accordionButton').forEach(button => {
                    button.addEventListener('click', () => {
                        const content = button.nextElementSibling;

                        button.classList.toggle('active');
                        if (content.style.display === 'block') {
                            content.style.display = 'none';
                        } else {
                            content.style.display = 'block';
                        }
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

        <script>
            $(document).ready(function () {
                $('#editIntroIcon').click(function () {
                    $('.intro').hide(); // 기존 소개 텍스트 숨기기
                    $('#introEditForm').show(); // 소개 수정 폼 보이기
                });

                $('#cancelEdit').click(function () {
                    $('#introEditForm').hide(); // 수정 폼 숨기기
                    $('.intro').show(); // 기존 소개 텍스트 다시 보이기
                });

                $('#modifyIntroForm').submit(function (event) {
                    event.preventDefault();
                    $.ajax({
                        url: $(this).attr('action'),
                        type: 'POST',
                        data: $(this).serialize(),
                        success: function (response) {
                            alert('소개가 수정되었습니다.');
                            location.reload(); // 페이지 새로고침하여 변경 사항 반영
                        },
                        error: function () {
                            alert('소개 수정에 실패했습니다.');
                        }
                    });
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('.option h5').click(function () {
                    const snsNum = $(this).closest('.detailBox').data('sns-num');

                    if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
                        $.ajax({
                            url: '/deletePost', // 서버에서 처리할 URL
                            type: 'POST',
                            data: { sns_num: snsNum },
                            success: function (response) {
                                alert('게시글이 삭제되었습니다.');
                                location.reload(); // 페이지 새로고침
                            },
                            error: function (xhr, status, error) {
                                alert('게시글 삭제에 실패했습니다.');
                            }
                        });
                    }
                });
            });

        </script>

        <script>
            $(document).ready(function () {
                // 폼 제출 이벤트를 가로채기
                $('.feedbackPopupBox').on('submit', function (event) {
                    event.preventDefault(); // 폼의 기본 제출 방지

                    // 폼 데이터를 수집
                    var formData = $(this).serialize();

                    // AJAX 요청을 통해 데이터 전송
                    $.ajax({
                        url: $(this).attr('action'), // 폼의 action 속성에 지정된 URL
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            // 데이터 전송 성공 시 알림
                            alert('피드백이 성공적으로 등록되었습니다.');
                            // 모달 창 닫기
                            $('#writeFeedback').hide();
                            // 페이지 새로고침
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            // 데이터 전송 실패 시 알림
                            alert('피드백 등록에 실패했습니다. 다시 시도해주세요.');
                        }
                    });
                });

                // 모달 닫기 버튼 클릭 시
                $('#writeCancelButton').on('click', function () {
                    $('#writeFeedback').hide(); // 모달 닫기
                });
            });
        </script>