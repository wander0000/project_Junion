<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>snsCompanypage</title>
            <!-- import font-awesome, line-awesome -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}css/snsCompanypage.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
            <!-- import js -->
            <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        </head>

        <body>
            <c:set var="com_email" value="${param.com_email}" />
            <div class="snsContainer">

                <div class="snsContent">
                    <%@ include file="sns_header.jsp" %>

                        <main>
                            <section class="snsCompanyPage">
                                <div class="bgH"></div>
                                <div class="contentWrap">
                                    <div class="content profile">
                                        <div class="profileInfo" data-login-email="${login_email}"
                                            data-user-type="${company.user_type}" data-user-email="${com_email}">
                                            <div class="UserProfileImage">
                                                <ul>
                                                    <!-- <img class="img" src="/images/n.png" alt=""> -->
                                                </ul>
                                            </div>
                                            <h3 class="name">${company.com_name}</h3>
                                            <!-- <p>User Type: ${company.user_type}</p>
                                            <p>User Email: ${com_email}</p> -->
                                            <!-- <p class="com_content">${company.com_content}</p> -->
                                            <button class="following">팔로잉</button>
                                            <a href="comDetail?com_email=${com_email}" type="button"
                                                class="detailPage">상세
                                                페이지</a>
                                        </div>
                                        <div class="profileCon follower">
                                            <div class="follow">
                                                <h5 class="proflieConTitle">팔로워</h5>
                                                <span class="icon">
                                                    <i class="fa-regular fa-thumbs-up" style="cursor: pointer;"></i>
                                                </span>
                                            </div>
                                            <h3 class="followerNum">20</h3>
                                        </div>
                                        <div class="profileCon CEO">
                                            <h5 class="proflieConTitle">CEO</h5>
                                            <div class="positionWrap">
                                                <h3>${company.com_person}</h3>
                                            </div>
                                        </div>
                                        <div class="profileCon tel">
                                            <h5 class="proflieConTitle">번호</h5>
                                            <div class="positionWrap">
                                                <h3>${company.com_tel}</h3>
                                            </div>
                                        </div>
                                        <div class="profileCon location">
                                            <h5 class="proflieConTitle">주소</h5>
                                            <div class="positionWrap">
                                                <h3>
                                                    ${company.com_location}
                                                </h3>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="content info">
                                        <div class="tabWrap">
                                            <div class="tab board active">게시글</div>
                                        </div>


                                        <div class="contentBoard active">
                                            <div class="contentBoardWrap">
                                                <c:if test="${com_email == sessionScope.login_email}">
                                                    <button class="writing">작성하기</button>
                                                </c:if>
                                                <c:forEach items="${snsList}" var="dto">
                                                    <c:if test="${dto.login_email == com_email}">
                                                        <div class="detailBox" data-sns-num="${dto.sns_num}"
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
                                                                            <img src="images/people.svg" alt="#"
                                                                                class="img">
                                                                        </ul>
                                                                    </div>
                                                                </div><!--left 끝-->
                                                                <div class="nameBox">
                                                                    <!-- <h4>수지야</h4> -->
                                                                    <h5 class="nana">
                                                                        <a href="#" id="userProfileLink"
                                                                            style="color: var(--color-black);">
                                                                            ${dto.sns_name}
                                                                        </a>
                                                                    </h5>
                                                                </div><!--nameBox 끝-->
                                                                <div class="right">
                                                                    <button type="button">
                                                                        팔로잉
                                                                    </button>
                                                                    <c:if
                                                                        test="${com_email == sessionScope.login_email}">
                                                                        <span class="icon">
                                                                            <i
                                                                                class="fa-solid fa-ellipsis-vertical"></i>
                                                                        </span>
                                                                        <div class="option">
                                                                            <!-- <h5>수정하기</h5> -->
                                                                            <h5>삭제하기</h5>
                                                                        </div>
                                                                    </c:if>
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
                                                                <h5 class="snsn" id="snsnTextarea" readonly>
                                                                    ${dto.sns_content}</h5>
                                                                <button type="button" class="more-btn"
                                                                    style="display:none;">더보기</button>
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
                                                    </c:if>
                                                </c:forEach>
                                            </div> <!-- contentBoardWrap -->
                                        </div> <!-- contentBoard -->
                                    </div>
                                </div>
                            </section>
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
                                        <h4>우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와 짱이다...우와
                                            짱이다...</h4>
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
        </body>

        </html>
        <script>
            $(document).ready(function () {

                // 각 detailBox 내에서 .option 활성화
                $('span.icon').click(function () {
                // 현재 아이콘의 가장 가까운 .detailBox를 찾고 그 안의 .option을 활성화
                    $(this).closest('.detailBox').find('.option').addClass('active');
                });

                // .option의 h5 클릭 시, 해당 .option을 비활성화
                $('.option h5').click(function () {
                // 클릭된 h5의 부모 .option을 비활성화
                    $(this).closest('.option').removeClass('active');
                });

                // '작성하기' 버튼 클릭 시 모달 열기
                $('.writing').on('click', function (event) {
                    event.preventDefault();
                    $('#writeModal').css('display', 'flex');
                    $('body').css({
                        'overflow': 'hidden',
                        'margin-right': '0px' // 스크롤바 너비만큼 오른쪽 마진 추가
                    });
                });

                $('.detailBox').each(function () {
                    var sns_num = $(this).data('sns-num');

                    var uploadResultContainer = $(this).find('.mainGetResult ul');

                    if (sns_num) {
                        $.ajax({
                            url: '/snsGetFileList',
                            type: 'GET',
                            data: { sns_num: sns_num },
                            dataType: 'json',
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
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
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
                                console.error('Error fetching file list for email ' + email + ':', error);
                            }
                        });
                    }
                });
                function showUploadResult(uploadResultArr, uploadResultContainer) {
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

            });
        </script>

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
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
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
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
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

                // .snscontentBoardMain .detailContent textarea, .contentBoard .detailBox .iconBox .commentIcon를 클릭했을 때 모달 열기
                $(".contentBoard .detailContent .snsn, .contentBoard .detailBox .iconBox .commentIcon").click(function () {
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
                        success: function (data) {
                            // 모달 내부의 사진 컨테이너를 선택
                            var modalPhotoContainer = $("#popupModal .popupGetResult ul");
                            showUploadResult(data, modalPhotoContainer); // 사진 데이터 표시
                        },
                        error: function (xhr, status, error) {
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
                            success: function (data) {
                                var modalPhotoContainer = $("#popupModal .popupUserImage ul");
                                showUploadResult(data, modalPhotoContainer);
                            },
                            error: function (xhr, status, error) {
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

            function showUploadResult(uploadResultArr, uploadResultContainer) {
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
                $('.option h5').click(function () {
                    const snsNum = $(this).closest('.detailBox').data('sns-num');

                    if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
                        $.ajax({
                            url: '/deletePost', // 서버에서 처리할 URL
                            type: 'POST',
                            data: { sns_num: snsNum },
                            success: function (response) {
                                alert('게시글이 삭제되었습니다.');
                                location.reload(); // 페이지 새로고침
                            },
                            error: function (xhr, status, error) {
                                alert('게시글 삭제에 실패했습니다.');
                            }
                        });
                    }
                });
            });

        </script>

        <script>
            $(document).ready(function () {
                // 프로필 이미지 불러옴
                $('.profileInfo').each(function () {
                    var user_type = $(this).data('user-type');
                    var snsEmail = $(this).data('user-email')

                    var uploadResultContainer = $(this).find('.UserProfileImage ul');

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
                            success: function (data) {
                                showUploadResult(data, uploadResultContainer);
                            },
                            error: function (xhr, status, error) {
                                console.error('Error fetching file list for email ' + email + ':', error);
                            }
                        });
                    }
                });
                // 프로필 이미지 불러옴
                function showUploadResult(uploadResultArr, uploadResultContainer) {
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
            });
        </script>