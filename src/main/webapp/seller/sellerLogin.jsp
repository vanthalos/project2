<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<script>

function checkAll(){
	if(!id.value){
		alert("아이디 입력");
		id.focus();
		return false;
	}if(!pass.value){
		alert("비밀번호 입력");
		pass.focus();
		return false;
	}
}
</script>



<div id="joinForm">
	<div class="joinFormWrap">
	<form name="" action="sellerLogin_insert" method="post"  onsubmit="return checkAll()">
		<div>
			<h2>로그인</h2>
			아이디: <br>
			<input id="id" name="id" value="${cookie.cid.value }" class="joinInput"><br>
			비밀번호: <br>
			<input type="password" id="pass" name="pass" value="" class="joinInput"><br>
			아이디 저장
			<input type="checkbox" id="id_chk" name="id_chk" value="checked" <%if(cookie_name != ""){%>checked<%}%> >
			
			
			<div><button>로그인</button></div>
		</div>
	</form>
	
	
	</div>	
</div>		

<script>



</script>


<%@ include file="/include/footer.jsp" %>