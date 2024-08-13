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
                            &nbsp;
                            <button class="btn1" onclick="switchTab('corporate', event)">기업</button>
                        </div>
                    </div>
                    <!-- 개인 리스트 시작 -->
                     ${login_email}
                    <div id="personal" class="form-box active">
                        <div class="profList">
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">김민준</h3></p>
                                        <p class="profCareer">fgghk132@naver.com</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">박필봉</h3></p>
                                        <p class="profCareer">웹 풀스텍 / 신입</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">김민준</h3></p>
                                        <p class="profCareer">웹 풀스텍 / 신입</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">김민준</h3></p>
                                        <p class="profCareer">웹 풀스텍 / 신입</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 개인 리스트 끝 -->
                    <!-- 기업 리스트 시작 -->
                    <div id="corporate" class="form-box">
                        <div class="profList">
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">김춘삼</h3></p>
                                        <p class="profCareer">웹 풀스텍 / 신입</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">나하나</h3></p>
                                        <p class="profCareer">웹 풀스텍 / 신입</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">나만득</h3></p>
                                        <p class="profCareer">웹 풀스텍 / 신입</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
                            <div class="prof">
                                <div class="profInfo">
                                    <img class="prof-img"></img>
                                    <div class="info">
                                        <p><h3 class="profName">이봉춘</h3></p>
                                        <p class="profCareer">웹 풀스텍 / 신입</p>
                                    </div>
                                    <button class="btn2">팔로우</button>
                                </div>
                                <div class="profComm">
                                    <p>
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                        이메일아이디(회원아이디)에 있는 자기소개를 기재해서 사용
                                    </p>
                                </div>
                            </div>
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

</script>
</html>