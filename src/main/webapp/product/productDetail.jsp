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
	$(function btconfirm(){
	   $("#id").click(function (){
	      if(confirm("장바구니에 담으시겠습니까?")){
	         alert("장바구니에 담았습니다.");
	         // return true;
	      }else{
	         return false;
	      }
	   });
	});	
</script>
<body>
<div id="product">
	<div class="productWrap">
		<h2>${pro.p_name }</h2>
		<div class="tab">
			<ul class="tabnav">			
			</ul>			
			<div class="prdSec">
				<!-- 좌측 -->				
				<div class="leftSec">
				<div class="productImg_1">
					<img src="/upload/${pro.pimg }">
					<div style="height:30px;"></div>
				<div class="productImg_bottom"></div>
				</div>				
				</div>
				<!-- 우측 -->
				<div class="rightSec">
					<ul>
						<li style="height:36px;">제품명 : ${pro.p_name}</li>
						<li style="height:20px; border-top:1px solid #999;"></li>
						<li style="height:36px;">제품 회사명 : ${pro.company}</li>
						<li style="height:20px; border-top:1px solid #999;"></li>
						<li style="height:36px;">판매가 : ${pro.price}</li>
						<li style="height:20px; border-top:1px solid #999;"></li>
						<li style="height:36px;">결제방법 : 무통장 입금</li>
						<li style="height:20px; border-top:1px solid #999;"></li>
						<li style="height:156px;" class="prd_1_1">
							<div style="height:136px; align:center;">배송방법 :&nbsp;</div>
							<div style="width:380px;">업체배송<br>도움말<br>무료배송
								<br>※ 택배로 배송되는 경우, 코로나19 예방 / 고객 안전 위해 가급적 비대면 배송 진행
								<br>※ 지역 및 상품에 따라 추가 배송비가 발생할 수 있습니다.
								<br>※ 도서/산간(제주 포함)의 경우 추가 배송비가 발생하거나 물류 사정에 따라 배송이 불가할 수 있습니다
							</div>
						</li>
						<li style="height:20px; border-top:1px solid #999;"></li>
						<li style="height:272px; background-color:#f6f6f6;" class="prd_1_1">
							<div style="padding-top:20px;">상품선택 :&nbsp;</div>
							<div style="padding-top:20px;padding-left:10px;">
								<select name="Nmain">
									<option>&nbsp;&nbsp;&nbsp;-필수선택-</option>
									<option value="${pro.p_name}">&nbsp;&nbsp;&nbsp;${pro.p_name}</option>
								</select>
								<input type="number" value="${pro.ngs }">
								<select name="Nmon">
									<option>&nbsp;&nbsp;&nbsp;-필수선택(가격)-</option>
									<option value="${pro.price}">&nbsp;&nbsp;&nbsp;${pro.price}</option>									
								</select>						
							</div>
						</li>						
						<li>
							<form id="id" action="/product/ProductJang" method="post">
							<input name="uid" type="hidden" value="${pro.uid }">
							<button style="width:100px; height:50px; background-color:red; border:1px solid red; border-radius:3px;">장바구니 담기</button>
							</form>
						</li>						
					</ul>
				</div>				
			</div>			
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="/include/footer.jsp" %>