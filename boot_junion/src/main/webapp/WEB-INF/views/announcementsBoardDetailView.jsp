<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" id="boardStyle" href="${pageContext.request.contextPath}/css/announcementsTermsDetailView.css">
    <link rel="stylesheet" id="writeStyle" href="${pageContext.request.contextPath}/css/announcementsBoardModifyView.css" disabled>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div id="maincontent">
        <section> 
            <div class="wrap">     
                <div class="board">
                    <div class="titlebox">
                        <h1 class="title"></h1>
                    </div> 
                    <div class="lastline">
                        <div class="line1">
                            <div class="datebox">
                                <h2 class="date"></h2>
                            </div>
                        </div>
                        <div class="line2">
                            <div class="rightb2box">
                                <a href="#">
                                    <span class="r2"></span>
                                </a>
                            </div>
                        </div>
                    </div> <!-- 라스트라인 끝 -->
                    <div class="boardcontent">
                        <div class="contentbox">
                            <pre class="content"></pre> 
                        </div> 
                    </div><!-- 콘텐트 끝-->
                    <div class="buttonbox">
                        <button class="button" id="editButton">
                            <span class="but2">수정</span>
                        </button>
                        <button class="button" id="deleteButton">
                            <span class="but2">삭제</span>
                        </button>
                        <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/announcementRest'">
                            <span class="but2">목록</span>
                        </button>
                    </div><!--버튼 끝 -->
                </div> <!-- board 끝-->
            </div> <!-- wrap 끝 -->
        </section> <!--section 끝 -->
    </div>

    <!-- 글쓰기 콘텐츠, 수정 모드 -->
    <div id="writecontent" style="display:none;">
        <section> 
            <div class="wrap">     
                <div class="board">
                    <div class="headbox">
                        <h1 class="head">공지사항 수정</h1>
                    </div>
                    <div class="titlebox">
                        <input id="titleInput" class="title" type="text" placeholder="제목을 입력해 주세요">
                    </div> <!-- 콘텐트박스 끝-->
                    <div class="contentbox">
                        <textarea id="contentTextarea" class="content" placeholder="내용을 입력해 주세요"></textarea>
                    </div>
                    <div class="buttonbox">
                        <button id="submitButton" class="button">
                            <span class="but1">저장</span>
                        </button>
                        <button id="cancelButton" class="button">
                            <span class="but2">취소</span>
                        </button>
                    </div><!--버튼 끝 -->
                </div> <!--보드 끝-->
            </div> <!-- wrap 끝 -->
        </section> <!--섹션 끝 -->
    </div> <!-- writecontent 끝 -->

    <%@ include file="footer.jsp" %>

    <script>
        $(document).ready(function() {
            var loginEmail = '${login_email}'; // JSP에서 서버 측 데이터 삽입
			
            var boardNo = window.location.pathname.split('/').pop(); // 예: /announcementRest/1 -> 1

            // AJAX 요청을 통해 공지사항 상세 정보를 가져옵니다.
            $.ajax({
                url: '/announcementRest/data/' + boardNo,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function(response) {
                    if (response) {
                        $('.title').text(response.board_title); // 제목
                        $('.date').text(response.create_date); // 생성일
                        $('.content').text(response.board_content); // 내용
                        
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
                    alert("An error occurred: " + error);
                }
            });

            $('#editButton').click(function() {
                $.ajax({
                    url: '/announcementRest/data/' + boardNo,
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function(response) {
                        if (response) {
                            $('#titleInput').val(response.board_title); // 제목
                            $('#contentTextarea').val(response.board_content); // 내용
                            $('#writecontent').show(); // 수정 폼 보여주기
                            $('#maincontent').hide(); // 기존 콘텐츠 숨기기

                            $('#writeStyle').prop('disabled', false);
                            $('#boardStyle').prop('disabled', true);

                            window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest/'+boardNo);
                        } else {
                            alert("Failed to load data for editing");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("Error: " + error);
                        alert("An error occurred while fetching data for editing: " + error);
                    }
                });
            });

            $(document).on('click', '#submitButton', function() {
                var title = $('#titleInput').val();
                var content = $('#contentTextarea').val();

                if (!title || !content) {
                    alert('제목과 내용을 모두 입력해 주세요.');
                    return;
                }

                $.ajax({
                    url: '/announcementRest/' + boardNo,
                    type: 'PUT',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({ board_title: title, board_content: content }),
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
                        alert("An error occurred while submitting the update: " + error);
                    }
                });
            });

            $(document).on('click', '#cancelButton', function() {
                $('#writecontent').hide(); // 수정 콘텐츠 숨기기
                $('#maincontent').show(); // 기존 콘텐츠 보여주기
                $('#writeStyle').prop('disabled', true);
                $('#boardStyle').prop('disabled', false);
                window.history.pushState({}, '', '${pageContext.request.contextPath}/announcementRest');
            });

            $('#deleteButton').click(function() {
                if (confirm("정말로 삭제하시겠습니까?")) {
                    $.ajax({
                        url: '/announcementRest/' + boardNo,
                        type: 'DELETE',
                        success: function() {
                            alert("공지사항이 삭제되었습니다.");
                            window.location.href = '${pageContext.request.contextPath}/announcementRest';
                        },
                        error: function(xhr, status, error) {
                            console.log("Error: " + error);
                            alert("An error occurred: " + error);
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
