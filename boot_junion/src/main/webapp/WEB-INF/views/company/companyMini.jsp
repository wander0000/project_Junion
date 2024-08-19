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
	<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/companyInfoMamagement.css"> -->
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
    <style>
    :root 
    {
    /* 컬러 모음 */
    --main-color:#FFA500;
    --color-black: #111;
    --color-white: #fff;
    --color-gray: #787878;
    --input-gray: #e5e5ec;
    --button-gray: #f7f7f7;
    --border-color-gray: #dadada;
    --font-size32: 32px;
    --font-size24: 24px;
    --font-size20: 20px;
    --font-size16: 16px;
    --font-size14: 14px;
    --font-size12: 12px;
    }

    
    /* section : 기본 틀 */
    section 
    {
    display: flex;
    justify-content: center;
    padding-top: 50px;  

    }

    .tabCon
    {
    width: 1200px;
    }

    /* 헤더밑 타이틀*/
    section .toptitle
    {
    /* font-size: var(--font-size32); */
    /* text-align: left; */
    width: 100%;
    margin-bottom: 40px;
    gap: 40px;
    /* margin : 0 40px 20px 0;  */
    display: flex;
    /* margin-right: 40px; */
    } 

    .toptitle1, .toptitle2
    {
    /* margin-right: 40px; */
    font-size: var(--font-size32);
    font-weight: 600;
    cursor: pointer;
    text-align: left;
    }
    /* 
    .toptitle2
    {
    margin-right: 20px;
    font-size: var(--font-size32);
    cursor: pointer;
    } */



    /* 기본 정보 */
    /* .simpleData
    {
        border: 1px solid var(--color-gray);
    } */

    .table
    {
        border: 1px solid var(--input-gray);
        border-bottom: none;
        /* padding: 20px; */
        display: flex;
        /* height: 50px; */
        align-items: center;
        width: 100%;
        /* max-width: 730px; */
        /* gap: 40px; */
    }

    .table:first-child
    {
        border-top: 1px solid var(--input-gray);
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    .table:last-child
    {
        border-bottom: 1px solid var(--input-gray);
        border-bottom-left-radius: 8px;
        border-bottom-right-radius: 8px;
    }

    .table .disTitle
    {
        height: 50px;
        background-color: var(--button-gray);
        width:200px;
        display: flex;
        align-items: center;
        border-right: 1px solid var(--input-gray);
        padding-left: 20px;
    }

    .table .disContnet
    {
        /* width: calc(100%-200px); */
        width: calc(100%-200px);
        padding-left: 20px;
    }

    .changepw
    {
    border: 1px solid var(--input-gray);
    font-size: var(--font-size14);
    padding: 5px 20px;
    border-radius: 6px;
    cursor: pointer;
    }


    /*기업정보수정 버튼*/
    .modify
    {
    /* width: 100%; */
    display: flex;
    justify-content: center;
    margin-top: 50px;
    }

    .modify .commodify
    {
    
    height: 50px;
    border-radius: 6px;
    border: none;
    /* margin-top: 40px; */
    background-color: var(--color-gray);
    color: var(--color-white);
    padding: 5px 20px;
    cursor: pointer;
    }

    /*비밀번호 변경 팝업 예정*/
    .popU
    {
        display: none;
    }

    </style>
</head>
<body>
<div class="container">
	<%@ include file="../nav_company.jsp" %>
    <%@ include file="../quickMenu.jsp" %>
	
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
                
                <div class="common">
                    <div class="simpleData">
                        <div class="table">
                            <div class="disTitle">기업이메일</div>
                            <div class="disContnet">${companyInfo.com_email}</div>
                            <!-- <div class="disContnet">test@junion.com</div> -->
                        </div>
                        <div class="table">
                            <div class="disTitle">사업자등록번호 </div>
                            <!-- <td class="social_number">${companyInfo.com_serial_number}</td> -->
                            <div class="disContnet social_number"></div>
                        </div>
                        <div class="table">
                            <div class="disTitle">이름</div>
                            <div class="disContnet">${companyInfo.com_person}</div>
                            <!-- <div class="disContnet">이주빈</div> -->
                        </div>
                        <div class="table">
                            <div class="disTitle">연락처</div>
                            <div class="disContnet">${companyInfo.com_tel}</div>
                            <!-- <div class="disContnet">070-224-5214</div> -->
                        </div>
                        <div class="table">
                            <div class="disTitle">비밀번호</div>
                            <div class="disContnet"><input type="button" value="변경하기" class="changepw" onclick="pwchange()"></div>
                        </div>
                    </div><!-- table끝 -->

                    <div class="modify">
                        <input type="button" value="기업정보수정" class="commodify" onclick="location.href='companyInfoUpdate'">
                    </div>

                    <div class="popU">
                        <!-- <form method="post" action="/passwordchange"> -->
                            <div class="popCon disF flexD">
                                <div class="popMain">
                                    <div class="popM">
                                        <div class="popH mlauto">
                                            <h5 class="title">비밀번호 변경</h5>
                                        </div>
                                        <div class="popX">
                                            <div class="pwRE on">
                                                <h5 class="nowPw">현재 비밀번호</h5>
                                                <div class="nowPwIn">
                                                    <input type="password" class="pwValue" id="userPwCheck" minlength="8" maxlength="20" required >
                                                </div>
                                            </div>
                                            <div class="disW" id="passwordCheck"></div>
                                            <div class="pwRE tw">
                                                <h5 class="nowPw">변경할 비밀번호</h5>
                                                <div class="nowPwIn">
                                                    <input type="password" class="pwValue" id="changePassword" minlength="8" maxlength="20" placeholder="영문자, 숫자, 특수문자 포함 총 8~20자" required >
                                                </div>
                                            </div>
                                            <div class="pwRE th">
                                                <h5 class="nowPw">변경 비밀번호 확인</h5>
                                                <div class="nowPwIn">
                                                    <input type="password" class="pwValue" id="changePasswordCh" minlength="8" maxlength="20" placeholder="영문자, 숫자, 특수문자 포함 총 8~20자" required >
                                                </div>
                                            </div>
                                            <div class="disW" id="resultPassword"></div>
                                        </div><!--popX 내용-->
                                    </div>
                                    <div class="popB">
                                        <!-- <button type="submit" class="submit tabBtn">전송</button> -->
                                        <button type="button" class="submit tabBtn" id="validation">전송</button>
                                    </div>
                                </div><!--popCon disF flexD-->
                            </div><!--popMain-->
                        <!-- </form> -->
                    </div><!--popU-->
                    
                </div><!--기본정보 탭 끝(common)-->
            </div><!-- tabCon     ///containe끝 -->
        </section>
    
    </div><!-- main-content -->
</div> <!--container-->   
<%@ include file="../footer.jsp" %>
</body>
<script>

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

    // 24.08.06 하진 : 사업자 번호 출력 형식 수정 
    let serialNumber = "${companyInfo.com_serial_number}";
    let getFormat = serialNumber.substring(0,3) + "-" + serialNumber.substring(3,5)+"-"+serialNumber.substring(5);
    console.log(getFormat);
    let socialNumberElement = document.querySelector('.social_number');
    socialNumberElement.textContent = getFormat;

         // 24.07.09 하진 : 비밀번호 변경 팝업 -> 외부 팝업으로 구현
     // 24.08.11 하진 : 비밀번호 변경 팝업 크기 수정
     function pwchange() {// 비밀번호 설정 외부 팝업 띄우는 코드
            // window.name = "부모창 이름"; 
        
            var popupURL = "/companyPW";
            // var popupProperties = "width=500, height=300, resizable = no, scrollbars = no";
            var popupProperties = "width=550, height=400, resizable = no, scrollbars = no";
            window.open(popupURL, "companyPW.jsp", popupProperties);    
        }

</script>