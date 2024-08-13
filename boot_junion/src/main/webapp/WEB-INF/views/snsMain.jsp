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
                            <div class="userBox" data-user-type="${dto.user_type}" data-user-email="${dto.login_email}">
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
                                <span class="commentIcon">
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

<!-- 모달 구조 -->
<div id="popupModal" class="modal">
    <div class="modal-content">
        <div class="popupDetail">
            <div class="detailBox">
                <div class="userBox">
                    <div class="left">
                        <div class="uploadResult">
                            <ul>
                                <img src="images/people.svg" alt="#" class="img">
                            </ul>
                        </div>
                    </div><!--left 끝-->
                    <div class="nameBox">
                        <h4>김정우</h4>
                    </div><!--nameBox 끝-->
                    <div class="right">
                        <button type="button">
                            팔로잉
                        </button>
                    </div><!--right 끝-->
                </div> <!--userBox 끝-->

                <div class="detailContent">
                    <div class="uploadResult">
                        <ul>
                            <img src="images/suji.jpg" alt="#" class="img">
                        </ul>
                    </div>
                    <textarea readonly>
개발을 쉽게하기 위해 어떤 도구들을 사용하고 계신가요?
아마 CI/CD나 Fastlane은 대부분 쓰고 계시겠죠? 
그 외에도 우리 개발자들을 편하게 해주는 여러 도구들이 있습니다.
React-Native를 개발할 때는 eslint를 사용했었는데 Swift 문법을 강제로하는 SwiftLint도 있네요 
전 사용해보진 않았지만...
사실 iOS는 협업을 해본적이 없어서 필요가 없었기 때문이죠.
React-Native를 개발할 때는 eslint를 사용했었는데 Swift 문법을 강제로하는 SwiftLint도 있네요 
전 사용해보진 않았지만...
개발을 쉽게하기 위해 어떤 도구들을 사용하고 계신가요?
아마 CI/CD나 Fastlane은 대부분 쓰고 계시겠죠? 
그 외에도 우리 개발자들을 편하게 해주는 여러 도구들이 있습니다.
React-Native를 개발할 때는 eslint를 사용했었는데 Swift 문법을 강제로하는 SwiftLint도 있네요 
전 사용해보진 않았지만...
사실 iOS는 협업을 해본적이 없어서 필요가 없었기 때문이죠.
React-Native를 개발할 때는 eslint를 사용했었는데 Swift 문법을 강제로하는 SwiftLint도 있네요 
전 사용해보진 않았지만...
개발을 쉽게하기 위해 어떤 도구들을 사용하고 계신가요?
아마 CI/CD나 Fastlane은 대부분 쓰고 계시겠죠? 
그 외에도 우리 개발자들을 편하게 해주는 여러 도구들이 있습니다.
React-Native를 개발할 때는 eslint를 사용했었는데 Swift 문법을 강제로하는 SwiftLint도 있네요 
전 사용해보진 않았지만...
사실 iOS는 협업을 해본적이 없어서 필요가 없었기 때문이죠.
React-Native를 개발할 때는 eslint를 사용했었는데 Swift 문법을 강제로하는 SwiftLint도 있네요 
전 사용해보진 않았지만...
                    </textarea>
                    <h5>5시간 전</h5>
                </div> <!--detailContent 끝-->
            </div> <!--detailBox 끝-->

            <div class="detailComment">
                <span class="xIcon">
                    <i class="fa-solid fa-xmark"></i>
                </span>
                <div class="commentContent">
                    <div class="commentCon">
                        <div class="left">
                            <div class="uploadResult">
                                <ul>
                                    <img src="images/people.svg" alt="#" class="img">
                                </ul>
                            </div>
                            <div class="nameBox">
                                <h4>이재현</h4>
                            </div><!--nameBox 끝-->
                        </div><!--left 끝-->
                        <div class="right">
                            <h4>우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...</h4>
                            <h5>방금</h5>
                        </div><!--right 끝-->
                    </div> <!--commentCon 끝-->
                    <div class="commentCon">
                        <div class="left">
                            <div class="uploadResult">
                                <ul>
                                    <img src="images/people.svg" alt="#" class="img">
                                </ul>
                            </div>
                            <div class="nameBox">
                                <h4>김정우</h4>
                            </div><!--nameBox 끝-->
                        </div><!--left 끝-->
                        <div class="right">
                            <h4>우와 짱이다...!</h4>
                            <h5>5분 전</h5>
                        </div><!--right 끝-->
                    </div> <!--commentCon 끝-->
                </div> <!--commentContent 끝-->

                <div class="commentBottom">
                    <div class="numberCount">
                        <!-- <div class="like"> -->
                            <h5>좋아요 5개</h5>
                        <!-- </div> -->
                        <!-- <div class="comment"> -->
                            <h5>댓글 4개</h5>
                        <!-- </div> -->
                    </div> <!--numberCount 끝-->

                    <form>
                        <div class="commentBox">
                            <span class="icon">
                                <i class="fa-regular fa-heart"></i>
                            </span>
                            <!-- <input type="text" placeholder="댓글 달기 ..."> -->
                            <div class="textarea-wrap">
                                <textarea placeholder="댓글 달기..."></textarea>
                            </div>
                            <input type="submit" value="게시">
                        </div> <!--commentBox 끝-->
                    </form>
                </div> <!--commentBottom 끝-->
            </div> <!--detailComment 끝-->

        </div> <!--popupDetail 끝-->
    </div>
</div>

<script>
$(document).ready(function () {
    $('.detailBox').each(function () {
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

    $('.userBox').each(function () {
        var user_type = $(this).data('user-type');
        var email = $(this).data('user-email')
        
        var uploadResultContainer = $(this).find('.UserImage ul');

        if (user_type) {
            var url;
            var emailParam = '';

            if (user_type == 1) {
                url = '/getUserImageList';
                emailParam = { user_email: email }
            } else if (user_type == 2) {
                url = '/mainComFileList';
                emailParam = { com_email: email }
            }
            $.ajax({
                url: url,
                type: 'GET',
                data: emailParam, // 이메일만 데이터로 전송
                dataType: 'json',
                success: function(data) {
                    showUploadResult(data, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for email ' + email + ':', error);
                }
            });
        }
    });

    // .snsMain .detailContent textarea를 클릭했을 때 모달 열기
    $(".snsMain .detailContent textarea").click(function () {
        $("#popupModal").css("display", "flex");
        $("body").addClass("modal-open"); // 모달 열릴 때 스크롤 방지
    });

    // .snsMain .detailBox .iconBox .commentIcon을 클릭했을 때 모달 열기
    $(".snsMain .detailBox .iconBox .commentIcon").click(function () {
        $("#popupModal").css("display", "flex");
        $("body").addClass("modal-open"); // 모달 열릴 때 스크롤 방지
    });

    // 모달 닫기
    $(".xIcon").click(function () {
        $("#popupModal").css("display", "none");
        $("body").removeClass("modal-open"); // 모달 닫힐 때 스크롤 재활성화
    });

    // 모달 외부 클릭 시 닫기
    $(window).click(function (event) {
        if ($(event.target).is("#popupModal")) {
            $("#popupModal").css("display", "none");
            $("body").removeClass("modal-open"); // 모달 닫힐 때 스크롤 재활성화
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

</body>
</html>
