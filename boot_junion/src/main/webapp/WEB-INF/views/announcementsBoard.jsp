<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" id="boardStyle" href="${pageContext.request.contextPath}/css/announcementsBoard.css">
    <!-- 추가된 새로운 CSS는 비활성화된 상태로 시작 -->
    <link rel="stylesheet" id="writeStyle" href="${pageContext.request.contextPath}/css/announcementsBoardWriteView.css" disabled>
    <!-- import font-awesome, line-awesome -->
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
                    <div class="headbox2">
                        <h5 class="head1">공지사항</h5>
                        <div class="hbox">
                            <a class="hb1" id="writeButton">글쓰기</a>
                        </div>
                    </div>
                    <div class="secbox">
                        <div class="headbox">
                            <div class="listbox">
                                <div class="list">
                                    <div class="ll">
                                            <div class="tbtb">
                                                <!-- 이 부분은 AJAX 호출을 통해 동적으로 업데이트됨 -->
                                            </div>
                                    </div>
                                </div> <!-- 리스트 끝-->
                            </div> <!-- 리스트박스 끝-->
                        </div> <!-- headbox 끝-->
                    </div><!-- secbox 끝 -->
                </div> <!-- board 끝-->
            </div> <!-- wrap 끝 -->
        </section> <!-- section 끝 -->
    </div> <!-- main-content 끝 -->
    <!-- 글쓰기 콘텐츠가 페이지 내에서 동적으로 로드됨 -->
	<div id="writecontent" style="display:none;">
	    <section> 
	        <div class="wrap">     
	            <div class="board">
	                <div class="headbox">
	                    <h5 class="head">공지사항 작성</h5>
	                </div> 
	                <div class="titlebox">
	                    <input id="titleInput" class="title" type="text" placeholder="제목을 입력해 주세요" >
	                </div> <!-- titlebox 끝 -->
	                <div class="contentbox">
	                    <textarea id="contentTextarea" class="content" placeholder="내용을 입력해 주세요"></textarea>
	                </div>
	                <div class="buttonbox">
	                    <button id="submitButton" class="button">
	                        <h5 class="but1">등록</h5>
	                    </button>
	                    <button id="cancelButton" class="button">
	                        <h5 class="but2">취소</h5>
	                    </button>
	                </div><!-- buttonbox 끝 -->
	            </div> <!-- board 끝 -->
	        </div> <!-- wrap 끝 -->
	    </section> <!-- section 끝 -->
	</div> <!-- writecontent 끝 -->
    
	<script>
	    $(document).ready(function() {
	        // AJAX 요청을 통해 공지사항 목록 데이터를 가져옵니다.
	        $.ajax({
	            url: '${pageContext.request.contextPath}/announcementRest/data', // 데이터를 가져올 API URL
	            type: 'GET',
	            contentType: 'application/json',
	            dataType: 'json',
	            success: function(response) {
	                if (response.result) {
	                    var $tbody = $(".tbtb"); // 테이블의 <tbody> 요소를 선택
	                    $tbody.empty(); // 기존의 데이터 삭제

	                    // 서버에서 받은 데이터를 테이블에 추가
	                    $.each(response.data, function(idx, item) {
	                        $('<div class="trtr">')

	                            .append($('<div class="tdtd">').html('<a class="aaaa" href="' + '${pageContext.request.contextPath}/announcementRest/' + item.board_no + '">' + item.board_title + '</a>')) // Title with link

	                            .appendTo($tbody);
	                    });
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

	        // 글쓰기 버튼 클릭 이벤트 처리
	        $('#writeButton').click(function() {
	            $('#maincontent').hide(); // 기존 콘텐츠 숨기기
	            $('#writecontent').show(); // 새 콘텐츠 보여주기

	            // 새로운 CSS 파일 로드
	            $('#writeStyle').prop('disabled', false);
	            $('#boardStyle').prop('disabled', true);

	            // 브라우저의 URL을 변경하지 않으면서 상태를 업데이트
	            window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest');
	        });

	        // 등록 버튼 클릭 이벤트 처리
	        $(document).on('click', '#submitButton', function() {
	            var title = $('#titleInput').val();
	            var content = $('#contentTextarea').val();

	            if (!title || !content) {
	                alert('제목과 내용을 모두 입력해 주세요.');
	                return;
	            }

	            $.ajax({
	                url: '${pageContext.request.contextPath}/announcementRest', // 서버로 데이터를 전송할 API URL
	                type: 'POST',
	                contentType: 'application/json',
	                dataType: 'json',
	                data: JSON.stringify({ board_title: title, board_content: content }),
	                success: function(response) {
	                    if (response.result) {
	                        alert('글이 작성되었습니다.');
	                        $('#maincontent').show(); // 글쓰기 콘텐츠 숨기기
	                        $('#writecontent').hide(); // 기존 콘텐츠 보여주기
	                        $('#writeStyle').prop('disabled', true);
	                        $('#boardStyle').prop('disabled', false);
	                        window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest');
	                        location.reload(); // 데이터 갱신을 위해 페이지 새로고침
	                    } else {
	                        alert('글 작성에 실패했습니다.');
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.log("Error: " + error);
	                    console.log("Status: " + status);
	                    console.log(xhr.responseText);
	                    alert("An error occurred while submitting the post: " + error);
	                }
	            });
	        });

	        // 취소 버튼 클릭 이벤트 처리
	        $(document).on('click', '#cancelButton', function() {
	            $('#maincontent').show(); // 글쓰기 콘텐츠 숨기기
	            $('#writecontent').hide(); // 기존 콘텐츠 보여주기
	            $('#writeStyle').prop('disabled', true);
	            $('#boardStyle').prop('disabled', false);
	            window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest');
	        });
	    });
	</script>

	<%@ include file="footer.jsp" %>
</body>
</html>
