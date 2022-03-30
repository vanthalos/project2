<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function up1(){
	alert("수정이 완료되었습니다.");
	document.submit();
}
</script>
<c:set var="mgender" value="${member.gender }" ></c:set>
<body>
	<div id="joinForm">
		<div class="joinFormWrap">
			<form name="join" action="/member/join_update" method="post" onsubmit="return up1()">
				아이디 : <br>				
				<input type="text" id="memberid" name="memberid" class="joinInput" value="${member.memberid}" readonly maxlength="10"><br>
				<div id="id_result"></div>
				비밀번호 : <br>															
				<input id="password" name="password" class="joinInput" value="${member.password}" maxlength="15"><br>				
				이름 : <br>
				<input type="text" id="name" name="name" class="joinInput" value="${member.name}" readonly maxlength="10"><br>	
				닉네임 : <br>				
				<input type="text" id="nickname" name="nickname" class="joinInput" value="${member.nickname}" readonly maxlength="10"><br>
				<div id="nickname_result"></div>
				이메일 : <br>
				<input type="text" id="email" name="email" class="joinInput" value="${member.email}"><br>			
				성별 : <br>
				<input type="radio" name="gender" value="남성" <c:if test="${mgender eq '남성' }">checked</c:if>>남성
				<input type="radio" name="gender" value="여성" <c:if test="${mgender eq '여성' }">checked</c:if>>여성<br>
				전화번호 : <br>
				<input type="text" id="phone" name="phone" class="joinInput" value="${member.phone}" maxlength="11"><br>					
				주소 : <br>
				<input type="text" id="sample4_postcode" name="zipcode" value="${member.zipcode}" class="joinInput" placeholder="우편번호" readonly>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_roadAddress" name="zipcode1" value="${member.zipcode1}" class="joinInput" readonly>
				<input type="text" id="sample4_jibunAddress" name="zipcode2" value="${member.zipcode2}" class="joinInput" readonly>
				<input type="text" id="sample4_detailAddress" name="zipcode3" value="${member.zipcode3}" placeholder="상세주소" class="joinInput">
				<input type="text" id="sample4_extraAddress" name="zipcode4" value="${member.zipcode4}" class="joinInput" readonly>
				<button style="width:140px; height:60px; border-radius:5px; background-color:#f5232a; border:1px solid #f5232a; cursor:pointer"><font color="white"><b>회원수정</b></font></button>				
			</form>
			<div>
				<form action="/member/withdrawal" method="post" >
                  <input type="hidden" id="wId" name="wId" value="${member.memberid }">
                  <input type="hidden" id="wType" name="wType" value="${member.type }">
                  <button style="background-color: red; color:white;">회원탈퇴</button>
               </form>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="/include/footer.jsp" %>