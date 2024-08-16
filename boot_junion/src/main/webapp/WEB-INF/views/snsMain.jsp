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
                                            <!-- <img src="images/people.svg" alt="#" class="img"> -->
                                        </ul>
                                    </div>
                                </div><!--left 끝-->
                                <div class="nameBox">
                                    <!-- <h4>수지야</h4> -->
                                    <h5 class="nana">
                                        <a href="#" id="userProfileLink" style="color: var(--color-black);">
                                            ${dto.sns_name}
                                        </a>
                                    </h5>
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
                                        <h4 class="snsntitle">${dto.sns_title}</h4>
                                    </div>
                                </div>
								<h5 class="snsn" id="snsnTextarea" readonly>${dto.sns_content}</h5>
								<button type="button" class="more-btn" style="display:none;">더보기</button>
                            </div> <!--detailContent 끝-->
            
                            <div class="iconBox">
                                <span class="icon">
                                    <i class="fa-regular fa-heart"></i>
                                </span>
                                <span class="commentIcon">
                                    <i class="fa-regular fa-comment"></i>
                                </span>
                                <h5 class="datete">${dto.sns_date}</h5>
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
        
                    
                        <h5 class="more">
                            <a href="SNSRecommendUser" style="color: var(--color-gray);">
                                더 보기
                            </a>
                        </h5>
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
                        <h4 id="modalSnsName" class="snsnsn"></h4>
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

                    <div class="commentBox">
                        <span class="icon">
                            <i class="fa-regular fa-heart"></i>
                        </span>
                        <form id="commentForm">
                            <input type="hidden" name="sns_num" value="${dto.sns_num}">
                            <input type="hidden" name="login_email" value="${login_email}">
                            <input type="hidden" name="user_type" value="${login_usertype}">
                            <div class="textarea-wrap">
                                <textarea name="sns_comment_content" placeholder="댓글 달기..."></textarea>
                            </div>
                            <input type="submit" value="게시">
                        </form>
                    </div> <!--commentBox 끝-->
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
        var snsEmail = $(this).data('user-email');
        
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

        var userProfileLink = $(this).find('#userProfileLink');

        if (user_type == 1) {
            userProfileLink.attr('href', 'snsUserPage?user_email=' + snsEmail);
        } else if (user_type == 2) {
            userProfileLink.attr('href', 'snsCompanyPage?com_email=' + snsEmail);
        }

    });

     // .snsMain .detailContent textarea, .snsMain .detailBox .iconBox .commentIcon를 클릭했을 때 모달 열기
     $(".snsMain .detailContent .snsn, .snsMain .detailBox .iconBox .commentIcon").click(function () {
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
	
	
	$('.detailBox').each(function () {
	       var snsnText = $(this).find('.snsn');
	       var moreBtn = $(this).find('.more-btn');

	       // 텍스트가 5줄을 초과하면 "더보기" 버튼을 표시
	       if (snsnText[0].scrollHeight > snsnText.height()) {
	           moreBtn.show();
	       }

	       // "더보기" 버튼 클릭 시 전체 텍스트 표시
	       moreBtn.click(function () {
	           if (snsnText.hasClass('expanded')) {
	               // 이미 확장된 상태라면 접기 동작 수행
	               snsnText.removeClass('expanded');
	               snsnText.css({
	                   '-webkit-line-clamp': 5,
	                   'max-height': 'calc(1.2em * 5)',
	                   'overflow': 'hidden',
	               });
	               moreBtn.text('더보기');
	           } else {
	               // 확장되지 않은 상태라면 더보기 동작 수행
	               snsnText.addClass('expanded');
	               snsnText.css({
	                   '-webkit-line-clamp': 'unset',
	                   'max-height': 'none',
	                   'overflow': 'visible',
	               });
	               moreBtn.text('접기');
	           }
	       });
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
<script>
    $(document).ready(function () {
        $('#commentForm').on('submit', function (e) {
            e.preventDefault(); // 기본 폼 제출 방지
    
            var formData = {
                sns_num: $('input[name="sns_num"]').val(),
                login_email: $('input[name="login_email"]').val(),
                user_type: $('input[name="user_type"]').val(),
                sns_comment_content: $('textarea[name="sns_comment_content"]').val()
            };
    
            $.ajax({
                url: '${pageContext.request.contextPath}/api/commentWrite',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    if (response) {
                        var newComment = '<div class="commentCon">' +
                                            '<div class="left">' +
                                                '<div class="commentUserImage">' +
                                                    '<ul>' +
                                                        '<img src="${pageContext.request.contextPath}/images/people.svg" alt="#" class="img">' +
                                                    '</ul>' +
                                                '</div>' +
                                                '<div class="nameBox">' +
                                                    '<h4>' + response.login_email + '</h4>' +
                                                '</div>' +
                                            '</div>' +
                                            '<div class="right">' +
                                                '<h4>' + response.sns_comment_content + '</h4>' +
                                                '<h5>'+response.sns_comment_date+'</h5>' +
                                            '</div>' +
                                         '</div>';
    
                        $('.commentContent').append(newComment); // 새로운 댓글을 댓글 목록에 추가
    
                        // 폼 초기화
                        $('#commentForm textarea').val('');
                    } else {
                        alert('댓글 작성에 실패했습니다. 다시 시도해 주세요.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('댓글 작성 중 오류 발생:', error);
                    alert('댓글 작성에 실패했습니다. 다시 시도해 주세요.');
                }
            });
        });
    });
    </script>

</body>
</html>
