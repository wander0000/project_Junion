<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 마이페이지 - 인사담당자 사항 수정</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/companyInfoUpdate.css"> -->
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <!-- <script src="js/company_InfoUpdate.js"></script>  -->
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
/* section  */
.containe 
{
  /* display: flex;
  justify-content: center; */
  /* padding-top: 90px; */
  padding: 90px 0 90px 60px;
  /* max-width: clac(100%-240px); */

  
}

/* 헤더밑 타이틀*/
.containe .toptitle
{
  text-align: left;
  margin-bottom: 40px;
  gap: 40px;
  display: flex;
} 

.toptitle1
{
  /* margin-right: 40px; */
  font-size: var(--font-size32);
  cursor: pointer;
}



/* 기본 정보 */
/* .simpleData
{
    border: 1px solid var(--color-gray);
} */
 .common, .detail
 {
    max-width: 730px;
 }
.table
{
    border: 1px solid var(--color-gray);
    border-bottom: none;
    display: flex;
    /* height: 50px; */
    align-items: center;
    /* max-width: 730px; */
    /* gap: 40px; */
}

.table:first-child
{
    border-top: 1px solid var(--color-gray);
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
}

.table:last-child
{
    border-bottom: 1px solid var(--color-gray);
    border-bottom-left-radius: 6px;
    border-bottom-right-radius: 6px;
}

.table .disTitle
{
    height: 50px;
    background-color: var(--button-gray);
    width:200px;
    display: flex;
    align-items: center;
    border-right: 1px solid var(--color-gray);
    padding-left: 20px;
}

.table .disContnet
{
    width: calc(100%-200px);
    padding-left: 20px;
}

.table .changeValue
{
  height: 50px;
  /* width: 100%; */
  width: 485px;
  padding-left: 20px;
}

.disContnet.changepw
{
  border: 1px solid var(--color-gray);
  font-size: var(--font-size14);
  padding: 5px 20px;
  border-radius: 6px;
  /* cursor: pointer; */
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
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../nav_company.jsp" %>
        <div class="mainContent">
            <header>
                <%@ include file="../dropdown.jsp" %>
            </header>   
            <main>
                <div class="containe">
                    
                    
                    <div class="toptitle">
                        <h3 class="toptitle1" >기업 기본 수정</h3>
                        
                    </div>
                         
                    <form method="post" id="comInfoUpdate" action="modify_Info">
                        <div class="common">
                            <div class="simpleData">
                                <input type="hidden" name="com_email" value="${companyInfo.com_email}">
                                <div class="table">
                                    <div class="disTitle">기업이메일</div>
                                    <!-- <td> <input type="textarea" class="modifytext" name="com_email" placeholder="이메일을 입력해주세요"> </td> -->
                                    <div class="disContnet">${companyInfo.com_email}</div>
                                </div>
    
                                <div class="table">
                                    <div class="disTitle">사업자등록번호 </div>
                                    <!-- <td><input type="textarea" class="modifytext" name="com_serial_number" placeholder="사업자등록번호를 입력해주세요"></td> -->
                                    <div class="disContnet" id="social_number"></div>
                                </div>
    
                                <div class="table">
                                    <div class="disTitle">인사담당자명</div>
                                    <!-- <td><input type="text" class="modify" id="com_person" name="com_person" placeholder="이름을 입력해주세요" required></td> -->
                                    <!-- <div class="disContnet"><input type="text" class="modify" id="com_person" name="com_person" placeholder="이름을 입력해주세요"></div> -->
                                    <!-- <div class="disContnet"><input type="text" class="changeValue" id="com_person" name="com_person" placeholder="이름을 입력해주세요"></div> -->
                                    <div><input type="text" class="changeValue" id="com_person" name="com_person" placeholder="이름을 입력해주세요"></div>
                                </div>
    
                                <div class="table">
                                    <div class="disTitle">연락처</div>
                                    <!-- <td><input type="text" class="modify" id="com_tel" name="com_tel" placeholder="연락처를 입력해주세요" required></td> -->
                                    <!-- <div class="disContnet"><input type="text" class="modify" id="com_tel" name="com_tel" placeholder="연락처를 입력해주세요"></div> -->
                                    <!-- <div class="disContnet"><input type="text" class="changeValue" id="com_tel" name="com_tel" placeholder="연락처를 입력해주세요"></div> -->
                                    <div><input type="text" class="changeValue" id="com_tel" name="com_tel" placeholder="연락처를 입력해주세요"></div>
                                </div>
    
                                <div class="table">
                                    <div class="disTitle">비밀번호</div>
                                    <!-- <td><input type="password" class="modify" id="checkPW"  placeholder="변경 확인을 위해 비밀번호를 입력해주세요" required></td> -->
                                    <!-- <div class="disContnet"><input type="password" class="modify" id="checkPW"  placeholder="변경 확인을 위해 비밀번호를 입력해주세요"></div> -->
                                    <div><input type="password" class="changeValue" id="checkPW"  placeholder="변경 확인을 위해 비밀번호를 입력해주세요"></div>
                                </div>
                                <!-- ${login_pw} : 세션 설정 비밀번호 -> 따로 모델에 실어 보내지 않더라도 호출 가능 -->
                            </div><!--simpleData 끝 -->
                            
                            <div class="modify">
                                <!-- <input type="button" value="수정완료" class="commodify" onclick="pwcheck()"> -->
                                <input type="submit" value="수정완료" class="commodify">
                            </div>
                        </div>
                      </form>
                </div> <!-- containe끝 -->
            </main>
        
        </div> <!-- //main-content -->
    </div>      
<%@ include file="../footer.jsp" %>
    
</body>
</html>
<script>

     // 24.08.06 하진 : 사업자 번호 출력 형식 수정 
  let serialNumber = "${companyInfo.com_serial_number}";
  let getFormat = serialNumber.substring(0,3) + "-" + serialNumber.substring(3,5)+"-"+serialNumber.substring(5);
  console.log(getFormat);
  let socialNumberElement = document.getElementById('social_number');
  socialNumberElement.textContent = getFormat;




    $(".commodify").on("click", function (e) {
        e.preventDefault();

        var person = $("#com_person").val();
        console.log(person);
        if (!person) {
            alert("인사담당자명을 입력해주세요");
            $("#com_person").focus();
            return false;
        }
        var tell = $("#com_tel").val();
        if (!tell) {
            alert("연락처를 확인해주세요");
            $("#com_tel").focus();
            return false;
        }
        var sessionPW = "${login_pw}";
        var checkPW = $("#checkPW").val();
        if (sessionPW == checkPW) {
            alert("변경이 완료되었습니다.");
        } else {
            alert("비밀번호가 일치하지 않습니다.");
            $("#checkPW").focus();
            return false;
        }

        $("#comInfoUpdate").submit();    
    });//수정 완료 버튼 클릭시 비밀번호 검사 로직
</script>