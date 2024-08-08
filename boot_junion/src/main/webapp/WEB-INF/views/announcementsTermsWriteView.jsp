<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 목록페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/announcementsTermsWriteView.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->

</head>

<body>
	<%@ include file="header.jsp" %>
	<!-- 섹션-->
	        <section> 
	            <div class="wrap">     
	                <div class="board">

						<form id="frm" method="post" action="announcementsTermsWrite"> <!-- 폼 시작 -->
							<input type='hidden' name="login_email" value='${login_email}'>
							
		                    <div class="headbox">
		                        <h5 class="head">
		                            회원약관 작성
		                        </h5>
								
								
								
		                    </div> 
							
							<div class="selectbox">
							    <label for="term_type"></label>
							    <select class="termtype" id="term_type" name="term_type">
							        <option value="개인">개인</option>
							        <option value="기업">기업</option>
							    </select>
							</div> <!-- 드롭박스 끝 -->
							
		                    <div class="titlebox">
		                        <input id="board_title" class="title" type="text" placeholder="제목을 입력해 주세요" name="board_title">
		                    </div> <!-- 콘텐트박스 끝-->
	
		                    
		                    <div class="contentbox">
		                        <textarea id="board_content" class="content" placeholder="내용을 입력해 주세요" name="board_content"></textarea>
		                    </div>
	
		                    <div class="buttonbox">
		                        <button class="button" type="submit" id="submit_button">
		                            <h5 class="but1">등록</h5>
		                        </button>
		                        <button class="button" formaction="announcementsTerms" id="cancel_button">
		                            <h5 class="but2">취소</h5>
		                        </button>
		                    </div><!--버튼 끝 -->
						</form> <!-- 폼 끝 -->

	                </div> <!--보드 끝-->


	            </div> <!-- wrap 끝 -->
	        </section> <!--섹션 끝 -->
	
	<%@ include file="footer.jsp" %>
</body>


</html>
<script>
$(document).ready(function() {
    $('#frm').on('submit', function(event) {
        var title = $('#board_title').val().trim();
        var content = $('#board_content').val().trim();

        // 취소 버튼이 클릭된 경우는 유효성 검사를 하지 않음
        if ($(event.originalEvent.submitter).attr('id') === 'cancel_button') {
            return; // 취소 버튼 클릭 시 유효성 검사 하지 않음
        }

        if (!title || !content) {
            alert('제목과 내용을 모두 입력해 주세요.');
            event.preventDefault(); // 폼 제출을 막음
        }
    });
});
</script>












