<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-회원정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
 

/* 메인 */
main 
	{
	display: flex;
	justify-content: center;
	padding: 50px 0 120px;  
	}

	.infoWrap
	{
		display: flex;
		flex-direction: column; 
		min-width:1200px;
		gap: 40px 0;
	}



/*회원정보수정 타이틀*/

.infoTitle
{
  font-size: var(--font-size32);
  color: var(--color-black);
}

/*회원사진 + 테이블*/
.infoConWrap
{
  display : flex;
  gap: 50px;
  min-width: 1200px;
  /* margin-top: 80px; */
}

/*회원사진*/
.infoConLeft 
{
	width: 120px;
}



/*회원사진*/
.infoCon img
{
  width: 120px;
  mask-image: url(images/circle100.png);
  -webkit-mask-image: url(images/circle100.png);
  mask-repeat: no-repeat;
  -webkit-mask-repeat: no-repeat;
  /* mask-position: center top; */
  mask-position: 50% 25%;/*0% 0% 가 왼쪽상단 100% 100%가 오른쪽 하단*/
  -webkit-mask-position: 50% 25%;
  /* clip-path: circle(100px at center); */
  overflow: hidden; /* 컨테이너 영역 밖 요소 숨김 */
    position: relative;
}


/*회원정보 테이블*/


.userInfoTable
{
  width: 1030px;
  border: 1px solid var(--input-gray);
  border-radius: 10px;
  box-sizing: border-box;
  border-collapse: collapse;
  font-size: var(--font-size16);
}
.userInfoTable th
{
  width: 300px;
  background-color: var(--button-gray);
}

.userInfoTable td
{
  /* width: 730px; */
}
.userInfoTable th, td
{
  /* border-bottom: 1px solid var(--input-gray); */
  border: 1px solid var(--input-gray);
  padding: 0 20px;
  text-align: start;
  height: 60px;
}

/*희망직무, 기술스택 버튼들 */
.userInfoTable .disF .position 
{
  display: flex;
  align-items: center;
  gap: 20px;
  width: inherit;
}

.userInfoTable .disF .stack 
{
  display: flex;
  align-items: center;
  gap: 20px;
  width: inherit;
}

.userInfoTable td .Btn
{
  background-color: #f7f7f7;
	border: 1px solid var(--input-gray);
	color: #777;
	font-size: var(--font-size14);
	border-radius: 6px;
	align-items:center;
	justify-content:center; 
	padding: 8px 10px;
}


/*수정버튼*/
.modifyBtn
{
  display: flex;
  justify-content: center;
}
.buttonModify
{
  background-color: #999;
  border: none;
  /* border: 1px solid var(--input-gray); */
  border-radius: 6px;
  width: 240px;
  height: 56px;
  /* margin: 40px auto; */
  font-size: 16px;
  color: var(--color-white);
  cursor: pointer;
}



   
</style>
</head>
<body>
    <div class="container">
		<%@ include file="nav_individual.jsp" %>
		<div class="mainContent">        
      <header>
        <%@ include file="dropdown.jsp" %>
      </header>   

            <main>
                <div class="mainContainer">
                    <form method="post" id="userInfoForm" action="modifyPage">
                        <div class="infoWrap">
                            <h2 class="infoTitle">회원 정보 수정</h2>
                            <div class="infoConWrap">
                                <div class="infoCon left">
                                    <div class="uploadResult">
                                        <ul >
                          
                                        </ul>
                                    </div>
                                    <!-- <img src="images/people.svg" alt="#" class="resumeImage"> -->
                                </div>
                                <div class="infoCon right">
                                    <table class="userInfoTable">	
                                        <tr>
                                            <th>이름</th>
                                            <td>${userInfo.user_name}</td>
                                        </tr>
                                        <tr>
                                          <th>이메일</th>
                                          <td>${userInfo.user_email}</td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td>${userInfo.user_birthdate}</td>
                                        </tr>
                                        <tr>
                                            <th>성별</th>
                                            <td>${userInfo.user_gender}</td>  
                                        </tr>
                                        <tr>
                                            <th>휴대폰</th>
                                            <td>${userInfo.user_tel}</td>
                                        </tr>
                                        <tr>
                                          <th>희망직무</th>
                                          <td class="disF">
                                              <div class="position" id="position">
                                                  <c:forEach items="${userInfo.jobInfo}" var="dto">
                                                    <input type="button" class="Btn" value="${dto.job_name}">
                                                  </c:forEach>
                                              </div>
                                          </td>
                                        </tr>
                                        <tr>
                                            <th>기술스택</th>
                                            <td class="disF">
                                                <div class="stack" id="stack">
                                                  <c:forEach items="${userInfo.stackInfo}" var="dto">
                                                    <input type="button" class="Btn" value="${dto.stack_name}">
                                                  </c:forEach>  
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                          <th>희망근무지역</th>
                                          <td>${userInfo.user_location} ${userInfo.user_location2}</td>
                                      </tr>
                                    </table>
                                </div><!-- infoCon right 끝 -->
                            </div> <!-- infoConWrap 끝-->
                            <div class="modifyBtn">
                                <button class="buttonModify">수정</button>
                                <!-- <button class="buttonModify" onclick="location.href='/modifyPage'">수정</button> -->
                            </div>
                        </div> <!--infoWrap끝 : 개인정보  -->
                    </form>
                </div> <!-- mainContainer 끝 : 전체 1200 영역-->
            </main>
        </div><!-- mainContent-->
    </div>    
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>

$(document).ready(function () {
				
				/*
				2024-8-06 서연주(comRegistModify 참고)
				이미지 파일 로딩//즉시실행함수
				*/
				// user-email 변수 가져오기
				// var user_email = $(".userImage").data('user-email'); // 파일노출되는 div의 클래스명과 data이용
				var user_email = "<c:out value='${userInfo.user_email}'/>"; //c:out으로
				console.log("user_email:", user_email);

				// var uploadResultContainer = $(".userImage").find('.uploadResult ul');

				if (user_email) {
					$.ajax({
						url: '/getUserImageList',
						type: 'GET',
						data: { user_email: user_email },
						dataType: 'json',
						success: function (data) {
							console.log("Ajax success:", data);
							showUploadResult(data);
						},
						error: function (xhr, status, error) {
							console.error('Error fetching file list for user_email ' + user_email + ':', error);
						}
					});
				}


				// 이미지 파일 표시
				function showUploadResult(uploadResultArr) {
					if (!uploadResultArr || uploadResultArr.length === 0) {
						return;
					}

					var uploadUL = $(".uploadResult ul");
					var str = "";

					$(uploadResultArr).each(function (i, obj) {
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
						str += "<div>";
						str += "<span style='display:none;'>" + obj.fileName + "</span>";
						str += "<img src='/userImageDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";//이미지 출력처리(컨트롤러단)
						str += "</div></li>";
					});

					uploadUL.append(str);

          //드랍다운 부분에 사진 보이게
					// var uploadUL2 = $(".userWrapper");
					// var str2 = "";

					// $(uploadResultArr).each(function (i, obj) {
					// 	var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

					// 	str2 += "<img src='/userImageDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";//이미지 출력처리(컨트롤러단)
					// });

					// uploadUL2.prepend(str2);
				}//showUploadResult function 끝

  });//document ready 끝



</script>