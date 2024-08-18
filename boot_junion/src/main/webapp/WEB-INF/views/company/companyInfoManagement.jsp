<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 마이페이지 - 기업정보관리</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companyInfoMamagement.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <!-- <script src="js/index.js"></script> -->
    <!--kakao map -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48ca63ceb0746787c922c8da8f33b705&libraries=services"></script>

</head>
<body>
<div class="container">
	<%@ include file="../nav_company.jsp" %>
	
<!--	${companyInfo}-->
    <div class="mainContent">
        <header>
            <%@ include file="../dropdown.jsp" %>
        </header>    
        <section>
            <div class="tabCon">
                
                <div class="toptitle">
                    <h3 class="toptitle1">기업 기본 정보</h3>
                    <h3 class="toptitle2">기업 상세 정보</h3>
                </div>



                <div class="detail"><!-- 상세정보 탭 시작 -->
    
                        <div class="company">
                            
                            <div class="uploadResult">
                                
                                <!-- <img class="imgg" src="companyInfo.svg" alt="#"> -->
                            </div>
                            <!-- </div> -->
                            <div class="comInfo">
                                <!-- <div class="sub1"> -->
                                    <!-- <h5 class="name">${companyInfo.com_name}</h5> -->
                                    <h5 class="title">주니온</h5>
                                    <h5 class="contentValue" id="localyear">${companyInfo.com_location}ㆍ업력 <span class="getyear"></span></h5>
                                    <!-- <h5 class="contentValue" id="localyear">서울 성동구ㆍ업력 <span class="getyear"></span></h5> -->
                                    <!-- <h5 class="locationC" id="localyear">${companyInfo.com_location}<span class="getyear"></span></h5> -->
                                <!-- </div> -->
                            </div>
                        </div>
    
    
                        <!-- 컬럼 시작 -->
    
    
                        <div class="comInfo"> 
                            <!-- <div class="col1"> -->
                            <div class="underLine">
                                <h5 class="title">회사 소개</h5>
                                <!-- 회사 소개 -->
                            </div>
                            <!-- <div class="detail"> -->
                                <!-- ${companyInfo.com_content} -->
                            <div class="introduce">${companyInfo.com_content}
                                <!-- 주니온은 여러분의 취업을 응원합니다.<br>

                                신생 회사 주니온입니다. 저희는 신입 개발자분들의 취업을 위해 만들어진 플랫폼으로, CS 지식과 SNS 등의 기능을 통해 현장의 목소리를 들을 수 있게 하고자 했고,
                                사용자 UI를 중요시 하기 때문에.. -->

                            </div>
                        </div>
                            <!-- </div> -->

                            <!-- <div class="col2"> -->
                            <div class="comInfo">
                                <!-- <div class="columnA"> -->
                                <div class="underLine">
                                    <h5 class="title">기술 스택</h5>
                                </div>
                                <!-- <div class="boerder"></div> -->
                                <div class="contentValue">
                                    <div class="detail" id="stack">
                                        <!-- ${companyInfo.com_stack} -->
                                    </div>
                                </div>
                            </div><!--col2-->
        
                            <!-- <div class="col7"> -->
                            <div class="comInfo">
                                <!-- <div class="columnA"> -->
                                <div class="underLine">
                                    <h5 class="title">회사 위치</h5>
                                </div>
                                <!-- <div class="columnBB"> -->
                                <div class="contentValue">
                                    <!--지도가 들어갈 위치-->
                                    <!-- <div id="map" style="width:100%;height:350px;"></div> -->
                                    <div id="map"></div>
                                    <h5 class="type" id="comAddress">${companyInfo.com_location}</h5>
                                    <!-- <h5 class="comloc" id="comAddress">부산 중앙대로 213</h5> -->
                                </div>
                            </div>
        
                            <!-- <div class="col8"> -->
                            <div class="comInfo">
                                <!-- <div class="columnA"> -->
                                <div class="underLine">
                                    <h5 class="title">기업정보</h5>
                                </div>
                                <div class="contentValue">
                                    <div class="tableColumn"> 
                                        <div class="type">
                                        <!-- <div class="comname1"> -->
                                            <!-- <h5 class="name"> -->
                                                연혁
                                            <!-- </h5> -->
                                        </div>
                                        <div class="type">
                                        <!-- <div class="comname2"> -->
                                            <!-- <h5 class="name" id="yearlenght"> -->
                                                <span class="getyear"></span>(<span>${year}</span>년 설립)
                                            <!-- </h5> -->
                                        </div>
                                    </div>

                                    <div class="tableColumn"> 
                                        <div class="type">
                                        <!-- <div class="comname1"> -->
                                            <!-- <h5 class="name"> -->
                                                매출액 (<span class="nowYear"></span>년)
                                            <!-- </h5> -->
                                        </div>
                                        <div class="type">
                                        <!-- <div class="comname2"> -->
                                            <!-- <h5 class="name" id="salay"> -->
                                                ${companyInfo.com_sale}만원
                                            <!-- </h5> -->
                                        </div>
                                    </div>

                                    <div class="tableColumn"> 
                                        <!-- <div class="comname1"> -->
                                        <div class="type">
                                            <!-- <h5 class="name"> -->
                                                기업유형
                                            <!-- </h5> -->
                                        </div>
                                        <!-- <div class="comname2"> -->
                                        <div class="type">
                                            <!-- <h5 class="name"> -->
                                                ${companyInfo.com_type} 
                                                <!-- 유한회사 -->
                                            <!-- </h5> -->
                                        </div>
                                    </div>
                                    
                                    <div class="tableColumn"> 
                                        <div class="type">
                                        <!-- <div class="comname1"> -->
                                            <!-- <h5 class="name"> -->
                                                평균연봉
                                            <!-- </h5> -->
                                        </div>
                                        <div class="type">
                                        <!-- <div class="comname2"> -->
                                            <!-- <h5 class="name" id="money"> -->
                                                ${companyInfo.com_salary}만원
                                            <!-- </h5> -->
                                        </div>
                                    </div>

                                    <div class="tableColumn"> 
                                        <div class="type">
                                        <!-- <div class="comname1"> -->
                                            <!-- <h5 class="name"> -->
                                                대표자명
                                            <!-- </h5> -->
                                        </div>
                                        <div class="type">
                                        <!-- <div class="comname2"> -->
                                            <!-- <h5 class="name"> -->
                                                <!-- ${companyInfo.com_CEO}  -->
                                                mapSeeker 
                                            <!-- </h5> -->
                                        </div>
                                    </div>

                                    <div class="tableColumn"> 
                                        <div class="type">
                                        <!-- <div class="comname1"> -->
                                            <!-- <h5 class="name"> -->
                                                홈페이지
                                            <!-- </h5> -->
                                        </div>
                                        <div class="type">
                                        <!-- <div class="comname2"> -->
                                            <!-- <h5 class="name"> -->
                                                ${companyInfo.com_site} 
                                            <!-- </h5> -->
                                        </div>
                                    </div>

                                    <div class="tableColumn"> 
                                        <div class="type">
                                        <!-- <div class="comname1"> -->
                                            <!-- <h5 class="name"> -->
                                                가입 사원수 (인원)
                                            <!-- </h5> -->
                                        </div>
                                        <div class="type">
                                        <!-- <div class="comname2"> -->
                                            <!-- <h5 class="name" id="people"> -->
                                                ${companyInfo.com_employee}명 
                                            <!-- </h5> -->
                                        </div>
                                    </div>
                                </div><!--contentValue 끝-->
                            </div><!--comInfo 끝-->
                            
                            <div class="modify">
                                <input type="button" value="기업정보수정" class="commodify" onclick="location.href='companyInfoDetailUpdate'">
                            </div>
                </div><!-- detail 끝 -->
                            
                <!-- </div>tabCon common -->

            </div><!-- tabCon     ///containe끝 -->
        </section>
    
    </div><!-- main-content -->
</div> <!--container-->   
<%@ include file="../footer.jsp" %>
    
</body>
</html>
<script>

    $(document).ready(function () {

        // // tab
        // $(".toptitle1").on("click",function(e){
        //     $(".detail").css({"display":"none"});
        //     $(".common").css({"display":"block"});
        // });
        // $(".toptitle2").on("click",function(e){
        //     $(".common").css({"display":"none"});
        //     $(".detail").css({"display":"block"});
        //     // $(".disN.wrap").css({"display":"block"});
        // });// tab 기능
        // tab
        $(".toptitle1").on("click",function(e){
        // $(".detail").css({"display":"none"});
        // $(".common").css({"display":"block"});
        location.href="companyMini"
        });
        $(".toptitle2").on("click",function(e){
            // $(".common").css({"display":"none"});
            // $(".detail").css({"display":"block"});
            location.href="companyInfoManagement"
            // $(".disN.wrap").css({"display":"block"});
        });// tab 기능
         /*
        2024-8-06 서연주(comRegistModify 참고)
        이미지 파일 로딩//즉시실행함수
        */
        // user-email 변수 가져오기
        // var user_email = $(".userImage").data('user-email'); // 파일노출되는 div의 클래스명과 data이용
        var com_email = "<c:out value='${companyInfo.com_email}'/>"; //c:out으로
        console.log("com_email:", com_email);

        if (com_email) {
            $.ajax({
                url: '/comInfoGetFileList',
                type: 'GET',
                data: { com_email: com_email },
                dataType: 'json',
                success: function (data) {
                    console.log("Ajax success:", data);
                    showUploadResult(data);
                    
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching file list for com_email ' + com_email + ':', error);
                }
            });
        }


        // 업로드된 파일 목록 표시
        // 24.08.18 하진 : dom 구조 재쌓은 후 경로 수정
        function showUploadResult(uploadResultArr) {
           
            var uploadUL = $(".uploadResult");
            var str = "";
            if (!uploadResultArr || uploadResultArr.length === 0) {
                alert("업로드파일없음")
                // var company = $(".company");
                // var company = $(".detail");
                var altImg = "<img class='imgg' src='../images/companyInfo.svg' alt='#'>";
                // company.append(altImg);
                uploadUL.append(altImg);
                return;
            }
            var rootURL = "<%=request.getScheme()%>";

            // $(uploadResultArr).each(function (i, obj) {//파일 여러개일때 전부 다 보여줘는
            if (uploadResultArr.length > 0) { // 배열에 요소가 있는지 확인
                var obj = uploadResultArr[0]; // 첫 번째 요소 가져오기 파일 하나만 보여주기
                var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                str += "<div data-path='" + obj.uploadPath + "'";
                str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
                str += "<div style='background:url("+rootURL+"/userImageDisplay?fileName=" + fileCallPath +")'>";
                str += "<div class='photo'>";
                str += "<span style='display:none;'>" + obj.fileName + "</span>";
                // str += "<img class='fileImage' src='/comDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";//이미지 출력처리(컨트롤러단)
                str += "<img class='fileImage' src='/comDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";//이미지 출력처리(컨트롤러단)
                str += "</div>";
            }

            uploadUL.append(str);
           

        }//showUploadResult function 끝


// // 24.08.09 하진 : 파일 업로드 로직 추가
//         var uploadResultContainer = $('.uploadResult ul');
//         console.log("uploadResultContainer~!!! "+uploadResultContainer);
//         var comEmail = "${companyInfo.com_email}";

//     if (comEmail) {
//         $.ajax({
//             url: '/mainComFileList',
//             type: 'GET',
//             data: { com_email: comEmail },
//             dataType: 'json',
//             success: function(data) {
//                 showUploadResult(data, uploadResultContainer);
//             },
//             error: function(xhr, status, error) {
//                 console.error('Error fetching file list for com_email ' + comEmail + ':', error);
//             }
//         });
//     } 
    
//     function showUploadResult(uploadResultArr, uploadResultContainer){
//     if (!uploadResultArr || uploadResultArr.length == 0) {
//         var notImage = "<img class='imgg' src='../images/companyInfo.svg>'";
//         uploadResultContainer.empty().append(notImage);
//     }

//     var str = "";

//     $(uploadResultArr).each(function (i, obj) {
//         var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
       
//         str += "<div class='photo' data-path='" + obj.uploadPath + "'";
//         str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
//         str += "<div>";
//         str += "<span style='display:none;'>" + obj.fileName + "</span>";
//         str += "<img src='/mainDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
//         str += "</div></div>";
//     });

//     uploadResultContainer.empty().append(str);
// }   




        // 기업의 스택값을 받아 버튼으로 출력
        var comStack = "${companyInfo.com_stack}";

        if(comStack){
            // comStack.forEach(function(stack) {
        console.log(comStack);
                const stacks = comStack.split(",");//배열로 만듦
                let str = "";
                for( let i=0; i < stacks.length; i++) 
                // for( let i=0; i < comStack.length; i++) 
                {
                    // alert("test");
                    str += "<input type='button' class='tech' value='"+stacks[i].trim()+"'>";       
                    // str += "<button class='tech' value='"+stacks[i].trim()+"'>";       
                }
                console.log("str@@##"+str);
                $("#stack").html(str);
        
        }
    
    //현재 년도를 구함.
    var years = new Date();
    var nowYear = years.getFullYear();
    console.log(nowYear);
    $('.nowYear').text(nowYear);


 


    // 24.08.03 ~ 08.04 : 하진 - 지도 API 적용
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표(상세정보 수정시와 다른 좌표를 써야 함)
            level: 4 // 지도의 확대 레벨(높을수록 확대가 많이 됨)
            };  

    //지도를 미리 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new kakao.maps.services.Geocoder();
   
    var getlocation = "${companyInfo.com_location}";//화면에 출력된 값을 변수로 받아 사용
    
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(getlocation, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
    });    

    });//end of ready




    //  // 24.07.09 하진 : 비밀번호 변경 팝업 -> 외부 팝업으로 구현
    //  // 24.08.11 하진 : 비밀번호 변경 팝업 크기 수정
    //  function pwchange() {// 비밀번호 설정 외부 팝업 띄우는 코드
    //         // window.name = "부모창 이름"; 
        
    //         var popupURL = "/companyPW";
    //         // var popupProperties = "width=500, height=300, resizable = no, scrollbars = no";
    //         var popupProperties = "width=550, height=400, resizable = no, scrollbars = no";
    //         window.open(popupURL, "companyPW.jsp", popupProperties);    
    //     }

        // 24.07.27 하진 : 연혁 계산 및 값이 없을 경우, 문자가 보이지 않도록 하는 로직
        var locationC = $("#localyear").val();
        var getyear = "${companyInfo.experience_years}";
        console.log(getyear);
        console.log(locationC);

        // if (!locationC && getyear == 0) {
        if (locationC == null) {
            $("#localyear").css({"display": "none"});
        }else{
            let elements = document.querySelectorAll('.getyear');
            if (getyear == 0) {
                // let elements = document.querySelectorAll('.getyear');
                elements.forEach(element => {
                    element.textContent = '1년 미만';
                    // element.textContent = 'ㆍ업력 1년 미만';
                });
                // $(".getyear").val("1년 미만");
            }else{
                // let elements = document.querySelectorAll('.getyear');
                elements.forEach(element => {
                    element.textContent = getyear+"년";
                    // element.textContent = "ㆍ업력 "+getyear+"년";
                });
            }
    }
    
    var yearlenghtElem = $("#yearlenght");
    var salayElem = $("#salay");
    var moneyElem = $("#money");
    var peopleElem = $("#people");

    // 각 요소의 값을 가져옴
    var yearlenght = yearlenghtElem.val();
    console.log(yearlenght);
    var salay = salayElem.val();
    console.log(salay);
    var money = moneyElem.val();
    console.log(money);
    var people = peopleElem.val();
    console.log(people)

    // 모든 값이 비어 있는 경우 요소 숨김
    // if (!yearlenght && !salay && !money && !people) {
    if (yearlenght == null && salay  == null && money  == null && people == null) {
        yearlenghtElem.css("display", "none");
        salayElem.css("display", "none");
        moneyElem.css("display", "none");
        peopleElem.css("display", "none");
    }

</script>
