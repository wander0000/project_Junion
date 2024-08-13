<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<style>
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




</style>
</head>
<body>
    <div class="userWrapper">
        <!-- <img src="images/people.svg"alt=""> -->
        <div class="dorpdowmMain">
            <div class="dropdown">
                <div class="dropdownSub" id="dropdownSub">
                    <h4 class="name" name="user_name" style="cursor: pointer;">${login_name}</h4>
                    <div class="dropdownContent" id="dropdownContent">
                       
                        <!-- <a href="logout"><div>로그아웃</div></a> -->
                    </div> <!-- dropdownContent 끝-->
                    <span class="icon">
                        <i id="iconDown" class="fa-solid fa-caret-down" style="display: block; cursor: pointer;"></i>
                        <i id="iconUp" class="fa-solid fa-caret-up" style="display: none; cursor: pointer;"></i>
                    </span>
                </div> <!--dropdownSub 끝-->
            </div> <!--dropdown 끝-->
        </div><!--dropdownMain 끝-->
    </div>
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


    $(document).ready(function () {
				
        /*(comRegistModify 참고)
        이미지 파일 로딩//즉시실행함수
        */
        // user-email 변수 가져오기
        // var user_email = $(".userImage").data('user-email'); // 파일노출되는 div의 클래스명과 data이용
        // var user_email = "<c:out value='${userInfo.user_email}'/>"; //c:out으로(이건 개인마이페이지에서 사용하던 것)
        var login_email = "<c:out value='${login_email}'/>"; //세션에 저장된 이메일 가져오기
        var login_usertype = "<c:out value='${login_usertype}'/>"//기업인지 개인이지에 따라 사진을 불러오는 매핑이 다르므로 세션에서 user_type 가져옴
        console.log("login_email:", login_email);
        console.log("login_usertype:", login_usertype);

        // var uploadResultContainer = $(".userImage").find('.uploadResult ul');

        if (login_usertype == '1') {//개인이면

            $.ajax({
                url: '/getUserImageList',
                type: 'GET',
                data: { user_email: login_email },
                dataType: 'json',
                success: function (data) {
                    console.log("Ajax success:", data);
                    showUploadResultUser(data);
                    
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching file list for user_email ' + login_email + ':', error);
                }
            });//이미지가져오기 ajax 끝
        }else{//기업이면

            $.ajax({
                url: '/comInfoGetFileList',
                type: 'GET',
                data: { com_email: login_email },
                dataType: 'json',
                success: function (data) {
                    console.log("Ajax success:", data);
                    showUploadResultCom(data);
                    
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching file list for com_email ' + login_email + ':', error);
                }
            });//이미지가져오기 ajax 끝

        }
    
    // 개인회원 업로드된 파일 목록 표시
    function showUploadResultUser(uploadResultArr) {
        
        //드랍다운 부분에 사진 보이게(사진 여러개라면  하나만 보이게)
        var uploadUL = $(".userWrapper");
        var str = "";

        if (uploadResultArr.length > 0) { // 배열에 요소가 있는지 확인
            var obj = uploadResultArr[0]; // 첫 번째 요소 가져오기
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
            str += "<img src='/userImageDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";//이미지 출력처리(컨트롤러단)
        }

        uploadUL.prepend(str);


    }//showUploadResultUser function 끝


      // 기업회원 업로드된 파일 목록 표시
      function showUploadResultCom(uploadResultArr) {
        
        //드랍다운 부분에 사진 보이게(사진 여러개라면  하나만 보이게)
        var uploadUL2 = $(".userWrapper");
        var str2 = "";

        if (uploadResultArr.length > 0) { // 배열에 요소가 있는지 확인
            var obj = uploadResultArr[0]; // 첫 번째 요소 가져오기
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
            str2 += "<img src='/comDisplay?fileName=" + fileCallPath + "'>";//이미지 출력 처리(컨트롤러단)
        }

        uploadUL2.prepend(str2);


    }//showUploadResultUser function 끝


    
    
});// document ready 끝

//user_type 비교해서 드랍다운 페이지의 href다르게 하기
document.addEventListener('DOMContentLoaded', function() {
    var userType = "${login_usertype}"; // 서버 사이드에서 설정한 값
    // var login_usertype = "<c:out value='${login_usertype}'/>"

    console.log('userType:', userType);
    console.log('Type of userType:', typeof userType);
    var linkElement = document.getElementById('dropdownContent');
    str="";
    if (userType === '1') {
        linkElement.innerHTML = '<a href="userInfo"><div>개인 정보 관리</div></a><a href="logout"><div>로그아웃</div></a>';
    } else {
        linkElement.innerHTML = '<a href="companyInfoManagement"><div>기업 정보 관리</div></a><a href="logout"><div>로그아웃</div></a>';
    }
});

</script>