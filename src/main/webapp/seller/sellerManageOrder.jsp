<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>
<style>
#flexx {display:flex;}
#borderr {border:1px solid black; width:100px;}
</style>

<script>

</script>

		<div id="product">
			<div class="productWrap">
				<h1>주문 관리 페이지 (Order 테이블 참조)	&nbsp; 	<div id="yet">미결제 주문</div> </h1>
				<div style="height:500px;">
					<div id="flexx">
						<div>번호	
							<input id="chkAll" type="checkbox">
						</div>
						<div>주문번호</div>
						<div>날짜</div>
						
						<div>상품정보</div>
						<div>상품수량</div>
						<div>상품금액</div>
						
						<div>이름</div>
						<div>휴대폰번호</div>
						<div>주소</div>
						
						<div>입금 정보</div>
						<div>결제완료 확인</div>
					</div>
					
					<form id="selectb" action="/seller/SellerManageOrderUpdate" onsubmit="return pop()">
					<input id="sendd" name="sendd" value="" style="border:3px solid orange;">
					<c:forEach var="list" items="${List}">
						<div id="flexx">
							<div>
								<input id="chk${list.numbering}" class="chkSub" name="chkbox" type="checkbox" value="${list.orderNumber}"> &nbsp; ${list.numbering}
							</div>
							<div>${list.orderNumber}</div>
							<div>${list.signDate}</div>
							<div>${list.productInfo}</div>
							<div>${list.productAmount}</div>
							<div>${list.productPrice}</div>
							<div>${list.buyerName}</div>
							<div>${list.buyerPhone}</div>
							<div>${list.buyerAddress}</div>
							<div>${list.buyerPaymentInfo}</div>
							<div class="chkaa${list.numbering}" >${list.paymentCheck} </div>
						</div>
					</c:forEach>
					
					<div style="display:flex;">
						<c:forEach begin="1" end="${lastPage}" step="1" var="i" >
							<c:choose>
								<c:when test="${param.pageNow == i }">
									<div><a id="currentPage"  href="/seller/sellerManageOrder?code=All&pageNow=${i}">[ ${i} ] </a></div>
								</c:when>
								<c:otherwise>
									<div><a href="/seller/sellerManageOrder?code=All&pageNow=${i}">[ ${i} ] </a></div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					
					
					<div><button id="bba">버튼</button></div>
					
					</form>
					
					

					
					
				</div>
			</div>
		</div>


<script>
$("#flexx > *").attr("id","borderr");

$("#chkAll").click(function(){
    if($(this).is(":checked")){ //대상이 체크 되어 있을 때
    	//모든 체크박스 체크
        $(".chkSub").attr("checked", true);
    }else{ //대상이 체크 해제 되어 있을 때
    	//모든 체크박스 체크해제
        $(".chkSub").attr("checked", false);
    }
});
//전체 체크의 값이 변화했을 때
$("#chkAll").change(function(){
    if($(this).is(":checked")){ //대상이 체크 되어 있을 때    
        //같은 네임을 가진 체크박스 체크
        $("input:checkbox[name='chk']").prop("checked", true);        
    }else{ //대상이 체크 해제 되어 있을 때    
        //같은 네임을 가진 체크박스 체크해제
        $("input:checkbox[name='chk']").prop("checked", false);
        }
});        

$(".chkSub").on({
	click:function(){
		var inserts = $(this).val();
		alert(inserts);
		var pre = $("#sendd").val();
		$("#sendd").val(pre+inserts+".");
	}
});


$(function pop(){
	   $("#bba").click(function (){
		  var roof = $("input:checkbox[name=chkbox]:checked").length;
		  
		  var keys = [];
		  var values = [];
		  
		  
		  for(var i =0; i<roof; i++){
			  keys[i] = $("#chk"+(i + 1)+"").attr("id");
			  values[i] = $("#chk"+(i + 1)+"").val();
		  }
		  
	      if(confirm("삭제")){
	         //alert("총 선택 수 "+roof+" : "+key+ " : " +value + "입니다.");
	         
	         alert(keys +"와"+ values + "입니다.");
	         // return true;
	      }else{
	         alert("아니요");
	         return false;
	      }
	   });
	   
	});


// 입금 전 주문목록 탐색	
$("#yet").click(function() {
	var a = $(".chkaa2").text();
	var roof = $("input[class^=chk]").length;
	var key = [];
	var result = [];
	
	 for(var i =0; i<roof; i++){
		 var d = $(".chkaa"+(i + 1)+"").text();
		 var k = "chkaa"+(i + 1)+""
		 var yes ="예";
		 
	  }
	  
	alert(a + roof + " 모든 값들 " + key + d +"값" + result );
	
});	

// 입금 완료 주문목록 탐색

</script>



	
<%@ include file="/include/footer.jsp" %>