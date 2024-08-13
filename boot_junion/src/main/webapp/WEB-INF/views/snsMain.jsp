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
                        <div class="detailBox"
                            data-sns-num="${dto.sns_num}"
                            data-sns-name="${dto.sns_name}"
                            data-sns-title="${dto.sns_title}"
                            data-sns-content="${dto.sns_content}"
                            data-sns-date="${dto.sns_date}"
                            data-user-type="${dto.user_type}"
                            data-user-email="${dto.login_email}">
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
                                <div class="textArea">
                                    <div class="detailTitle">
                                        <h4>${dto.sns_title}</h4>
                                    </div>
                                    <textarea readonly>${dto.sns_content}</textarea>
                                </div>
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
                        <div class="popupUserImage">
                            <ul>
                                <img src="images/people.svg" alt="#" class="img">
                            </ul>
                        </div>
                    </div><!--left 끝-->
                    <div class="nameBox">
                        <h4 id="modalSnsName"></h4>
                    </div><!--nameBox 끝-->
                    <div class="right">
                        <button type="button">
                            팔로잉
                        </button>
                    </div><!--right 끝-->
                </div> <!--userBox 끝-->

                <div class="detailContent">
                    <div class="popupGetResult">
                        <ul>
                            <!-- <img src="images/suji.jpg" alt="#" class="img"> -->
                        </ul>
                    </div>
                    <div class="popupTextarea">
                        <h4 id="modalSnsTitle"></h4>
                        <textarea id="modalSnsContent" readonly></textarea>
                    </div>
                    <h5 id="modalSnsDate"></h5>
                </div> <!--detailContent 끝-->
            </div> <!--detailBox 끝-->

            <div class="detailComment">
                <span class="xIcon">
                    <i class="fa-solid fa-xmark"></i>
                </span>
                <div class="commentContent">
                    <div class="commentCon">
                        <div class="left">
                            <div class="commentUserImage">
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
                            <div class="commentUserImage">
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
</div> <!--모달 끝-->

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

    $('.detailBox').each(function () {
        var user_type = $(this).data('user-type');
        var snsEmail = $(this).data('user-email')
        
        var uploadResultContainer = $(this).find('.UserImage ul');

        if (user_type) {
            var url;
            var emailParam = '';

            if (user_type == 1) {
                url = '/getUserImageList';
                emailParam = { user_email: snsEmail }
            } else if (user_type == 2) {
                url = '/mainComFileList';
                emailParam = { com_email: snsEmail }
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

     // .snsMain .detailContent textarea, .snsMain .detailBox .iconBox .commentIcon를 클릭했을 때 모달 열기
     $(".snsMain .detailContent textarea, .snsMain .detailBox .iconBox .commentIcon").click(function () {
        var detailBox = $(this).closest('.detailBox');
        var snsNum = detailBox.data('sns-num');
        var snsName = detailBox.data('sns-name');
        var snsTitle = detailBox.data('sns-title');
        var snsContent = detailBox.data('sns-content');
        var snsDate = detailBox.data('sns-date');
        var user_type = detailBox.data('user-type');
        var snsEmail = detailBox.data('user-email');

        console.log("sns_num: " + snsNum);
        console.log("snsName: " + snsName);
        console.log("snsTitle: " + snsTitle);
        console.log("snsContent: " + snsContent);
        console.log("snsDate: " + snsDate);

        openModal(snsNum, snsName, snsTitle, snsContent, snsDate, user_type, snsEmail);
    });

    // 모달 닫기
    $(".close, .xIcon").click(function () {
        closeModal();
    });

    // 모달 외부 클릭 시 닫기
    $(window).click(function (event) {
        if ($(event.target).is("#popupModal")) {
            closeModal();
        }
    });

    // 모달 열기 함수
    function openModal(snsNum, snsName, snsTitle, snsContent, snsDate, user_type, snsEmail) {
        console.log("Opening modal for sns_num: " + snsNum); // 가져온 sns_num 확인
        console.log("Opening modal for snsUserType: " + user_type); // 가져온 sns_num 확인
        console.log("Opening modal for snsEmail: " + snsEmail); // 가져온 sns_num 확인
        $("#modalSnsName").text(snsName);
        $("#modalSnsTitle").text(snsTitle);
        $("#modalSnsContent").text(snsContent);
        $("#modalSnsDate").text(snsDate);

        $("#popupModal").css("display", "flex");
        $("body").addClass("modal-open"); // 모달 열릴 때 스크롤 방지

        // snsNum을 이용하여 모달에 사진 데이터 로드
        $.ajax({
            url: '/snsGetFileList',
            type: 'GET',
            data: { sns_num: snsNum },
            dataType: 'json',
            success: function(data) {
                // 모달 내부의 사진 컨테이너를 선택
                var modalPhotoContainer = $("#popupModal .popupGetResult ul");
                showUploadResult(data, modalPhotoContainer); // 사진 데이터 표시
            },
            error: function(xhr, status, error) {
                console.error('Error fetching file list for sns_num ' + snsNum + ':', error);
            }
        });

        if (user_type) {
            var url;
            var emailParam = '';

            if (user_type == 1) {
                url = '/getUserImageList';
                emailParam = { user_email: snsEmail }
            } else if (user_type == 2) {
                url = '/mainComFileList';
                emailParam = { com_email: snsEmail }
            }
            $.ajax({
                url: url,
                type: 'GET',
                data: emailParam, // 이메일만 데이터로 전송
                dataType: 'json',
                success: function(data) {
                    var modalPhotoContainer = $("#popupModal .popupUserImage ul");
                    showUploadResult(data, modalPhotoContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for email ' + email + ':', error);
                }
            });
        }
    }

    // 모달 닫기 함수
    function closeModal() {
        $("#popupModal").css("display", "none");
        $("body").removeClass("modal-open"); // 모달 닫힐 때 스크롤 재활성화

        // 모달 데이터 초기화
        $("#modalSnsName").text('');
        $("#modalSnsTitle").text('');
        $("#modalSnsContent").text('');
        $("#modalSnsDate").text('');
        $("#popupModal .popupGetResult ul").empty(); // 모달 내부의 사진 데이터 초기화
        $("#popupModal .popupUserImage ul").empty(); // 사용자 이미지 초기화
    }
    
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