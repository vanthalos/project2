<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<script>
function login(){
	if(memberid.value == ""){
		alert("아이디를 입력해주세요.");
		memberid.focus();
		return false;
	}
	if(password.value == ""){
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}
	document.submit();
}
</script>

	<div class="joinForm">
		<div class="joinFormWrap">
			<form action="/member/memberlogin_ok" method="post" onsubmit="return login()">
			아이디 : <br> 
			<input type="text" id="memberid" name="memberid" value="${cookie.cid.value }" class="joinInput"><br>
			비밀번호 : <br>
			<input type="password" id="password" name="password" value="" class="joinInput"><br>
			아이디 저장
			<input type="checkbox" id="id_chk" name="id_chk" value="checked" <%if(cookie_name != ""){%>checked<%}%> ><br>
			<button>로그인</button>
			</form>
		</div>
	</div>
	
<%@ include file="/include/footer.jsp" %>