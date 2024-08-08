<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" id="boardStyle" href="${pageContext.request.contextPath}/css/announcementsTermsDetailView.css">
    <!-- import font-awesome, line-awesome -->
	<link rel="stylesheet" id="writeStyle" href="${pageContext.request.contextPath}/css/announcementsBoardModifyView.css" disabled>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
	<div id="maincontent">
    <section> 
        <div class="wrap">     
            <div class="board">
                <div class="titlebox">
                    <h5 class="title"></h5>
                </div> 
                <div class="lastline">
                    <div class="line1">
                        <div class="datebox">
                            <h5 class="date"></h5>
                        </div>
                    </div>
                    <div class="line2">
                        <div class="rightb2box">
                            <a href="#">
                                <h5 class="r2"></h5>
                            </a>
                        </div>
                    </div>
                </div> <!-- 라스트라인 끝 -->
                <div class="boardcontent">
                    <div class="contentbox">
                        <h5 class="content"></h5> 
                    </div> 
                </div><!-- 콘텐트 끝-->
                <div class="buttonbox">
                    <button class="button" id="editButton">
                        <h5 class="but2">수정</h5>
                    </button>
                    <button class="button" id="deleteButton">
                        <h5 class="but2">삭제</h5>
                    </button>
                    <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/announcementRest'">
                        <h5 class="but2">목록</h5>
                    </button>
                </div><!--버튼 끝 -->
            </div> <!-- board 끝-->
        </div> <!-- wrap 끝 -->
    </section> <!--section 끝 -->
	</div>

    <!-- 글쓰기 콘텐츠, 수정 모드 -->
    <div id="writecontent" style="display:none;">
		<!-- 섹션-->
		        <section> 
		            <div class="wrap">     
		                <div class="board">
		                    <div class="headbox">
		                        <h5 class="head">공지사항 수정</h5>
		                    </div>
		                    <div class="titlebox">
		                        <input id="titleInput" class="title" type="text" placeholder="제목을 입력해 주세요">
		                    </div> <!-- 콘텐트박스 끝-->

		                    
		                    <div class="contentbox">
		                        <textarea id="contentTextarea" class="content" placeholder="내용을 입력해 주세요"></textarea>
		                    </div>

		                    <div class="buttonbox">
		                        <button id="submitButton" class="button">
		                            <h5 class="but1">저장</h5>
		                        </button>
		                        <button id="cancelButton" class="button">
		                            <h5 class="but2">취소</h5>
		                        </button>
		                    </div><!--버튼 끝 -->
		                </div> <!--보드 끝-->
		            </div> <!-- wrap 끝 -->
		        </section> <!--섹션 끝 -->
    </div> <!-- writecontent 끝 -->

    <%@ include file="footer.jsp" %>

    <script>
        $(document).ready(function() {
			
			// 로그인 이메일을 가져옵니다.
			var loginEmail = '${login_email}'; // JSP에서 서버 측 데이터 삽입
            // URL에서 board_no를 추출합니다.
            var boardNo = window.location.pathname.split('/').pop(); // 예: /announcementRest/1 -> 1

			// AJAX 요청을 통해 공지사항 상세 정보를 가져옵니다.
			       $.ajax({
			           url: '/announcementRest/' + boardNo, // 데이터를 가져올 API URL
			           type: 'GET',
			           contentType: 'application/json',
			           dataType: 'json',
			           success: function(response) {
			               if (response) {
			                   // 서버에서 받은 공지사항 데이터로 페이지 내용을 업데이트
			                   $('.title').text(response.board_title); // 제목
			                   $('.date').text(response.create_date); // 생성일
			                   $('.content').text(response.board_content); // 내용
			                   
			                   // 로그인 이메일에 따라 버튼 표시/숨기기
			                   if (loginEmail === 'admin@admin.com') {
			                       $('#editButton').show();
			                       $('#deleteButton').show();
			                   } else {
			                       $('#editButton').hide();
			                       $('#deleteButton').hide();
			                   }
			               } else {
			                   alert("Failed to load data");
			               }
			           },
			           error: function(xhr, status, error) {
			               console.log("Error: " + error);
			               console.log("Status: " + status);
			               console.log(xhr.responseText);
			               alert("An error occurred: " + error);
			           }
			       });

            // 수정 버튼 클릭 이벤트 처리
            $('#editButton').click(function() {
                $.ajax({
                    url: '/announcementRest/' + boardNo, // 데이터를 가져올 API URL
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function(response) {
                        if (response) {
                            // 서버에서 받은 공지사항 데이터로 수정 폼에 데이터 설정
                            $('#titleInput').val(response.board_title); // 제목
                            $('#contentTextarea').val(response.board_content); // 내용
                            $('#writecontent').show(); // 수정 폼 보여주기
                            $('#maincontent').hide(); // 기존 콘텐츠 숨기기

                            // 새로운 CSS 파일 로드
                            $('#writeStyle').prop('disabled', false);
                            $('#boardStyle').prop('disabled', true);

                            // 브라우저의 URL을 변경하지 않으면서 상태를 업데이트
                            window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest/'+boardNo);
                        } else {
                            alert("Failed to load data for editing");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("Error: " + error);
                        console.log("Status: " + status);
                        console.log(xhr.responseText);
                        alert("An error occurred while fetching data for editing: " + error);
                    }
                });
            });

			// 저장 버튼 클릭 이벤트 처리
			    $(document).on('click', '#submitButton', function() {
			        var title = $('#titleInput').val();
			        var content = $('#contentTextarea').val();

			        if (!title || !content) {
			            alert('제목과 내용을 모두 입력해 주세요.');
			            return;
			        }

			        $.ajax({
			            url: '/announcementRest/' + boardNo, // 서버로 데이터를 전송할 API URL
			            type: 'PUT', // 수정 요청은 PUT 메서드를 사용
			            contentType: 'application/json',
			            dataType: 'json',
			            data: JSON.stringify({ board_title: title, board_content: content }), // JSON.stringify로 데이터 변환
			            success: function(response) {
			                alert('글이 수정되었습니다.');
			                $('#writecontent').hide(); // 수정 콘텐츠 숨기기
			                $('#maincontent').show(); // 기존 콘텐츠 보여주기
			                $('#writeStyle').prop('disabled', true);
			                $('#boardStyle').prop('disabled', false);
			                window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest');
			                location.reload(); // 데이터 갱신을 위해 페이지 새로고침
			            },
			            error: function(xhr, status, error) {
			                console.log("Error: " + error);
			                console.log("Status: " + status);
			                console.log(xhr.responseText);
			                alert("An error occurred while submitting the update: " + error);
			            }
			        });
			    });

            // 취소 버튼 클릭 이벤트 처리
            $(document).on('click', '#cancelButton', function() {
                $('#writecontent').hide(); // 수정 콘텐츠 숨기기
                $('#maincontent').show(); // 기존 콘텐츠 보여주기
                $('#writeStyle').prop('disabled', true);
                $('#boardStyle').prop('disabled', false);
                window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest');
            });

            // 삭제 버튼 클릭 이벤트 처리
            $('#deleteButton').click(function() {
                if (confirm("정말로 삭제하시겠습니까?")) { // 삭제 확인
                    $.ajax({
                        url: '/announcementRest/' + boardNo, // 삭제 요청을 보낼 API URL
                        type: 'DELETE',
                        success: function() {
                            alert("공지사항이 삭제되었습니다.");
                            window.location.href = '${pageContext.request.contextPath}/announcementRest'; // 삭제 후 목록 페이지로 이동
                        },
                        error: function(xhr, status, error) {
                            console.log("Error: " + error);
                            console.log("Status: " + status);
                            console.log(xhr.responseText);
                            alert("An error occurred: " + error);
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>