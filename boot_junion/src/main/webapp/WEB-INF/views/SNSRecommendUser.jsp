<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>recommendUser</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/SNSRecommendUser.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
</head>
<body>
    <div class="snsContainer">
        <%@ include file="sns_nav.jsp" %>
        <div class="snsContent">
            <%@ include file="sns_header.jsp" %> 
            <main>
                <div class="container">
                    <div class="recommendProf">
                        <h3>추천</h3>
                        <div>
                            <!-- <button class="btn1">친구</button> -->
                            <!-- &nbsp; -->
                            <!-- <button class="btn1">기업</button> -->
                            <button class="btn1 active" onclick="switchTab('personal', event)">개인</button>
                            &nbsp;&nbsp;
                            <button class="btn1" onclick="switchTab('corporate', event)">기업</button>
                        </div>
                    </div>
                    <!-- 개인 리스트 시작 -->
                    <div id="personal" class="form-box active">
                        <div class="profList">
                            <c:forEach items="${userList}" var="user">
                                <div class="prof"
                                    data-login-email="${login_email}"
                                    data-user-type="${user.user_type}"
                                    data-user-email="${user.user_email}">
                                    <div class="profInfo">
                                        <div class="UserImage">
                                            <ul>
                                                <img src="images/people.svg" alt="#" class="img">
                                            </ul>
                                        </div>
                                        <!-- <img class="prof-img"></img> -->
                                        <div class="info">
                                            <p><h3 class="profName">${user.user_name}</h3></p>
                                            <p class="profCareer">${user.user_email}</p>
                                            <!-- <p class="profCareer">${user.stack_names}</p> -->
                                        </div>
                                        <button class="followbtn">팔로우</button>
                                    </div>
                                    <div class="profComm">
                                        <p>
                                            ${user.sns_intro}
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- 개인 리스트 끝 -->
                    <!-- 기업 리스트 시작 -->
                    <div id="corporate" class="form-box">
                        <div class="profList">
                            <c:forEach items="${comList}" var="com">
                                <div class="prof"
                                    data-login-email="${login_email}"
                                    data-user-type="${com.user_type}"
                                    data-user-email="${com.com_email}">
                                    <div class="profInfo">
                                        <div class="UserImage">
                                            <ul>
                                                <img src="images/people.svg" alt="#" class="img">
                                            </ul>
                                        </div>
                                        <div class="info">
                                            <p><h3 class="profName">${com.com_name}</h3></p>
                                            <p class="profCareer">${com.com_email}</p>
                                        </div>
                                        <button class="followbtn">팔로우</button>
                                    </div>
                                    <div class="profComm">
                                        <p>
                                            ${com.com_content}
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div> 
                    <!-- 기업 리스트 끝 -->
                </div>
        </main>
    </div>
</div>
</body>
<script>

    function switchTab(tab, event) {
		document.querySelectorAll('.form-box').forEach(function (el) {
			el.classList.remove('active');
		});
		document.querySelectorAll('.btn1').forEach(function (el) {
			el.classList.remove('active');
		});
		document.getElementById(tab).classList.add('active');
		event.currentTarget.classList.add('active');
		clearForm(); // 폼 필드 초기화
	}


    // 프로필 코멘트 길이 제한
    const maxLength = 172;
    const elements = document.getElementsByClassName('profComm');

    for (let i = 0; i < elements.length; i++) {
        const text = elements[i].textContent.trim();
        const truncatedText = text.length > maxLength ? text.substring(0, maxLength) + '...' : text;
        elements[i].textContent = truncatedText;
    }
    // 프로필 코멘트 길이 제한-끝

    $(document).ready(function () {   
        // 프로필 이미지 불러옴
        $('.prof').each(function () {
            var user_type = $(this).data('user-type');
            var snsEmail = $(this).data('user-email')
            
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
        });

        // 팔로우 기능
        $('.prof').each(function () {
            var followEmail = $(this).closest('.prof').data('user-email');
            var followUserType = $(this).closest('.prof').data('user-type');
            var loginEmail = $(this).closest('.prof').data('login-email');
            console.log("@# followEmail=>"+followEmail);
            console.log("@# followUserType=>"+followUserType);
            console.log("@# loginEmail=>"+loginEmail);
            
            var followData = {
                loginEmail: loginEmail,
                followEmail: followEmail,
                followUserType: followUserType
            };
            console.log("@# followData=>"+JSON.stringify(followData));

            var button = $(this).find('.followbtn');

            // 페이지 로드 시 팔로우 상태 확인
            $.ajax({
                url: '/follow/status',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(followData),
                success: function(isFollowed) {
                    if (isFollowed) {
                        button.addClass('followed');
                        button.text('팔로잉');
                    } else {
                        button.removeClass('followed');
                        button.text('팔로우');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('팔로우 상태 확인 실패:', error);
                }
            });

            // 버튼 클릭 시 팔로우 상태 토글 및 색상 변경
            button.on('click', function () {
                $.ajax({
                    url: '/follow/toggle',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(followData),
                    success: function(isFollowed) {
                    if (isFollowed) {
                        button.addClass('followed');
                        button.text('팔로잉');
                    } else {
                        button.removeClass('followed');
                        button.text('팔로우');
                    }
                    },
                    error: function(xhr, status, error) {
                        console.error('팔로우 상태 변경 실패:', error);
                        alert('팔로우 상태 변경 실패');
                    }
                });
            });
        });
    });

    // 프로필 이미지 불러옴
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
</script>
</html>