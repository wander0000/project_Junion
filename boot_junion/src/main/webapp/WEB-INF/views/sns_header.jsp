<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sns_헤더</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!-- <link rel="stylesheet" href="src/main/resources/static/css/style.css"> -->
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

/* header  */
header 
{   
	height: 90px;
	/* border-bottom: 1px solid var(--border-color-gray); */
	width: 100%;
	/* background-color: var(--color-white); */
	position: fixed;
	/* z-index: -2; */
}

.snsHeader
{
	/* margin: 0 auto; */
	/* max-width: 1200px; */
	display: flex;
	align-items: center;
	height: 100%;
	/* margin-left: auto; */
}

.snsHeader .logo
{
	margin-right: auto;
	margin-left: 40px;
}

.snsHeader .user
{
	display: flex;
	margin-left: auto;
	margin-right: 40px;
}

.snsHeader .user .loginUserImg img
{
	width: 36px;
	height: 36px;
	border-radius: 50%;
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

.dropdownSub h4
{
	margin: 0 4px 0 12px;
	font-size: var(--font-size14);
	/* font-weight: 400; */
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

.followbtn {
    background-color: #FFA500;
    /* border: none; */
    border: solid 1px #FFA500;
    color: white;
    height: 28px;
    width: 53px;
    /* padding: 10px 20px; */
    border-radius: 5px;
    cursor: pointer;
    margin-top: 2px;
}
.followbtn.followed {
    background-color: #ffffff;
    border: solid 1px #dadada;
    color: #000;
}
</style>									
</head>
<body>
	<header>
		<div class="snsHeader">
			<h5 class="logo">
                <a href="main">
					<img src="${pageContext.request.contextPath}/images/logo.svg" alt="Logo">
                </a>
            </h5>
			<div class="user">
				<div class="loginUserImg">
					<ul>
						<!-- <img src="images/people.svg" alt="#" class="img"> -->
					</ul>
				</div>
				<div class="dorpdowmMain">
					<div class="dropdown">
						<div class="dropdownSub" id="dropdownSub">
							<!-- <h4 class="name" style="cursor: pointer;">${com_name}</h4> -->
							<h4 class="name" style="cursor: pointer;">${login_name}</h4>
							<div class="dropdownContent" id="dropdownContent">
								<a href="#" id="profileLink"><div>프로필</div></a>
								<a href="#" id="mypageLink"><div>마이페이지</div></a>
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
		</div>
	</header>
</body>
</html>
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

	$(document).ready(function(){
		var mypageLink = document.getElementById('mypageLink')
		var profileLink = document.getElementById('profileLink')
		if('${login_usertype}'==1){
			mypageLink.href='userInfo';
			profileLink.href='snsUserPage?user_email=${login_email}';
		}else if('${login_usertype}'==2){
			mypageLink.href='companyInfoManagement';
			profileLink.href='snsCompanyPage?com_email=${login_email}';
			}


		//이미지 업로드
		// JSP에서 login_email과 login_usertype 값을 가져옴
		var login_email = "<c:out value='${login_email}'/>";
		var login_usertype = "<c:out value='${login_usertype}'/>"; // 사용자 유형을 JSP에서 가져옴

		console.log("login_email:", login_email);

		// 업로드 결과를 표시할 컨테이너 찾기
		var uploadResultContainer = $(this).find('.loginUserImg ul');

		// 사용자 유형에 따라 다른 URL과 이메일 파라미터 설정
		if (login_email) {
			var url = '';
			var emailParam = '';

			if (login_usertype == 1) {
				url = '/getUserImageList';
				emailParam = { user_email: login_email }; // user_email로 데이터 전송
			} else if (login_usertype == 2) {
				url = '/mainComFileList';
				emailParam = { com_email: login_email }; // com_email로 데이터 전송
			}

			if (url) {
				$.ajax({
					url: url,
					type: 'GET',
					data: emailParam,
					dataType: 'json',
					success: function(data) {
						showUploadResult(data, uploadResultContainer);
					},
					error: function(xhr, status, error) {
						console.error('Error fetching file list for login_email ' + login_email + ':', error);
					}
				});
			}
		}

		// 결과 표시 함수
		function showUploadResult(uploadResultArr, uploadResultContainer) {
			if (!uploadResultArr || uploadResultArr.length === 0) {
				return;
			}

			var str = "";

			$(uploadResultArr).each(function (i, obj) {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

				str += "<li data-path='" + obj.uploadPath + "'";
				str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
				str += "<div>";
				str += "<span style='display:none;'>" + obj.fileName + "</span>";
				str += "<img src='/userImageDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
				str += "</div></li>";
			});

			uploadResultContainer.empty().append(str);
		}
	})

// ----------------------------------------------- 나성엽 -----------------------------------------

	// 채팅 입력시간 계산하는 메소드
    // BY 나성엽
    function timeAgo(date) {
        const MINUTE = 60;
        const HOUR = MINUTE * 60;
        const DAY = HOUR * 24;
        const WEEK = DAY * 7;
        const MONTH = DAY * 30;
        const YEAR = DAY * 365;

        const seconds = Math.floor((new Date() - date) / 1000);
        let interval = seconds / YEAR;

        if (interval > 1) {
            return Math.floor(interval) + "년 전";
        }
        interval = seconds / MONTH;
        if (interval > 1) {
            return Math.floor(interval) + "개월 전";
        }
        interval = seconds / WEEK;
        if (interval > 1) {
            return Math.floor(interval) + "주 전";
        }
        interval = seconds / DAY;
        if (interval > 1) {
            return Math.floor(interval) + "일 전";
        }
        interval = seconds / HOUR;
        if (interval > 1) {
            return Math.floor(interval) + "시간 전";
        }
        interval = seconds / MINUTE;
        if (interval > 1) {
            return Math.floor(interval) + "분 전";
        }
        return "방금";
    }

	// 팔로우 기능
	// BY 나성엽
	$(document).ready(function () {  
        $('.prof').each(function () {
            var followEmail = $(this).closest('.prof').data('user-email');
            var followUserType = $(this).closest('.prof').data('user-type');
            var loginEmail = $(this).closest('.prof').data('login-email');
            console.log("@# followEmail=>"+followEmail);
            console.log("@# followUserType=>"+followUserType);
            console.log("@# loginEmail=>"+loginEmail);

			if (followEmail == loginEmail && followUserType == 1) {
				$(this).find('.followbtn').hide();
			}
            
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

// ----------------------------------------------- 나성엽 끝 -----------------------------------------
</script>
