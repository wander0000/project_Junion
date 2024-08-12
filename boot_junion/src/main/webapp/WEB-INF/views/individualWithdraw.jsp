<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-마이페이지-탈퇴</title>
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
	
	
	
	/*메인콘텐츠 전체*/
	
	section
	{
	  display: flex;
	  justify-content: center;
	  min-width: 1200px;
	}
	
	
	/* 탈퇴 전체 영역 */
	.mainContent .mainContainer
	{
	  display: flex;
	  flex-direction: column; 
	  width: 355px;
	  margin-top: 70px;
	  gap: 40px 0;
	   
	}
	
	/* 탈퇴 안내영역 */
	.mainContainer .mainContainerContent
	{
	  display: flex;
	  flex-direction: column; 
	  gap : 25px 0;
	}
	
	/* 탈퇴 타이틀 */
	.mainContent .mainContainer .mainContainerContent .withdrawTitle
	{
	  font-size: var(--font-size32);
	  color: var(--color-black);
	  text-align: center;
	  /* margin-bottom: 25px; */
	}
	
	/* 탈퇴 상세안내 */
	.mainContent .mainContainer .mainContainerContent .withdrawContent
	{
	  display: flex;
	  flex-direction: column; 
	  gap:20px 0;
	  font-size: var(--font-size14);
	  text-indent: -9px;
	  text-align: justify;
	}
	
	/* input-box  여기 안먹네...*/
	.mainContent .mainContainer .inputBox
	{
	  display: flex;
	  flex-direction: column; 
	  gap : 20px 0;
	  width : 355px;
	}
	
	/* input_box들  */
	.mainContainer .inputBox input
	{
	height: 56px;
	border: 1px solid var(--input-gray);
	border-radius: 6px;
	padding: 0 20px;
	}
	
	
	/* 탈퇴 버튼 */
	.mainContainer .inputBoxes button.withdrawButton
	{
	  width: 355px;
	  height: 56px;
	  background-color: var(--main-color);
	  border:0;
	  color: var(--color-white);
	  font-size: var(--font-size16);
	  border-radius: 6px;
	  cursor: pointer;
	}
	
	
	/* 팝업 */
	
	.popUp
	{
	  display: none;
	}
	.popBg 
	{
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100vw;
	  height: 100vh;
	  background:rgba(0,0,0,0.6);
	}
	
	.popCon
	{
	  display: flex;
	  flex-direction: column;
	  background-color: #fff;
	  width: 500px;
	  height: 250px;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%,-50%);
	  box-shadow: 7px 7px 5px rgba(0, 0, 0, 0.2);
	  border-radius: 15px;
	  align-items: center;
	  /* justify-content: center; */
	}
	.popUp .popH
	{
	  margin-left: auto;
	}
	
	.popUp .popH .icon i
	{
	  font-size: 20px;
	  cursor: pointer;
	}
	
	.popConM
	{
		display: flex;
		flex-direction: column;
		gap: 40px 0;
	}
	
	.popH 
	{
		padding: 20px 20px;
	    z-index: 99;
	}
	
	.popM
	{
	  display: flex;
	  flex-direction: column;
	  gap: 10px 0
	}
	
	.popM .title
	{
	  font-size: var(--font-size24);
	  text-align: center;
	}
	.popM .sub
	{
	  font-size: var(--font-size14);
	  text-align: center;
	  font-weight:300;
	}
	
	.popB
	{
	  display: flex;
	  justify-content: center;
	  gap: 0 20px;
	}
	.popB button.submit 
	{
		min-width: 100px;
		background-color: var(--main-color);
		border: none;
		color: var(--color-white);
		font-size: var(--font-size16);
		border-radius: 6px;
		padding: 10px 20px;
	}
	.popB button.cancel 
	{
		min-width: 100px;
		background-color: #f7f7f7;
		border: 1px solid var(--input-gray);
		color: #111;
		font-size: var(--font-size16);
		border-radius: 6px;
		padding: 10px 20px;
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
				<section>
	                <div class="mainContainer">
	                    <div class="mainContainerContent">
	                        <h3 class="withdrawTitle">
	                            회원 탈퇴 시 주의사항
	                        </h3>         
	                        <div class="withdrawContent">
	                            <p>· 탈퇴 시 '주니온'을 통해 진행된 모든 지원과 면접 제안이 자동 취소됩니다.</p>
	                            <p>· 탈퇴 시 '주니온'를 통해 등록한 서비스의 모든 정보가 영구적으로 삭제되며, 복구가 불가능합니다.</p>
	                            <p>· 주니온'으로 등록한 서비스의 정보 백업은 탈퇴 이전에 진행해 주세요.</p>
	                            <p>· 서비스 이용 중 ‘주니온' 계정에 귀속되지 않는 정보는 삭제되지 않으며, 탈퇴 시 수정이나 삭제가 불가능합니다.</p>
	                            <p>· '주니온' 계정에 귀속되지 않은 정보의 경우 회원 탈퇴 이전에 수정 또는 삭제해 주세요.</p>
	                        </div><!-- withdrawContent -->
	                    </div><!-- mainContainerContent -->
	                    <div class="inputBoxes">
	                        <form class="inputBox" method="post" id="withdrawForm">
	                            <input type="email" name="user_email" id="email" value required placeholder="아이디">
	                            <input type="password" name="user_pw" id="password" autocomplete="off" value required placeholder="비밀번호">
	                            <button class="withdrawButton" type="submit">회원탈퇴</button>
	                        </form>
	                        <!-- pop 영역 -->
	                        <div class="popUp">
	                            <div class="popBg">
	                                <div class="popCon disF flexD">
	                                    <div class="popH mlauto">
	                                        <span class="icon cancel fs24">
	                                            <i class="fa-solid fa-xmark"></i>
	                                        </span>
	                                    </div>
										<div class="popConM">
											<div class="popM">
												<h4 class="title">정말로 탈퇴하시겠습니까?</h5>
												<h5 class="sub">모든 정보가 영구적으로 삭제됩니다.</h5>
											</div>
											<div class="popB">
												<button class="submit" type="submit">예</button>
												<button class="cancel" type="reset">아니오</button>
											</div>   
										</div>   
	                                </div>
	                            </div> 
	                        </div><!-- pop 영역 끝-->
	                    </div> <!-- inputBoxes 끝-->
	                </div> <!-- mainContainer -->
	            </section>
		 </div> <!-- mainContent -->
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	$(document).ready(function()
	{

		/*
			2024-07-02 서연주
		
			회원탈퇴 확인 POPUP > 탈퇴완료
		*/
		$("button.withdrawButton").on("click",function(e){
			e.preventDefault();
		
			// var email = document.getElementById('email'); //[object HTMLInputElement]
			var email = document.getElementById('email').value;
			var password = document.getElementById('password').value;
			console.log(email);
			console.log(password);
			
			var login_email = '<%=(String)session.getAttribute("login_email")%>';
			var login_pw = '<%=(String)session.getAttribute("login_pw")%>';
			console.log(login_pw);
			console.log(login_email);

			// if(!email.value){
			if(!email){
				alert("아이디를 입력해주세요.");
			// }else if(!password.value){
			}else if(!password){
				alert("비밀번호를 입력해주세요.");
			}else if(email != login_email){
				alert("회원 아이디가 일치하지 않습니다.");
				alert("입력한 email"+email+"세션이메일"+login_email);
			}else if(password != login_pw){
				alert("비밀번호가 일치하지 않습니다.")
			}else{
				$(this).parents().siblings(".popUp").show();
			}

			$(".popUp .submit").on("click",function(e){
				e.preventDefault();
				console.log("탈퇴팝업 예 누름");
				var withdrawForm = $("#withdrawForm");
				
				withdrawForm.attr("action","delUserInfo").submit();//삭제할 회원정보가지고 콘트롤러단으로
	
			}); 
		});
		/*
			2024-07-02 서연주
		
			회원탈퇴 POPUP > 닫기
		*/
		$('.popUp .icon.cancel').click(function(){
			console.log("click");
			$(this).parents('.popUp').css({"display":"none"}); 
		}); 
	
		$('button.cancel').click(function(){
			console.log("click");
			$(this).parents('.popUp').css({"display":"none"}); 
		}); 





	});
</script>
