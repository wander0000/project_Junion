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
</head>
<body>
	<div class="sns_nav">
		<div class="navigation">

			<div class="logo">
				<a href="snsMain">
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
						<a href="#">
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

		<div class="navigationSNS">
			<div class="navigationTwo">

				<div class="logo">
					<a href="snsMain">
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
							<a href="#">
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
						<input type="text" placeholder="검색">
						<span class="xIcon">
							<i class="fa-solid fa-xmark"></i>
						</span>
					</div>
				</div> <!--searchBox 끝-->
				<div class="searchResultBox">

					<div class="searchResult">
						<div class="left">
							<div class="UserImage">
								<ul>
									<img src="images/people.svg" alt="#" class="img">
								</ul>
							</div>
						</div><!--left 끝-->
						<div class="nameBox">
							<h4>김정우</h4>
							<h5>신입</h5>
						</div><!--nameBox 끝-->
						<div class="right">
							<button type="button">
								팔로우
							</button>
						</div><!--right 끝-->
					</div><!--searchResult 끝-->

				</div> <!--searchResultBox 끝-->
			</div> <!--navSearch 끝-->
		</div> <!--navigationSNS 끝-->

		<!-- 채팅 부분 -->
		<div class="navigationChat">
			<div class="navigationTwo">

				<div class="logo">
					<a href="snsMain">
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
							<a href="#">
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

					<div class="chatName">
						<h5>대화상대</h5>
					</div>
					<div class="chatContent">
						<div class="left">
							<div class="UserImage">
								<ul>
									<img src="images/people.svg" alt="#" class="img">
								</ul>
							</div>
						</div><!--left 끝-->
						<div class="nameBox">
							<h4>김정우</h4>
							<div class="chatMessage">
								<h5>나 : 확인용 메시지!!</h5>
								<h5 class="chatTime">5시간</h5>
							</div>
						</div><!--nameBox 끝-->
					</div><!--chatContent 끝-->

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
						<div class="UserImage">
							<ul>
								<img src="images/people.svg" alt="#" class="img">
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
            }
        });

        // '검색'과 '채팅'를 제외한 다른 메뉴 항목을 클릭했을 때 둘 다 숨김
        $('.navMenu li:not(.iconSearch, .iconChat)').on('click', function(event) {
            event.preventDefault();
            $('.navigationSNS').hide();
            $('.navigationChat').hide();
        });

        // '글 작성' 메뉴 항목을 클릭했을 때 모달 열기
        $('.navMenu .iconWrite').on('click', function(event) {
            event.preventDefault();
            $('#writeModal').css('display', 'flex');
            $('body').css({
                'overflow': 'hidden',
                'margin-right': scrollbarWidth + 'px' // 스크롤바 너비만큼 오른쪽 마진 추가
            });
        });

        // '취소' 버튼 클릭 시 모달 닫기
        $('#cancelButton').on('click', function(event) {
            event.preventDefault();
            $('#writeModal').hide();
            $('body').css({
                'overflow': 'auto',
                'margin-right': '0' // 오른쪽 마진 원래대로
            });
        });

        // 폼 제출 시 처리 (예: 데이터 유효성 검사 및 AJAX로 서버에 전송)
        // $('.popupBox').on('submit', function(event) {
        //     event.preventDefault();
        //     // 여기서 폼 데이터를 서버로 전송하는 로직을 추가할 수 있습니다.
        //     alert('작성 완료!');
        //     $('#writeModal').hide();
        //     $('body').css({
        //         'overflow': 'auto',
        //         'margin-right': '0' // 오른쪽 마진 원래대로
        //     });
        // });


		var formObj = $("form[id='snsPost']");

		$("input[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");

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
    });//end of ready
</script>
