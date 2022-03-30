<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>



<script>
	function checkspacebar(){
		var kcode = event.keyCode;
		if(kcode ==32){
			event.returnValue = false;
		}
	}
	
	function handleOnInput(el, maxlength) {
		  if(el.value.length > maxlength)  {
		    el.value 
		      = el.value.substr(0, maxlength);
		  }
		}
</script>


<script>
function checkAll(){
	
	if(!pass.value){
		alert("pass값 공백");
		pass.focus();
		return false;
	}if(!names.value){
		alert("name값 공백");
		names.focus();
		return false;
	}if(!email.value){
		alert("email값 공백");
		email.focus();
		return false;
	}if(!phone.value){
		
		
		alert("phone값 공백");
		phone.focus();
		return false;
	}else{
		if(phone.value.length < 11){
			alert("11자리를 입력해주세요");
			phone.focus();
			return false;
		}else{
			document.submit();
		}
	}
		
	
	
	if(!sample4_detailAddress.value){
		alert("상세주소를 입력해주세요.");
		sample4_detailAddress.focus();
		return false;
	}if(!sel_num.value){
		alert("sel_num 공백");
		sel_num.focus();
		return false;
	}if(!email_address.value){
		alert("이메일 주소를 기입해주세요");
		email_address.focus();
		return false;
	}if(pass.value != passCheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		passCheck.focus();
		$("#passInfoF").text("비밀번호 불일치");
		return false;
	}if(pass.value == passCheck.value){
		$("#passInfoF").text("");
		$("#passInfoT").text("비밀번호 일치");
	}
	document.submit();
}
</script>

<script>
$(document).ready(function(){
	$("#email_select").change(function(){
		$("#email_address").val($(this).val());
	});
	
});



</script>
	<div id="joinForm">
		<div class="joinFormWrap">
			<h2>판매자 정보 수정</h2>
			<form name="mypage"action="sellerMypageUpdate" method="post" onsubmit="return checkAll()">	
				
				아이디: <br>
				<input id="id2" name="id" value="${Seller.id }" class="joinInput" readonly>	
				<div id="id_result"> </div>
				비밀번호:<br>
				<input id="pass" name="pass" value="${Seller.pass }" class="joinInput" onkeydown="checkspacebar();"/><br>
				비밀번호 확인:<br>
				<input id="passCheck" name="passCheck" value="${Seller.pass }" class="joinInput" onkeydown="checkspacebar();"/><br>
				<div style="color:red" id="passInfoF" name="passInfoF"></div>
				<div style="color:red" id="passInfoT" name="passInfoT"></div>
				
				
				
				이름: <br>
				<input id="names" name="name" value="${Seller.name }" class="joinInput" onkeydown="checkspacebar();"><br>
				이메일: <br>
				<div style="display:flex;">
					<input id="email" name="email" value="${email1}" class="joinInput" onkeydown="checkspacebar();"> 
					<div><input name="at" value="@" style="width:50px;font-size:25px;" placeholder="@" readonly></div>
					<div><input id="email_address" name="email_address" value="${email2 }" ></div>
					<div>
						<select id="email_select" name="email_select">
							<option value="">=직접 주소 입력=</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
					</div>
				</div><br>
				
				주소: <br>
					<input type="hidden" id="address" name="address" value="" >
					<input type="text" id="sample4_postcode" class="joinInput" name="zipcode" value="${Seller.zipcode }" placeholder="우편번호" readonly>
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_roadAddress" class="joinInput" name="zipcode1" value="${Seller.zipcode1 }" placeholder="도로명주소" readonly>
					<input type="text" id="sample4_jibunAddress" class="joinInput" name="zipcode2" value="${Seller.zipcode2 }" placeholder="지번주소" readonly>
					<input type="text" id="sample4_detailAddress" class="joinInput" name="zipcode3" value="${Seller.zipcode3 }" placeholder="상세주소" >
					<input type="text" id="sample4_extraAddress" class="joinInput" name="zipcode4" value="${Seller.zipcode4 }" placeholder="참고항목" readonly>
				<br>
				
				휴대폰번호: <br>
				<input type="text" id="phone" name="phone" value="${Seller.phone }" class="joinInput"  oninput='handleOnInput(this, 11)' ><br>
				
				<br>
				
				
				사업자등록증번호: <br>
				<input id="sel_num" name="sel_num" value="${Seller.sel_num }" class="joinInput" onkeydown="checkspacebar();"><br>
				<button>정보수정</button>
			</form>
				<div style="float:right">
					<form action="/member/withdrawal" method="post" >
						<input type="hidden" id="wId" name="wId" value="${Seller.id }">
						<input type="hidden" id="wType" name="wType" value="${Seller.type }">
						<button style="background-color: red; color:white;">회원탈퇴</button>
					</form>
				</div>
		</div>
	</div>
<script>


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
                document.getElementById("address").value = "1";
                
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
	
<%@ include file="/include/footer.jsp" %>