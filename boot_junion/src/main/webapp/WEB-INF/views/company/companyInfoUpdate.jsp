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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companyInfoUpdate.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/company_InfoUpdate.js"></script> 
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
                    <div class="tabCon detail">
                        <table class="tabCon" style="width:100%">
                            <input type="hidden" name="com_email" value="${companyInfo.com_email}">
                            <tr>
                                <th>기업이메일</th>
                                <!-- <td> <input type="textarea" class="modifytext" name="com_email" placeholder="이메일을 입력해주세요"> </td> -->
                                <td class="modifytext">${companyInfo.com_email}</td>
                            </tr>
                            <tr>
                                <th>사업자등록번호 </th>
                                <!-- <td><input type="textarea" class="modifytext" name="com_serial_number" placeholder="사업자등록번호를 입력해주세요"></td> -->
                                <td  class="modifytext" id="social_number"></td>
                            </tr>
                            <tr>
                                <th>인사담당자명</th>
                                <!-- <td><input type="text" class="modify" id="com_person" name="com_person" placeholder="이름을 입력해주세요" required></td> -->
                                <td><input type="text" class="modify" id="com_person" name="com_person" placeholder="이름을 입력해주세요"></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <!-- <td><input type="text" class="modify" id="com_tel" name="com_tel" placeholder="연락처를 입력해주세요" required></td> -->
                                <td><input type="text" class="modify" id="com_tel" name="com_tel" placeholder="연락처를 입력해주세요"></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <!-- <td><input type="password" class="modify" id="checkPW"  placeholder="변경 확인을 위해 비밀번호를 입력해주세요" required></td> -->
                                <td><input type="password" class="modify" id="checkPW"  placeholder="변경 확인을 위해 비밀번호를 입력해주세요"></td>
                            </tr>
                            <!-- ${login_pw} : 세션 설정 비밀번호 -> 따로 모델에 실어 보내지 않더라도 호출 가능 -->
                        </table><!-- table끝 -->
                        
                    </div>
                    <div class="modify">
                        <!-- <input type="button" value="수정완료" class="commodify" onclick="pwcheck()"> -->
                        <input type="submit" value="수정완료" class="commodify">
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