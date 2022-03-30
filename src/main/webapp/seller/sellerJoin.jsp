<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<script>	// 스페이스바 입력방지
	function checkspacebar(){
		var kcode = event.keyCode;
		if(kcode ==32){
			event.returnValue = false;
		}
	}
</script>



<script>
function id_select(id){
	$.ajax({
		url: "/seller/SellerIdCk", //전송 페이지 경로
		type: "post", //데이터를 읽어 오는 방식
		dataType: "text", //데이터 방식 : 문자열로 읽어 온다.
		data: "id="+ id, //변수 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			
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
function checkAll(){
	
	
	var objEv = event.srcElement;
	var numPattern = /([^0-9])/;
	var numPattern = objEv.value.match(numPattern);
	
	if (numPattern != null) {
		alert("숫자만 입력하세요");
		objEv.value = "";
		objEv.focus();
		return false;
	}
	
	if(id_ok.value == ""){
		alert("id값 중복확인을 해주세요");
		return false;
	}else if(id_ok.value =="N"){
		alert("id값 중복확인을 해주세요");
		return false;
	}
		
	if(!id.value){
		alert("id값 공백");
		id.focus();
		return false;
	}
	else if(!pass.value){
		alert("pass값 공백");
		pass.focus();
		return false;
	}else if(!name.value){
		alert("name값 공백");
		name.focus();
		return false;
	}else if(!email.value){
		alert("email값 공백");
		email.focus();
		return false;
	}else if(!phone.value){
		alert("phone값 공백");
		phone.focus();
		return false;
	}else if(!address.value){
		alert("sample4_postcode값 공백");
		sample4_postcode.focus();
		return false;
	}else if(!sample4_detailAddress.value){
		alert("상세주소를 입력해주세요.");
		sample4_detailAddress.focus();
		return false;
	}else if(!sel_num.value){
		alert("sel_num 공백");
		sel_num.focus();
		return false;
	}else if(!id_result_ck.value){
		alert("id 중복확인을 해주세요");
		id_check_bt.focus();
		return false;
	}
	
	document.submit();
}


</script>
	<div id="joinForm">
		<div class="joinFormWrap">
			<h2>판매자 회원가입</h2>
			<form name="join" action="sellerJoin_insert" method="post" onsubmit="return checkAll()">						
				<input type="hidden" name="id_ok" id="id_ok" value="N" type="text">
				아이디: <br>
				<input id="id" name="id" value="" class="joinInput"><span id="id_check_bt" onclick="id_select(join.id.value)">[중복확인]</span>  <br>
				<div id="id_result"> </div>
				비밀번호:<br>
				<input id="pass" name="pass" value="" class="joinInput"><br>
				이름: <br>
				<input id="names" name="name" value="" class="joinInput"><br>
				이메일: <br>
				<input id="email" name="email" value="" class="joinInput"><br>
				주소: <br>
					<input type="hidden" id="address" name="address" value="" >
					<input type="text" id="sample4_postcode" class="joinInput" name="zipcode" value="" placeholder="우편번호" readonly>
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_roadAddress" class="joinInput" name="zipcode1" value="" placeholder="도로명주소" readonly>
					<input type="text" id="sample4_jibunAddress" class="joinInput" name="zipcode2" value="" placeholder="지번주소" readonly>
					<input type="text" id="sample4_detailAddress" class="joinInput" name="zipcode3" value="" placeholder="상세주소" >
					<input type="text" id="sample4_extraAddress" class="joinInput" name="zipcode4" value="" placeholder="참고항목" readonly>
				
				<br>
				
				휴대폰번호: <br>
				<input type="text" id="phone" name="phone" value="" class="joinInput" onPropertyChange="checkNumber()"><br>
				사업자등록증번호: <br>
				<input id="sel_num" name="sel_num" value="" class="joinInput"><br>
				<button onclick="">회원가입</button>
			</form>
		</div>
	</div>
	
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