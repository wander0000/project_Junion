<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sns 메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsMain.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
    
<div class="snsContainer">
    <%@ include file="sns_nav.jsp" %>

    <div class="snsContent">
        <%@ include file="sns_header.jsp" %> 

        <main>
            <div class="snsMain">
                <div class="leftCon">
                    <c:forEach items="${snsList}" var="dto">
                        <div class="detailBox prof"
                            data-sns-num="${dto.sns_num}"
                            data-sns-name="${dto.sns_name}"
                            data-sns-title="${dto.sns_title}"
                            data-sns-content="${dto.sns_content}"
                            data-sns-date="${dto.sns_date}"
                            data-user-type="${dto.user_type}"
                            data-user-email="${dto.login_email}"
                            data-login-email="${login_email}"
                            data-login-usertype="${login_usertype}"
                            >
                            <div class="userBox">
                                <div class="left">
                                    <div class="UserImage">
                                        <ul>
                                            <!-- <img src="images/people.svg" alt="#" class="img"> -->
                                        </ul>
                                    </div>
                                </div><!--left 끝-->
                                <div class="nameBox">
                                    <!-- <h4>수지야</h4> -->
                                    <h5 class="nana">
                                        <a href="#" id="userProfileLink" style="color: var(--color-black);">
                                            ${dto.sns_name}
                                        </a>
                                    </h5>
                                </div><!--nameBox 끝-->
                                <div class="right">
                                    <button type="button" class="followbtn">
                                        팔로잉
                                    </button>
                                </div><!--right 끝-->
                            </div> <!--userBox 끝-->
            
                            <div class="detailContent">
                                <div class="mainGetResult">
                                    <ul>
                                        <!-- <img src="images/suji.jpg" alt="#" class="img"> -->
                                    </ul>
                                </div>
                                <div class="textArea">
                                    <div class="detailTitle">
                                        <h4 class="snsntitle">${dto.sns_title}</h4>
                                    </div>
                                </div>
								<h5 class="snsn" id="snsnTextarea" readonly>${dto.sns_content}</h5>
								<button type="button" class="more-btn" style="display:none;">더보기</button>
                            </div> <!--detailContent 끝-->
            
                            <div class="iconBox">
                                <span class="icon">
                                    <!-- <i class="fa-regular fa-heart"></i> -->
                                    <i class="fa-regular fa-heart"
                                    data-sns-num="${dto.sns_num}"
                                    data-login-email="${login_email}"
                                    data-user-type="${dto.user_type}"
                                    onclick="toggleLike(this, '${dto.sns_num}', '${login_email}', '${login_usertype}')"></i>
                                </span>
                                <span class="commentIcon">
                                    <i class="fa-regular fa-comment"></i>
                                </span>
                                <h5 class="datete" id="timeAgoText_${dto.sns_num}"></h5>
                            </div> <!--iconBox 끝-->
            
                        </div> <!--detailBox 끝-->
                    </c:forEach>

                </div> <!--leftCon 끝-->
        
                <div class="rightCon">
                    <h5 class="profile">추천 프로필</h5>
        
                    <c:forEach items="${userList}" var="user" varStatus="status">
                        <c:if test="${status.index < 2}">
                            <div class="userBox prof" 
                                data-user-type="${user.user_type}"
                                data-user-email="${user.user_email}">
                                <div class="left">
                                    <div class="UserImage">
                                        <ul>
                                            <img src="images/people.svg" alt="#" class="img">
                                        </ul>
                                    </div>
                                </div><!--left 끝-->
                                <div class="nameBox">
                                    <h4>
                                        <a href="snsUserPage?user_email=${user.user_email}">${user.user_name}</a>
                                    </h4>
                                    <h5>${user.user_email}</h5>
                                </div><!--nameBox 끝-->
                                <div class="right">
                                    <button type="button" class="followbtn">
                                        팔로우
                                    </button>
                                </div><!--right 끝-->
                            </div> <!--userBox 끝-->
                        </c:if>
                    </c:forEach>

                    <c:forEach items="${comList}" var="com" varStatus="status">
                        <c:if test="${status.index < 2}">
                            <div class="userBox prof" 
                                data-user-type="${com.user_type}"
                                data-user-email="${com.com_email}">
                                <div class="left">
                                    <div class="UserImage">
                                        <ul>
                                            <img src="images/people.svg" alt="#" class="img">
                                        </ul>
                                    </div>
                                </div><!--left 끝-->
                                <div class="nameBox">
                                    <h4>
                                        <a href="snsCompanyPage?com_email=${com.com_email}">${com.com_name}</a>
                                    </h4>
                                    <h5>${com.com_email}</h5>
                                </div><!--nameBox 끝-->
                                <div class="right">
                                    <button type="button" class="followbtn">
                                        팔로우
                                    </button>
                                </div><!--right 끝-->
                            </div> <!--userBox 끝-->
                        </c:if>
                    </c:forEach>
        
                    
                        <h5 class="more">
                            <a href="SNSRecommendUser" style="color: var(--color-gray);">
                                더 보기
                            </a>
                        </h5>
                </div> <!--rightCon 끝-->
        
            </div> <!--snsMain 끝-->
        </main>
        
    </div>
</div>

<!-- 모달 구조 -->
<div id="popupModal" class="modal">
    <div class="modal-content">
        <div class="popupDetail">
            <div class="detailBox prof">
                <div class="userBox">
                    <div class="left">
                        <div class="popupUserImage">
                            <ul>
                                <img src="images/people.svg" alt="#" class="img">
                            </ul>
                        </div>
                    </div><!--left 끝-->
                    <div class="nameBox">
                        <h4 id="modalSnsName" class="snsnsn"></h4>
                    </div><!--nameBox 끝-->
                    <div class="right">
                        <button type="button" class="followbtn">
                            팔로잉
                        </button>
                    </div><!--right 끝-->
                </div> <!--userBox 끝-->

                <div class="detailContent">
                    <div class="popupGetResult">
                        <ul>
                            <!-- <img src="images/suji.jpg" alt="#" class="img"> -->
                        </ul>
                    </div>
                    <div class="popupTextarea">
                        <h4 id="modalSnsTitle"></h4>
                        <textarea id="modalSnsContent" readonly></textarea>
                    </div>
                    <h5 id="modalSnsDate"></h5>
                </div> <!--detailContent 끝-->
            </div> <!--detailBox 끝-->

            <div class="detailComment">
                <span class="xIcon">
                    <i class="fa-solid fa-xmark"></i>
                </span>
                <div class="commentContent">
                    <div class="commentCon">
                        <div class="left">
                            <div class="commentUserImage">
                                <ul>
                                    <img src="images/people.svg" alt="#" class="img">
                                </ul>
                            </div>
                            <div class="nameBox">
                                <h4>이재현</h4>
                            </div><!--nameBox 끝-->
                        </div><!--left 끝-->
                        <div class="right">
                            <h4>우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...</h4>
                            <h5>방금</h5>
                        </div><!--right 끝-->
                    </div> <!--commentCon 끝-->
                </div> <!--commentContent 끝-->

                <div class="commentBottom">
                    <div class="numberCount">
                        <!-- <div class="like"> -->
                            <!-- <h5>좋아요 5개</h5> -->
                            <h5 class="likeCount" id="modalLikeCount">좋아요 0개</h5>
                        <!-- </div> -->
                        <!-- <div class="comment"> -->
                            <h5 class="comment">댓글 4개</h5>
                        <!-- </div> -->
                    </div> <!--numberCount 끝-->

                    <div class="commentBox">
                        <span class="icon">
                            <!-- <i class="fa-regular fa-heart"></i> -->
                            <i class="fa-regular fa-heart" id="modalLikeButton" onclick="toggleModalLike(this)"></i>
                        </span>
                        <form id="commentForm">
                            <input type="hidden" name="sns_num" value="${sns_num}">
                            <input type="hidden" name="login_email" value="${login_email}">
                            <input type="hidden" name="user_type" value="${login_usertype}">
                            <div class="textarea-wrap">
                                <textarea name="sns_comment_content" placeholder="댓글 달기..."></textarea>
                            </div>
                            <input type="submit" value="게시">
                        </form>
                    </div> <!--commentBox 끝-->
                </div> <!--commentBottom 끝-->
            </div> <!--detailComment 끝-->

        </div> <!--popupDetail 끝-->
    </div>
</div> <!--모달 끝-->

<script>
$(document).ready(function () {

    $('.detailBox').each(function () {
        var snsNum = $(this).data('sns-num');

        var snsDate = $(this).data('sns-date');
        var timeAgoText = timeAgo(new Date(snsDate));
        $('#timeAgoText_' + snsNum).text(timeAgoText);

        var loginEmail = $(this).data('login-email');
        var userType = $(this).data('login-usertype');
        var heartIcon = $(this).find('.fa-heart');
        
        var uploadResultContainer = $(this).find('.mainGetResult ul');

        if (snsNum) {
            $.ajax({
                url: '/snsGetFileList',
                type: 'GET',
                data: { sns_num: snsNum },
                dataType: 'json',
                success: function(data) {
                    showUploadResult(data, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for com_email ' + sns_num + ':', error);
                }
            });
        }

         // 좋아요 상태를 확인하는 AJAX 호출
        $.ajax({
            url: '/sns/like/status',
            method: 'GET',
            data: {
                snsNum: snsNum,
                loginEmail: loginEmail,
                userType: userType
            },
            success: function(isLiked) {
                console.log("좋아요 성공;;",isLiked);
                console.log("Received isLiked for snsNum:", snsNum);
                console.log("Received isLiked for loginEmail:", loginEmail);
                console.log("Received isLiked for userType:", userType);
                console.log("Heart icon element:", heartIcon);

                // var heartIcon = $(`.detailBox[data-sns-num='${snsNum}'] .fa-heart`);

                if (isLiked) {
                    heartIcon.removeClass('fa-regular').addClass('fa-solid'); // 좋아요 상태로 표시
                } else {
                    heartIcon.removeClass('fa-solid').addClass('fa-regular'); // 좋아요 취소 상태로 표시
                }
            },
            error: function(xhr, status, error) {
                console.error('Error fetching like status:', error);
            }
        });
    });

    $('.detailBox, .rightCon .userBox .prof').each(function () {
        var user_type = $(this).data('user-type');
        var snsEmail = $(this).data('user-email');
        
        var uploadResultContainer = $(this).find('.UserImage ul');

        if (user_type) {
            var url;
            var emailParam = '';

            if (user_type == 1) {
                url = '/getUserImageList';
                emailParam = { user_email: snsEmail }
            } else if (user_type == 2) {
                url = '/mainComFileList';
                emailParam = { com_email: snsEmail }
            }
            $.ajax({
                url: url,
                type: 'GET',
                data: emailParam, // 이메일만 데이터로 전송
                dataType: 'json',
                success: function(data) {
                    showUploadResult(data, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for email ' + email + ':', error);
                }
            });
        }

        var userProfileLink = $(this).find('#userProfileLink');

        if (user_type == 1) {
            userProfileLink.attr('href', 'snsUserPage?user_email=' + snsEmail);
        } else if (user_type == 2) {
            userProfileLink.attr('href', 'snsCompanyPage?com_email=' + snsEmail);
        }

    });

     // .snsMain .detailContent textarea, .snsMain .detailBox .iconBox .commentIcon를 클릭했을 때 모달 열기
    $(".snsMain .detailContent .snsn, .snsMain .detailBox .iconBox .commentIcon").click(function () {
        var detailBox = $(this).closest('.detailBox');
        var snsNum = detailBox.data('sns-num');
        var snsName = detailBox.data('sns-name');
        var snsTitle = detailBox.data('sns-title');
        var snsContent = detailBox.data('sns-content');
        var snsDate = detailBox.data('sns-date');
        var user_type = detailBox.data('user-type');
        var snsEmail = detailBox.data('user-email');
        var loginEmail = detailBox.data('login-email');
        var loginUsertype = detailBox.data('login-usertype');

        console.log("sns_num: " + snsNum);
        console.log("snsName: " + snsName);
        console.log("snsTitle: " + snsTitle);
        console.log("snsContent: " + snsContent);
        console.log("snsDate: " + snsDate);
        console.log("snsEmail: " + snsEmail);
        console.log("loginEmail: " + loginEmail);

        openModal(snsNum, snsName, snsTitle, snsContent, snsDate, user_type, snsEmail, loginEmail, loginUsertype);
        // detailBox.addClass('prof');
        // followFunction();
    });

    // 모달 닫기
    $(".close, .xIcon").click(function () {
        closeModal();
    });

    // 모달 외부 클릭 시 닫기
    $(window).click(function (event) {
        if ($(event.target).is("#popupModal")) {
            closeModal();
        }
    });

    // 모달 열기 함수
    function openModal(snsNum, snsName, snsTitle, snsContent, snsDate, user_type, snsEmail, loginEmail, loginUsertype) {
        console.log("Opening modal for sns_num: " + snsNum); // 가져온 sns_num 확인
        console.log("Opening modal for snsUserType: " + user_type); // 가져온 sns_num 확인
        console.log("Opening modal for snsEmail: " + snsEmail); // 가져온 sns_num 확인
        $("#modalSnsName").text(snsName);
        $("#modalSnsTitle").text(snsTitle);
        $("#modalSnsContent").text(snsContent);

        // 시간을 timeAgo 함수로 변환
        var modalTimeAgo = timeAgo(new Date(snsDate));
        $("#modalSnsDate").text(modalTimeAgo);

        $("#popupModal").css("display", "flex");
        $("body").addClass("modal-open"); // 모달 열릴 때 스크롤 방지

        // 모달 내 prof 요소에 data-* 속성 설정
        $("#popupModal .prof").data("user-type", user_type)
        $("#popupModal .prof").data("sns-num", snsNum)
        $("#popupModal .prof").data("login-email", loginEmail)
        $("#popupModal .prof").data("login-usertype", loginUsertype)
                            .data("user-email", snsEmail);
        
        followFunction();



        // sns_num을 댓글 폼에 설정
        $('input[name="sns_num"]').val(snsNum);

        // 댓글 목록을 불러오기
        loadComments(snsNum);


        // snsNum을 이용하여 모달에 사진 데이터 로드
        $.ajax({
            url: '/snsGetFileList',
            type: 'GET',
            data: { sns_num: snsNum },
            dataType: 'json',
            success: function(data) {
                // 모달 내부의 사진 컨테이너를 선택
                var modalPhotoContainer = $("#popupModal .popupGetResult ul");
                showUploadResult(data, modalPhotoContainer); // 사진 데이터 표시
            },
            error: function(xhr, status, error) {
                console.error('Error fetching file list for sns_num ' + snsNum + ':', error);
            }
        });

        if (user_type) {
            var url;
            var emailParam = '';

            if (user_type == 1) {
                url = '/getUserImageList';
                emailParam = { user_email: snsEmail }
            } else if (user_type == 2) {
                url = '/mainComFileList';
                emailParam = { com_email: snsEmail }
            }
            $.ajax({
                url: url,
                type: 'GET',
                data: emailParam, // 이메일만 데이터로 전송
                dataType: 'json',
                success: function(data) {
                    var modalPhotoContainer = $("#popupModal .popupUserImage ul");
                    showUploadResult(data, modalPhotoContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for email ' + email + ':', error);
                }
            });
        }

        // 좋아요 상태를 가져와서 아이콘 상태 설정
        $.ajax({
            url: '/sns/like/status',
            method: 'GET',
            data: {
                snsNum: snsNum,
                loginEmail: loginEmail,
                userType: loginUsertype
            },
            success: function(isLiked) {
                var modalLikeButton = $('#modalLikeButton');
                if (isLiked) {
                    modalLikeButton.removeClass('fa-regular').addClass('fa-solid'); // 좋아요가 눌린 상태로 표시
                } else {
                    modalLikeButton.removeClass('fa-solid').addClass('fa-regular'); // 좋아요가 눌리지 않은 상태로 표시
                }
                updateLikeCount(snsNum, modalLikeButton); // 모달 열릴 때 좋아요 수 업데이트
            },
            error: function(xhr, status, error) {
                console.error('Error fetching like status:', error);
            }
        });
    } //openModal 끝

     // 댓글 작성 및 목록 갱신
     $('#commentForm').on('submit', function (e) {
        e.preventDefault(); // 기본 폼 제출 방지

        var commentContent = $('textarea[name="sns_comment_content"]').val().trim();

        // 댓글 내용이 비어있는지 확인
        if (commentContent === "") {
            // alert("댓글을 입력해주세요.");
            return; // 폼 제출 중지
        }

        var formData = {
            sns_num: $('input[name="sns_num"]').val(),
            login_email: $('input[name="login_email"]').val(),
            user_type: $('input[name="user_type"]').val(),
            sns_comment_content: $('textarea[name="sns_comment_content"]').val(),
        };

        console.log(formData); // 콘솔에 데이터를 출력하여 확인

        $.ajax({
            url: '/api/commentWrite',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                if (response) {
                    loadComments(formData.sns_num); // 댓글 목록 새로고침
                    $('#commentForm textarea').val(''); // 폼 초기화
                } else {
                    alert('댓글 작성에 실패했습니다. 다시 시도해 주세요.');
                }
            },
            error: function(xhr, status, error) {
                console.error('댓글 작성 중 오류 발생:', error);
                alert('댓글 작성에 실패했습니다. 다시 시도해 주세요.');
            }
        });
    });

    // 댓글 목록 불러오기 함수
    function loadComments(snsNum) {
        $.ajax({
            url: '/api/snsCommentList',
            type: 'GET',
            data: { sns_num: snsNum },
            dataType: 'json',
            success: function(data) {
                var commentCount = data.length; // 가져온 댓글의 수
                $('.numberCount h5.comment').text('댓글 ' + commentCount + '개'); // 댓글 수 업데이트

                showComments(data); // 댓글 목록 표시
            },
            error: function(xhr, status, error) {
                console.error('Error fetching comments for sns_num ' + snsNum + ':', error);
            }
        });
    }

    // 댓글 표시 함수
    function showComments(comments) {
        var commentContent = $(".commentContent");
        
        commentContent.empty(); // 기존 댓글 초기화

        $(comments).each(function(i, comment) {
            var newComment = '<div class="commentCon" data-sns-email="' + comment.sns_email + '" data-user-type="' + comment.user_type + '">' +
                                '<div class="left">' +
                                    '<div class="commentUserImage">' +
                                        '<ul>' +
                                            '<img src="/images/people.svg" alt="#" class="img">' +
                                        '</ul>' +
                                    '</div>' +
                                    '<div class="nameBox">' +
                                        '<h4 class="userProfileLink">' + comment.sns_name + '</h4>' +
                                    '</div>' +
                                '</div>' +
                                '<div class="right">' +
                                    '<h4>' + comment.sns_comment_content + '</h4>' +
                                    '<h5>' + timeAgo(new Date(comment.sns_comment_date)) + '</h5>' +
                                '</div>' +
                            '</div>';

            loadImage(comment);
            commentContent.append(newComment);

            // 각 댓글에 대해 링크 및 버튼 처리
            var newCommentElement = commentContent.find('.commentCon').last(); // 방금 추가한 요소를 선택
            var snsEmail = comment.sns_email;
            var userType = comment.user_type;
            var userProfileLink = newCommentElement.find('.userProfileLink');

            // 사용자 유형에 따라 링크 설정
            if (userType == 1) {
                userProfileLink.wrap('<a href="snsUserPage?user_email=' + snsEmail + '"></a>');
            } else if (userType == 2) {
                userProfileLink.wrap('<a href="snsCompanyPage?com_email=' + snsEmail + '"></a>');
            }

        });
    }

    function loadImage(comment) {
        if (comment.user_type) {
            var url;
            var emailParam = '';

            if (comment.user_type == 1) {
                url = '/getUserImageList';
                emailParam = { user_email: comment.sns_email };
            } else if (comment.user_type == 2) {
                url = '/mainComFileList';
                emailParam = { com_email: comment.sns_email };
            }

            $.ajax({
                url: url,
                type: 'GET',
                data: emailParam,
                dataType: 'json',
                success: function(imageData) {
                    var uploadResultContainer = $(".commentCon[data-sns-email='" + comment.sns_email + "'] .commentUserImage ul");
                    showUploadResult(imageData, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for email ' + comment.sns_email + ':', error);
                }
            });
        }
    }


    // 모달 닫기 함수
    function closeModal() {
        $("#popupModal").css("display", "none");
        $("body").removeClass("modal-open"); // 모달 닫힐 때 스크롤 재활성화

        // 모달 데이터 초기화
        $("#modalSnsName").text('');
        $("#modalSnsTitle").text('');
        $("#modalSnsContent").text('');
        $("#modalSnsDate").text('');
        $("#popupModal .popupGetResult ul").empty(); // 모달 내부의 사진 데이터 초기화
        $("#popupModal .popupUserImage ul").empty(); // 사용자 이미지 초기화
    }
	
	
	$('.detailBox').each(function () {
	       var snsnText = $(this).find('.snsn');
	       var moreBtn = $(this).find('.more-btn');

	       // 텍스트가 5줄을 초과하면 "더보기" 버튼을 표시
	       if (snsnText[0].scrollHeight > snsnText.height()) {
	           moreBtn.show();
	       }

	       // "더보기" 버튼 클릭 시 전체 텍스트 표시
	       moreBtn.click(function () {
	           if (snsnText.hasClass('expanded')) {
	               // 이미 확장된 상태라면 접기 동작 수행
	               snsnText.removeClass('expanded');
	               snsnText.css({
	                   '-webkit-line-clamp': 5,
	                   'max-height': 'calc(1.2em * 5)',
	                   'overflow': 'hidden',
	               });
	               moreBtn.text('더보기');
	           } else {
	               // 확장되지 않은 상태라면 더보기 동작 수행
	               snsnText.addClass('expanded');
	               snsnText.css({
	                   '-webkit-line-clamp': 'unset',
	                   'max-height': 'none',
	                   'overflow': 'visible',
	               });
	               moreBtn.text('접기');
	           }
	       });
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
        str += "<img src='/snsDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
        str += "</div></li>";
    });

    uploadResultContainer.empty().append(str);
}

// 좋아요 기능 처리
function toggleLike(element, snsNum, loginEmail, userType) {
    var isLiked = $(element).hasClass('fa-solid'); // 좋아요 상태 확인

    var url = isLiked ? '/sns/unlike' : '/sns/like'; // 좋아요 상태에 따라 요청 URL 결정

    $.ajax({
        url: url,
        method: 'POST',
        data: {
            snsNum: snsNum,
            loginEmail: loginEmail,
            userType: userType
        },
        success: function(response) {
            if (isLiked) {
                $(element).removeClass('fa-solid').addClass('fa-regular'); // 좋아요 취소 시 아이콘 변경
            } else {
                $(element).removeClass('fa-regular').addClass('fa-solid'); // 좋아요 추가 시 아이콘 변경
            }
            updateLikeCount(snsNum, element); // 좋아요 수 갱신
        },
        error: function(xhr, status, error) {
            console.error('좋아요 처리 중 오류 발생:', error);
            alert('좋아요 처리 중 오류가 발생했습니다. 다시 시도해주세요.');
        }
    });
}

function toggleModalLike(element) {
    var snsNum = $('#popupModal .prof').data('sns-num'); // 모달에서 sns_num 가져오기
    var loginEmail = $('#popupModal .prof').data('login-email'); // 로그인한 사용자 이메일 가져오기
    var userType = $('#popupModal .prof').data('login-usertype'); // 사용자 타입 가져오기

    var isLiked = $(element).hasClass('fa-solid'); // 모달 내 좋아요 상태 확인

    var url = isLiked ? '/sns/unlike' : '/sns/like'; // 좋아요 상태에 따라 URL 결정

    $.ajax({
        url: url,
        method: 'POST',
        data: {
            snsNum: snsNum,
            loginEmail: loginEmail,
            userType: userType
        },
        success: function(response) {
            if (isLiked) {
                $(element).removeClass('fa-solid').addClass('fa-regular'); // 모달 내 아이콘 변경
                // 메인 페이지의 아이콘도 변경
                $(`.detailBox[data-sns-num=\${snsNum}] .fa-heart`).removeClass('fa-solid').addClass('fa-regular');
            } else {
                $(element).removeClass('fa-regular').addClass('fa-solid'); // 모달 내 아이콘 변경
                // 메인 페이지의 아이콘도 변경
                $(`.detailBox[data-sns-num=\${snsNum}] .fa-heart`).removeClass('fa-regular').addClass('fa-solid');
            }
            updateLikeCount(snsNum); // 모달 및 메인 페이지의 좋아요 수 업데이트
        },
        error: function(xhr, status, error) {
            console.error('좋아요 처리 중 오류 발생:', error);
            alert('좋아요 처리 중 오류가 발생했습니다. 다시 시도해주세요.');
        }
    });
}




// 좋아요 수 갱신
function updateLikeCount(snsNum) {
    $.ajax({
        url: '/sns/like/count',
        method: 'GET',
        data: {
            snsNum: snsNum
        },
        success: function(likeCount) {
            // 모달 내 좋아요 수 업데이트
            $('#modalLikeCount').text('좋아요 ' + likeCount + '개');
        },
        error: function(xhr, status, error) {
            console.error('좋아요 수 가져오기 중 오류 발생:', error);
        }
    });
}


</script>

</body>
</html>
