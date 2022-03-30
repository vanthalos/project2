<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script>
function id_select(id){
	
	$.ajax({
		url: "/member/idok",
		type: "post",
		dataType:"text",
		data:"memberid="+id,
		error:function(){
			alert("실패");
		},
		success:function(text){
			if(text == "3"){
				$("#id_result").html("<font color=blue>사용 가능한 아이디입니다.</font>");				
				$("#id_ok").val("Y");
			}else{
				var str = "";
				if(text == "2"){
					str = "<font color=red>이미 존재하는 아이디입니다.</font>";
				}else{
					str = "<font color=red>아이디는 4자 이상 입력하세요.</font>";
				}
				$("#id_result").html(str);				
				$("#id_ok").val("N");
			}			
		}
	});
	
	
}
</script>
<script>
function nickname_select(nickname){
	
	$.ajax({
		url: "/member/Nickidok",
		type: "post",
		dataType:"text",
		data:"nickname="+nickname,
		error:function(){
			alert("실패");
		},
		success:function(text){
			if(text == "3"){
				$("#nickname_result").html("<font color=blue>사용 가능한 닉네임입니다.</font>");				
				$("#nickname_ok").val("Y");
			}else{
				var str2 = "";
				if(text == "2"){
					str2 = "<font color=red>이미 존재하는 닉네임입니다.</font>";
				}else{
					str2 = "<font color=red>닉네임 한글자 이상 입력하세요.</font>";
				}
				$("#nickname_result").html(str2);				
				$("#nickname_ok").val("N");
			}			
		}
	});
	
	
}
</script>
<script>
function checkAll(){
	var id = document.getElementById("memberid");
	var pass = document.getElementById("password");
	var name = document.getElementById("name");
	var nickname = document.getElementById("nickname");
	var email = document.getElementById("email");
	var gender = document.getElementById("gender");
	var phone = document.getElementById("phone");
	var zipcode = document.getElementById("sample4_postcode");
	
	if((id.value) == ""){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}
	if(id_ok.value != "Y"){
		alert("아이디 중복확인을 해주세요.");
		id.focus();
		return false;
	}
	if((pass.value) == ""){
		alert("비밀번호를 입력해주세요.");
		pass.focus();
		return false;
	}
	if((pass.value.length) < 4){
		alert("비밀번호를 4자리 이상 입력하세요.");
		pass.focus();
		return false;
	}
	if((name.value) == ""){
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	if((nickname.value) == ""){
		alert("닉네임을 입력해주세요.");
		nickname.focus();
		return false;
	}
	if(nickname_ok.value != "Y"){
		alert("닉네임 중복확인을 해주세요.");
		nickname.focus();
		return false;
	}
	if((email.value) == ""){
		alert("이메일을 입력해주세요.");
		email.focus();
		return false;
	}
	if(email.value.length < 10){
		alert("이메일을 확인해주세요,");
		email.focus();
		return false;
	}
	if((phone.value) == ""){
		alert("전화번호를 입력해주세요.");
		phone.focus();
		return false;
	}
	if((phone.value.length) < 11){
		alert("전화번호를 제대로 입력해주세요.");
		phone.focus();
		return false;
	}
	if(join.sample4_postcode.value == ""){
		alert("주소를 입력해주세요.");
		return false;
	}
	document.submit();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.                
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	<div id="joinForm">
		<div class="joinFormWrap">
			<h2>일반회원 회원가입</h2>
			<form name="join" action="/member/join_insert" method="post" onsubmit="return checkAll()">
				아이디 : <br>
				<input type="hidden" name="id_ok" id="id_ok" value="N" type="text">				
				<input type="text" id="memberid" name="memberid" class="joinInput" placeholder="ID를 만들어주세요(10자이내) 중복확인 필수!!" maxlength="10"><span onclick="id_select(join.memberid.value)">중복확인</span><br>
				<div id="id_result"></div>
				비밀번호 : <br>															
				<input type="password" id="password" name="password" class="joinInput" placeholder="비밀번호입력 (15자이내)" maxlength="15"><br>				
				이름 : <br>
				<input type="text" id="name" name="name" class="joinInput" placeholder="이름"maxlength="10"><br>	
				닉네임 : <br>
				<input type="hidden" name="nickname_ok" id="nickname_ok" value="N" type="text">
				<input type="text" id="nickname" name="nickname" class="joinInput" placeholder="닉네임 중복확인을 해주세요" maxlength="10"><span onclick="nickname_select(join.nickname.value)">중복확인</span><br>
				<div id="nickname_result"></div>
				이메일 : <br>
				<input type="text" id="email" name="email" class="joinInput" placeholder="이메일 입력 ex)1234@gmail.com"><br>			
				성별 : <br>
				<input type="radio" name="gender" value="남성" checked>남성
				<input type="radio" name="gender" value="여성">여성<br>
				전화번호 : <br>
				<input type="text" id="phone" name="phone" class="joinInput" placeholder="-없이 입력해주세요 (11자이내)"><br>					
				주소 : <br>
				<input type="text" id="sample4_postcode" name="zipcode" value="" class="joinInput" placeholder="우편번호" readonly>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_roadAddress" name="zipcode1" value="" class="joinInput" placeholder="도로명주소" readonly>
				<input type="text" id="sample4_jibunAddress" name="zipcode2" value="" class="joinInput" placeholder="지번주소" readonly>
				<input type="text" id="sample4_detailAddress" name="zipcode3" value="" class="joinInput" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" name="zipcode4" value="" class="joinInput" placeholder="참고항목" readonly>
				<button style="width:140px; height:60px; border-radius:5px; background-color:#f5232a; border:1px solid #f5232a; cursor:pointer"><font color="white"><b>회원가입</b></font></button>				
			</form>
		</div>
	</div>

<%@ include file="/include/footer.jsp" %>