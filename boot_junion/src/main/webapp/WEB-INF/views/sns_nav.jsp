<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>네비게이션_sns</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sns_nav.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
</head>
<body>
	<div class="sns_nav">
		<div class="navigation">

			<div class="logo">
				<a href="main">
					<img src="images/logo.svg" alt="#">
				</a>
				<!-- <h1>
					<span class="las la-otter"></span>
					Madia-Study-App
				</h1> -->
			</div> <!-- nav-brand 끝-->
		
			<div class="navMenu">
				<ul>
					<li>
						<a href="snsMain">
							<span class="icon">
								<i class="fa-solid fa-house"></i>
							</span>
							<span class="title">홈</span>
						</a>
					</li>
					<li class="iconSearch">
						<a href="#">
							<span class="icon">
								<i class="fa-solid fa-magnifying-glass"></i>
							</span>
							<span class="title">검색</span>
						</a>
					</li>
					<li class="iconChat">
						<a href="#">
							<span class="icon">
								<i class="fa-regular fa-comments"></i>
							</span>
							<span class="title">채팅</span>
						</a>
					</li>
					<li>
						<a href="snsUserPage?user_email=${login_email}">
							<span class="icon">
								<!-- <i class="fa-solid fa-user"></i> -->
								<i class="fa-regular fa-user"></i>
							</span>
							<span class="title">프로필</span>
						</a>
					</li>
					<li class="iconWrite">
						<a href="#">
							<span class="icon">
								<i class="fa-regular fa-square-plus"></i>
							</span>
							<span class="title">글 작성</span>
						</a>
					</li>
				</ul>
			</div>  <!-- nav-menu 끝-->    
		</div> <!-- navigation 끝-->

		<!-- 검색 부분 -->
		<div class="navigationSNS">
			<div class="navigationTwo">

				<div class="logo">
					<a href="main">
						<img src="images/logoSmall.svg" alt="#">
					</a>
					<!-- <h1>
						<span class="las la-otter"></span>
						Madia-Study-App
					</h1> -->
				</div> <!-- nav-brand 끝-->
			
				<div class="navMenu">
					<ul>
						<li>
							<a href="snsMain">
								<span class="icon">
									<i class="fa-solid fa-house"></i>
								</span>
								<!-- <span class="title">홈</span> -->
							</a>
						</li>
						<li class="iconSearch">
							<a href="#">
								<span class="icon">
									<i class="fa-solid fa-magnifying-glass"></i>
								</span>
								<!-- <span class="title">검색</span> -->
							</a>
						</li>
						<li class="iconChat">
							<a href="#">
								<span class="icon">
									<i class="fa-regular fa-comments"></i>
								</span>
								<!-- <span class="title">채팅</span> -->
							</a>
						</li>
						<li>
							<a href="snsUserPage?user_email=${login_email}">
								<span class="icon">
									<!-- <i class="fa-solid fa-user"></i> -->
									<i class="fa-regular fa-user"></i>
								</span>
								<!-- <span class="title">프로필</span> -->
							</a>
						</li>
						<li class="iconWrite">
							<a href="#">
								<span class="icon">
									<i class="fa-regular fa-square-plus"></i>
								</span>
								<!-- <span class="title">글 작성</span> -->
							</a>
						</li>
					</ul>
				</div>  <!-- nav-menu 끝-->   
			</div> <!-- navigationTwo 끝-->
			<div class="navSearch">
				<div class="searchBox">
					<h3>검색</h3>
					<div class="searchInputBox">
						<input type="text" id="searchQuery" onkeyup="searchName()" placeholder="검색">
						<span class="xIcon">
							<i class="fa-solid fa-xmark"></i>
						</span>
					</div>
				</div> <!--searchBox 끝-->
				<div class="searchResultBox" id="searchResultBox">


				</div> <!--searchResultBox 끝-->
			</div> <!--navSearch 끝-->
		</div> <!--navigationSNS 끝-->

		<!-- 채팅 부분 -->
		<div class="navigationChat">
			<div class="navigationTwo">

				<div class="logo">
					<a href="main">
						<img src="images/logoSmall.svg" alt="#">
					</a>
					<!-- <h1>
						<span class="las la-otter"></span>
						Madia-Study-App
					</h1> -->
				</div> <!-- nav-brand 끝-->
			
				<div class="navMenu">
					<ul>
						<li>
							<a href="snsMain">
								<span class="icon">
									<i class="fa-solid fa-house"></i>
								</span>
								<!-- <span class="title">홈</span> -->
							</a>
						</li>
						<li class="iconSearch">
							<a href="#">
								<span class="icon">
									<i class="fa-solid fa-magnifying-glass"></i>
								</span>
								<!-- <span class="title">검색</span> -->
							</a>
						</li>
						<li class="iconChat">
							<a href="#">
								<span class="icon">
									<i class="fa-regular fa-comments"></i>
								</span>
								<!-- <span class="title">채팅</span> -->
							</a>
						</li>
						<li>
							<a href="snsUserPage?user_email=${login_email}">
								<span class="icon">
									<!-- <i class="fa-solid fa-user"></i> -->
									<i class="fa-regular fa-user"></i>
								</span>
								<!-- <span class="title">프로필</span> -->
							</a>
						</li>
						<li class="iconWrite">
							<a href="#">
								<span class="icon">
									<i class="fa-regular fa-square-plus"></i>
								</span>
								<!-- <span class="title">글 작성</span> -->
							</a>
						</li>
					</ul>
				</div>  <!-- nav-menu 끝-->   
			</div> <!-- navigationTwo 끝-->
			<div class="navChat">
				<div class="chatTitleBox">
					<h3>채팅</h3>
				</div> <!--chatTitleBox 끝-->
				<div class="chatContentBox">

					<!-- <div class="chatName">
						<h5>대화상대</h5>
					</div> -->

					<!-- <c:forEach var="room" items="${rooms}"> -->
						<!-- <div class="chatContent">
							<div class="left">
								<div class="UserImage">
									<ul>
										<img src="images/people.svg" alt="#" class="img">
									</ul>
								</div>
							</div> -->
							<!--left 끝-->
							<!-- <div class="nameBox">
								<h4>${room.user_name}</h4>
								<div class="chatMessage">
									<h5>${room.sender_id == login_email ? '나 :' : room.user_name} ${room.message}</h5>
									<h5 class="chatTime">timeAgo(room.timestamp)</h5>
								</div>
							</div> -->
							<!--nameBox 끝-->
						<!-- </div> -->
					<!-- </c:forEach> -->
					<!--chatContent 끝-->

				</div> <!--chatContentBox 끝-->
			</div> <!--navChat 끝-->
		</div> <!--navigationChat 끝-->


		<!-- 글 작성 부분 -->
		<div id="writeModal" class="modal">
			<form class="popupBox" method="post" action="snsPost" id="snsPost">
				<div class="wrtieBox">
					<div class="boxButton">
						<input type="reset" value="취소" id="cancelButton"></input>
						<input type="submit" value="게시" class="postButton"></input>
					</div> <!--boxButton 끝-->
					<div class="boxTitle">
						<div class="loginUserImg">
							<ul>
								<!-- <img src="images/people.svg" alt="#" class="img"> -->
							</ul>
						</div>
						<div class="titleContent">
							<input type="text" placeholder="타이틀을 적어주세요! (선택사항)" name="sns_title">
						</div>
					</div> <!--boxTitle 끝-->
					<input type="hidden" name="user_type" value="${login_usertype}">
					<input type="hidden" name="login_email" value="${login_email}">
					<div class="uploadImage">
						<input type="file" id="fileButton" name="uploadFile">
						<label for="fileButton" class="uploadFile">
							<span class="icon">
								<i class="fa-regular fa-image"></i>
							</span>
							<h5>이미지 추가</h5>
						</label>
						<div class="uploadResultPost">
							<ul>
							</ul>
						</div>
					</div> <!--uploadImage 끝-->
					<div class="boxContent">
						<textarea placeholder="나누고 싶은 생각을 공유해 보세요!(필수)" name="sns_content"></textarea>
					</div>
				</div> <!--wrtieBox 끝-->
			</form> <!--popupBox 끝-->
		</div> <!-- 모달 끝 -->
	</div> <!--sns_nav 끝-->
	<div id="messageNotification" class="notification" style="display: none;">
		새로운 메시지가 도착했습니다!
	</div>
</body>
</html>
<script>
    $(document).ready(function() {

        // 스크롤바 너비 계산
        var scrollbarWidth = window.innerWidth - document.documentElement.clientWidth;

        // '검색' 메뉴 항목을 클릭했을 때의 이벤트 핸들러
        $('.navMenu .iconSearch').on('click', function(event) {
            event.preventDefault();
            
            // .navigationSNS의 display 상태를 토글
            if ($('.navigationSNS').is(':visible')) {
                $('.navigationSNS').hide();
            } else {
                $('.navigationSNS').css('display', 'flex');
                $('.navigationChat').hide(); // .navigationChat 숨김
				$('#searchQuery').val(''); // 검색 입력 필드 비우기
            	$('#searchResultBox').html(''); // 검색 결과 초기화
            }
        });

        // '채팅' 메뉴 항목을 클릭했을 때의 이벤트 핸들러
        $('.navMenu .iconChat').on('click', function(event) {
            event.preventDefault();

            // .navigationChat의 display 상태를 토글
            if ($('.navigationChat').is(':visible')) {
                $('.navigationChat').hide();
            } else {
                $('.navigationChat').css('display', 'flex');
                $('.navigationSNS').hide(); // .navigationSNS 숨김
				$('#searchQuery').val(''); // 검색 입력 필드 비우기
				$('#searchResultBox').html(''); // 검색 결과 초기화
            }
        });

        // '검색'과 '채팅'를 제외한 다른 메뉴 항목을 클릭했을 때 둘 다 숨김
        $('.navMenu li:not(.iconSearch, .iconChat)').on('click', function(event) {
            event.preventDefault();
            $('.navigationSNS').hide();
            $('.navigationChat').hide();

			// 클릭된 링크로 이동
			var link = $(this).find('a').attr('href');
			if (link) {
				window.location.href = link;
			}

			// 검색 입력 필드와 결과 초기화
			$('#searchQuery').val(''); 
        	$('#searchResultBox').html(''); 
        });

       // '글 작성' 메뉴 항목을 클릭했을 때 모달 열기
		$('.navMenu .iconWrite').on('click', function(event) {
			event.preventDefault();
			$('#writeModal').css('display', 'flex');
			$('body').addClass('body-no-scroll');
		});

		// '취소' 버튼 클릭 시 모달 닫기
		$('#cancelButton').on('click', function(event) {
			event.preventDefault();
			$('#writeModal').hide();
			$('body').removeClass('body-no-scroll');
			$('#snsPost')[0].reset(); // 폼 초기화
			$('.uploadResultPost ul').empty(); // 업로드된 파일 목록 초기화
			$('.uploadFile').css({"display":"flex"}); // 파일 업로드 버튼 다시 보이기
		});

		// xIcon 클릭 시 입력 필드 비우기
		$('.searchInputBox .xIcon').on('click', function() {
			$('#searchQuery').val(''); // 입력 필드 비우기
			$('#searchQuery').focus(); // 입력 필드에 포커스
			$('#searchResultBox').html(''); // 검색 결과도 초기화 (옵션)
		});


		var formObj = $("form[id='snsPost']");

		$("#snsPost input[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");

			//유효성 검사
			var requiredFields = [
                {name: "sns_content", message: "내용을 입력해주세요."}
			];

			// 유효성 반복 + 포커스 이동
            for (var i = 0; i < requiredFields.length; i++) {
                var field = requiredFields[i];

				var fieldValue = $("[name='" + field.name + "']").val().trim();
				if (fieldValue === "") {
					alert(field.message);
					$("[name='" + field.name + "']").focus();
					return;
				}
            } //유효성 검사 끝 --

			var str="";

			$(".uploadResultPost ul li").each(function (i, obj){
				console.log("@# obj=>"+$(obj));
				console.log("@# obj=>"+$(obj).data());
				console.log("@# obj=>"+$(obj).data("filename"));
				// return;

				var jobj = $(obj);
				// JavaScript개체의 속성에 대한 목록을 표시
				console.dir(jobj);
				console.log("================================");
				console.log(jobj.data("filename"));
				console.log(jobj.data("uuid"));
				console.log(jobj.data("path"));
				console.log(jobj.data("type"));

				str += "<input type='hidden' name='SNSAttachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='SNSAttachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='SNSAttachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='SNSAttachList["+i+"].image' value='"+jobj.data("type")+"'>";
			});//end of uploadResultPost ul li

			console.log(str);
			// return;
			// formObj.append(str).submit();
			formObj.append(str);
       	 	formObj[0].submit(); // 폼을 정상적으로 제출
		});//end of button submit

		//확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
		//확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
		var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
		var maxSize = 5242880;//5MB

		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}

		$("input[type='file']").change(function (e){
			// 이미 업로드된 파일이 있는지 확인
			if ($(".uploadResultPost ul li").length > 0) {
				alert("하나의 파일만 업로드할 수 있습니다. 삭제하고 다시 업로드 해주세요.");
				$("input[type='file']").val(""); // 파일 입력 초기화
				return false;
			}

			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			//files : 파일정보
			var files = inputFile[0].files;

			if(files.length > 1) {
				alert("하나의 파일만 업로드할 수 있습니다.");
				$("input[type='file']").val(""); // 파일 입력 초기화
				return false;
			}

			for(var i=0; i<files.length; i++){
				console.log("@# files=>"+files[i].name);

				//파일크기와 종류중에서 거짓이면 리턴
				if(!checkExtension(files[i].name, files[i].size)){
					$("input[type='file']").val(""); // 파일 입력 초기화
					return false;
				}

				//파일 정보를 formData에 추가
				formData.append("uploadFile",files[i]);
			}

			$.ajax({
				 type: "post"
				,data: formData
				//컨트롤러단 호출
				,url: "snsUploadAjaxAction"
                //processData : 기본은 key/value 를 Query String 으로 전송하는게 true
                //(파일 업로드는 false)
				,processData: false
                //contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
                //첨부파일은 false : multipart/form-data로 전송됨
				,contentType: false
				,success: function(result){
					alert("사진 업로드 완료");
					console.log(result);
					//파일정보들을 함수로 보냄
					showUploadResult(result);//업로드 결과 처리 함수 
				}
			});//end of ajax

			function showUploadResult(uploadResultArr){

				if(!uploadResultArr || uploadResultArr.length == 0){
					return;
				}

				var uploadUL = $(".uploadResultPost ul");
				uploadUL.empty(); // 기존 업로드된 파일 정보 제거
				var str="";

				$(uploadResultArr).each(function (i, obj){
					//image type
					if (obj.image) {
						console.log("@# obj.uploadPath=>"+obj.uploadPath);
						console.log("@# obj.uuid=>"+obj.uuid);
						console.log("@# obj.fileName=>"+obj.fileName);

						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						// var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>"
						str + "<div>";

						str += "<span style='display:none;'>"+obj.fileName+"</span>";
						str += "</div>";
						str += "<img src='/snsDisplay?fileName="+fileCallPath+"'>";//이미지 출력 처리(컨트롤러단)
						str += "<div class='imgDelete'>";
						str += "<span style='cursor: pointer;' data-file=\'"+ fileCallPath +"\'data-type='image'><i class='fa-regular fa-trash-can'></i></span>";
						// str += "<span style='cursor: pointer;' data-file=\'"+ fileCallPath +"\'data-type='image'>이미지 삭제</span>";
						str += "</div></li>";
					} else {
						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
						str + " ><div>";

						str += "<span>"+obj.fileName+"</span>";
						// str += "<img src='./resources/img/attach.png'>";
						str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> [삭제] </span>";
						str += "</div></li>";
					}
				});//end of each

				//div class 에 파일 목록 추가
				uploadUL.append(str);
				$('.uploadFile').css({"display":"none"});
			}

			// $(".uploadResult").on("click","span",function(){
			$(".uploadResultPost").on("click","span[data-file]",function(){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var uploadResultItem = $(this).closest("li");

				console.log("@# targetFile=>"+targetFile);
				console.log("@# type=>"+type);
				console.log("@# uploadResultItem=>"+uploadResultItem);

				//컨트롤러 단에서 업로드된 실제파일 삭제
				$.ajax({
					 type: "post"
					,data: {fileName: targetFile, type: type}
					,url: "snsDeleteFile"
					,success: function(result){
						alert("삭제 완료");
						//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
						uploadResultItem.remove();

						if($(".uploadResultPost ul li").length === 0){
							$('.uploadFile').css({"display":"flex"}); // 모든 파일이 삭제되면 보이기
						}
					}
				});//end of ajax
			});//end of click
		});//end of change 


		// JSP에서 login_email과 login_usertype 값을 가져옴
		var login_email = "<c:out value='${login_email}'/>";
		var login_usertype = "<c:out value='${login_usertype}'/>"; // 사용자 유형을 JSP에서 가져옴

		console.log("login_email:", login_email);

		// 업로드 결과를 표시할 컨테이너 찾기
		var uploadResultContainer = $(this).find('.loginUserImg ul');

		// 사용자 유형에 따라 다른 URL과 이메일 파라미터 설정
		if (login_email) {
			var url = '';
			var emailParam = '';

			if (login_usertype == 1) {
				url = '/getUserImageList';
				emailParam = { user_email: login_email }; // user_email로 데이터 전송
			} else if (login_usertype == 2) {
				url = '/mainComFileList';
				emailParam = { com_email: login_email }; // com_email로 데이터 전송
			}

			if (url) {
				$.ajax({
					url: url,
					type: 'GET',
					data: emailParam,
					dataType: 'json',
					success: function(data) {
						searhUploadResult(data, uploadResultContainer);
					},
					error: function(xhr, status, error) {
						console.error('Error fetching file list for login_email ' + login_email + ':', error);
					}
				});
			}
		}
    });//end of ready
</script>
<script>

	function searchName() {
		var query = $('#searchQuery').val();
		

		if (query.length > 0) {
			$.ajax({
				url: '/api/searchName',
				type: 'GET',
				data: { query: query },
				success: function(data) {
					var resultHtml = '';
					
					$.each(data, function(index, result) {
						console.log("@#result",result);
						console.log(result.name); // 값이 제대로 있는지 확인
						resultHtml += `
							<div class="searchResult prof" data-user-email="\${result.sns_email}" data-sns-email="\${result.sns_email}" data-user-type="\${result.user_type}">
								<div class="left">
									<div class="UserImage">
										<ul>
											<img src="images/people.svg" alt="#" class="img">
										</ul>
									</div>
								</div><!--left 끝-->
								<div class="nameBox">
									<a href="#" class="userProfileLink" style="color: var(--color-black);">
										<h4>\${result.sns_name}</h4>
									</a>
									<h5>\${result.sns_email}</h5>
								</div><!--nameBox 끝-->
								<div class="right">
									<button type="button" class="followbtn">
										팔로우
									</button>
								</div><!--right 끝-->
							</div><!--searchResult 끝-->
						`;
						// 이메일별로 사진을 가져옴
						loadImage(result);
					});
					$('#searchResultBox').html(resultHtml);

					// 링크 추가를 각 결과 항목에 대해 처리
					$('.searchResult').each(function() {
						var snsEmail = $(this).data('sns-email');
						var userType = $(this).data('user-type');
						var userProfileLink = $(this).find('.userProfileLink');
						var loginEmail = "<c:out value='${login_email}'/>";


						if (userType == 1) {
							userProfileLink.attr('href', 'snsUserPage?user_email=' + snsEmail);
						} else if (userType == 2) {
							userProfileLink.attr('href', 'snsCompanyPage?com_email=' + snsEmail);
						}

						followFunction();

					});
				},
				error: function() {
					$('#searchResultBox').html('<p>No results found.</p>');
				}
			});
		} else {
			$('#searchResultBox').html('');
		}
	}

	function loadImage(result) {

		if (result.user_type) {
			var url;
			var emailParam = '';

			if (result.user_type == 1) {
				url = '/getUserImageList';
				emailParam = { user_email: result.sns_email };
			} else if (result.user_type == 2) {
				url = '/mainComFileList';
				emailParam = { com_email: result.sns_email };
			}

			$.ajax({
				url: url,
				type: 'GET',
				data: emailParam,
				dataType: 'json',
				success: function(imageData) {
					var uploadResultContainer = $(".searchResult[data-sns-email='" + result.sns_email + "'] .UserImage ul");
					searhUploadResult(imageData, uploadResultContainer);
				},
				error: function(xhr, status, error) {
					console.error('Error fetching file list for email ' + result.sns_email + ':', error);
				}
			});
		}
	}

	function searhUploadResult(uploadResultArr, uploadResultContainer){
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


// ----------------------------------------------------- 나성엽 -------------------------------------------------

	$(document).ready(function() {
		var loginEmail = "${login_email}"; // JSP에서 로그인 이메일을 가져옴
		var isFirstChat = true; // 접속 후 첫 채팅인지 확인하기 위한 플래그
		var roomNum = "${roomNum}";	// 현재 사용자가 머무는 채팅방 정보
				

		console.log("@# loginEmail=>"+loginEmail);
		
		loadChatList();

		// var socket = new SockJS('/ws');
		// var stompClient = Stomp.over(socket);
		var socket;
		var stompClient;
		// var message;

		// 웹소켓에 연결해서 채팅 메시지 바로바로 업데이트 되어 출력
		function connectWebSocket() {
			var socket = new SockJS('/ws');
			var stompClient = Stomp.over(socket);

			stompClient.connect({}, function(frame) {
				console.log('Connected: ' + frame);

				// 채팅 메시지를 수신했을 때의 처리
				stompClient.subscribe('/sub/public', function(messageOutput) {
					var message = JSON.parse(messageOutput.body);
					var chatContentBox = $(".chatContentBox");
					var chatContent = chatContentBox.find(`.chatContent[data-user-email="\${message.receiver_id}"]`);

					console.log("@# SNS_nav message.message=>"+message.message);
					console.log("@# SNS_nav message.receiver_id=>"+message.receiver_id);
					console.log("@# SNS_nav message.chatContent=>"+chatContent);

					var maxLength = 36; // 글자 수 제한
					var messageText = message.message;
					if (messageText.length > maxLength) {
						messageText = messageText.substring(0, maxLength) + "...";
					}
					// loadChatList();

					// updateChatMessage(message);

					// 해당 유저의 채팅 메시지와 시간을 업데이트
					// chatContent.empty();
					// if (chatContent.length > 0) {
					// 	chatContent.find('.chatMessage h5').first().html(`\${message.sender_id == loginEmail ? '나 :' : message.receiver_id} \${message.message}`);
					// 	chatContent.find('.chatTime').attr('data-timestamp', message.timestamp).html(timeAgo(new Date(message.timestamp)));
					// } else {
					// 	loadChatList()
					// }

					console.log("@# markMessagesAsRead roomNum=>"+roomNum);
					console.log("@# markMessagesAsRead loginEmail=>"+loginEmail);
					markMessagesAsRead(roomNum, loginEmail);

					if (message.sender_id == loginEmail || message.receiver_id == loginEmail) {
						// 첫 채팅 메시지라면 loadChatList 실행
						if (isFirstChat) {
							loadChatList();
							isFirstChat = false; // 첫 채팅 이후에는 다시 실행되지 않도록 플래그 업데이트
						} else {
							// 해당 유저의 채팅 메시지와 시간을 업데이트
							if (chatContent.length > 0) {
								chatContent.find('.chatMessage h5').first().html(`\${message.sender_id == loginEmail ? '나' : ''} : \${messageText}`);
								chatContent.find('.chatTime').attr('data-timestamp', message.timestamp).html(timeAgo(new Date(message.timestamp)));
								chatContent.find('.unread-count').html(``);
							} else {
								loadChatList();
								// chatContent.find('.unread-count').html(``);
							}
						}
					}

					console.log("@#  roomNum=>"+roomNum);
					console.log("@#  message.chatRoom_id=>"+message.chatRoom_id);
					
					// if (roomNum == message.chatRoom_id) {
					// 	chatContent.find('.unread-count').html(``);
					// }

					// 상대방이 보낸 메시지일 때만 알림 표시
					if (message.sender_id != loginEmail && roomNum != message.chatRoom_id && message.receiver_id == loginEmail) {
						showMessageNotification();
					};

					// markMessagesAsRead();

				}, function(error) {
					console.error('WebSocket 연결 실패: ', error);
					attemptReconnect(); // 연결 실패 시 재연결 시도
				});
			});
		}

		// 웹소켓 재연결 함수
		function attemptReconnect() {
			setTimeout(function() {
				console.log('Reconnecting...');
				connectWebSocket(); // 재연결 시도
			}, 1000); // 5초 후 재연결 시도
		}

		attemptReconnect();

		// 업데이트한 시간으로 바꿈
		function updateChatTimes() {
			$('.chatTime').each(function() {
				var timestamp = $(this).attr('data-timestamp');
				if (timestamp) {
					$(this).html(timeAgo(new Date(timestamp)));
				}
			});
		}

		// 1초마다 시간을 업데이트
		setInterval(updateChatTimes, 1000);


		// 새로운 메시지 알림
		function showMessageNotification() {
			var notification = $('#messageNotification');
			notification.fadeIn(300); // 알림 표시
			setTimeout(function() {
				notification.fadeOut(300); // 3초 후 알림 숨기기
			}, 3000); // 3초 동안 알림 표시
		}

		// '채팅' 메뉴 항목을 클릭했을 때의 이벤트 핸들러
		$('.notification').on('click', function(event) {
            event.preventDefault();

			$('.navigationChat').css('display', 'flex');
			$('.navigationSNS').hide(); // .navigationSNS 숨김
			$('#searchQuery').val(''); // 검색 입력 필드 비우기
			$('#searchResultBox').html(''); // 검색 결과 초기화
        });


		// 메시지를 읽음으로 표시하는 함수
		function markMessagesAsRead(roomNum, loginEmail) {
			$.ajax({
				url: "/api/markMessagesAsRead",
				type: "POST",
				data: {
					roomNum: roomNum,
					userEmail: loginEmail
				},
				success: function() {
					console.log("Messages marked as read.");
				},
				error: function(xhr, status, error) {
					console.error("Failed to mark messages as read:", error);
				}
			});
		}


		function loadChatList() { 
			$.ajax({
				url: "/api/rooms",
				type: "GET",
				data: { senderId: loginEmail },
				success: function(rooms) {
					var maxLength = 30; // 글자 수 제한
					var chatContentBox = $(".chatContentBox");

					chatContentBox.empty(); // 기존 채팅 목록을 비움

					var chatName = `
						<div class="chatName">
							<h5>대화상대</h5>
						</div>
					`;
					chatContentBox.append(chatName);

					// chatScroll을 열고 반복문을 그 안에 넣습니다.
					var chatScroll = `<div class="chatScroll">`;

					rooms.forEach(function(room) {
						var message = room.message;
						if (message.length > maxLength) {
							message = message.substring(0, maxLength) + "...";
						}

						var unreadCount = room.unread_count; // 읽지 않은 메시지 수

						var chatContent = `
							<a href="SNSChat?receiver_id=\${room.user_email}">
								<div class="chatContent"
									data-user-email="\${room.user_email}">
									<div class="left">
										<div class="UserImage">
											<ul>
												<img src="images/people.svg" alt="#" class="img">
											</ul>
										</div>
									</div>
									<div class="nameBox">
										<h4>\${room.user_name}</h4>
										<div class="chatMessage">
											<h5>\${room.sender_id == loginEmail ? '나' : room.user_name} : \${message}</h5>
											<h5 class="chatTime" data-timestamp="\${room.timestamp}">\${timeAgo(new Date(room.timestamp))}</h5>
										</div>
									</div>
									<h5 class="unread-count">\${unreadCount > 0 && roomNum != room.chatRoom_id ? unreadCount : ''}</h5>
								</div>
							</a>
						`;
						// chatContentBox.append(chatContent);
						chatScroll += chatContent;
					});
					chatScroll += `</div>`; // chatScroll을 닫습니다.
            		chatContentBox.append(chatScroll); // chatScroll 전체를 chatContentBox에 추가합니다.
					
					// 프로필 이미지 불러옴
					$('.chatContent').each(function () {
						var snsEmail = $(this).data('user-email')
						
						var uploadResultContainer = $(this).find('.UserImage ul');

						$.ajax({
							url: '/getUserImageList',
							type: 'GET',
							data: {user_email: snsEmail}, // 이메일만 데이터로 전송
							dataType: 'json',
							success: function(data) {
								showUploadResult(data, uploadResultContainer);
							},
							error: function(xhr, status, error) {
								console.error('Error fetching file list for email ' + email + ':', error);
							}
						});
					});
					// 프로필 이미지 끝
					// 채팅목록 불러오기 끝
				},
				error: function(error) {
					console.log("Error fetching chat rooms: ", error);
				}
			});
		}
    });

	/*
	function updateChatMessage(message) {
        // var chatContentBox = $(".chatContentBox");
        // var chatContent = chatContentBox.find(`.chatContent[data-user-email="${message.user_email}"]`);
		var chatContentBox = $(".chatContentBox");
		var chatContent = chatContentBox.find(`.chatContent[data-user-email="\${message.receiver_id}"]`);

        if (chatContent.length > 0) {
            // 해당 유저의 채팅 메시지와 시간을 업데이트
            // chatContent.find('.chatMessage h5').first().html(`${message.sender_id == loginEmail ? '나 :' : message.user_name} ${message.content}`);
            // chatContent.find('.chatTime').html(timeAgo(new Date(message.timestamp)));
			chatContent.find('.chatMessage h5').first().html(`\${message.sender_id == loginEmail ? '나 :' : message.receiver_id} \${message.message}`);
			chatContent.find('.chatTime').attr('data-timestamp', message.timestamp).html(timeAgo(new Date(message.timestamp)));
        } else {
            // 해당 유저의 채팅이 없다면 새롭게 추가 (필요 시)
            var newChatContent = `
                <a href="SNSChat?receiver_id=\${message.receiver_id}">
                    <div class="chatContent" data-user-email="\${message.receiver_id}">
                        <div class="left">
                            <div class="UserImage">
                                <ul>
                                    <img src="images/people.svg" alt="#" class="img">
                                </ul>
                            </div>
                        </div>
                        <div class="nameBox">
                            <h4>\${message.user_name}</h4>
                            <div class="chatMessage">
                                <h5>\${message.sender_id == loginEmail ? '나 :' : message.user_name} \${message.message}</h5>
                                <h5 class="chatTime">\${timeAgo(new Date(message.timestamp))}</h5>
                            </div>
                        </div>
                    </div>
                </a>
            `;
            chatContentBox.append(newChatContent);
        }
	}
	*/

	// 프로필 이미지 불러옴
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


// ----------------------------------------------------- 나성엽 끝 -------------------------------------------------
</script>
