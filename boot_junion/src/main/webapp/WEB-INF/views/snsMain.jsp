<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sns 메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsMain.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
    
    <div class="snsContainer">
        <%@ include file="sns_nav.jsp" %>

        <div class="snsContent">
            <%@ include file="sns_header.jsp" %> 

            <main>
                <div class="snsMain">
                    <div class="leftCon">
                        <c:forEach items="${snsList}" var="dto">
                            <div class="detailBox" data-sns-num="${dto.sns_num}">
                                <div class="userBox">
                                    <div class="left">
                                        <div class="UserImage">
                                            <ul>
                                                <img src="images/people.svg" alt="#" class="img">
                                            </ul>
                                        </div>
                                    </div><!--left 끝-->
                                    <div class="nameBox">
                                        <!-- <h4>수지야</h4> -->
                                        <h4>${dto.sns_name}</h4>
                                    </div><!--nameBox 끝-->
                                    <div class="right">
                                        <button type="button">
                                            팔로잉
                                        </button>
                                    </div><!--right 끝-->
                                </div> <!--userBox 끝-->
                
                                <div class="detailContent">
                                    <div class="mainGetResult">
                                        <ul>
                                            <!-- <img src="images/suji.jpg" alt="#" class="img"> -->
                                        </ul>
                                    </div>
                                    <div class="detailTitle">
                                        <h4>${dto.sns_title}</h4>
                                    </div>
                                    <textarea readonly>${dto.sns_content}</textarea>
                                </div> <!--detailContent 끝-->
                
                                <div class="iconBox">
                                    <span class="icon">
                                        <i class="fa-regular fa-heart"></i>
                                    </span>
                                    <span class="icon">
                                        <i class="fa-regular fa-comment"></i>
                                    </span>
                                    <h5>${dto.sns_date}</h5>
                                </div> <!--iconBox 끝-->
                
                            </div> <!--detailBox 끝-->
                        </c:forEach>

                    </div> <!--leftCon 끝-->
            
                    <div class="rightCon">
                        <h5 class="profile">추천 프로필</h5>
            
                        <div class="userBox">
                            <div class="left">
                                <div class="UserImage">
                                    <ul>
                                        <img src="images/people.svg" alt="#" class="img">
                                    </ul>
                                </div>
                            </div><!--left 끝-->
                            <div class="nameBox">
                                <h4>이재현</h4>
                                <h5>경력 3년차</h5>
                            </div><!--nameBox 끝-->
                            <div class="right">
                                <button type="button">
                                    팔로우
                                </button>
                            </div><!--right 끝-->
                        </div> <!--userBox 끝-->
                        <div class="userBox">
                            <div class="left">
                                <div class="UserImage">
                                    <ul>
                                        <img src="images/people.svg" alt="#" class="img">
                                    </ul>
                                </div>
                            </div><!--left 끝-->
                            <div class="nameBox">
                                <h4>이재현</h4>
                                <h5>경력 3년차</h5>
                            </div><!--nameBox 끝-->
                            <div class="right">
                                <button type="button">
                                    팔로우
                                </button>
                            </div><!--right 끝-->
                        </div> <!--userBox 끝-->
            
                        <h5 class="more">더 보기</h5>
                    </div> <!--rightCon 끝-->
            
                </div> <!--snsMain 끝-->
            </main>
            
        </div>
    </div>

</body>
</html>
<script>
$(document).ready(function () {
    ('.detailBox').each(function () {
        var sns_num = $(this).data('sns-num');
        
        var uploadResultContainer = $(this).find('.mainGetResult ul');

        if (sns_num) {
            $.ajax({
                url: '/snsGetFileList',
                type: 'GET',
                data: { sns_num: sns_num },
                dataType: 'json',
                success: function(data) {
                    showUploadResult(data, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for com_email ' + sns_num + ':', error);
                }
            });
        }
    });
});

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

