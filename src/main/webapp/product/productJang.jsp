<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<div class="basketWrap">
	<div class="basket">
	<h1>장바구니</h1>
		<div class="basketInfo">
			<ul class="basketTitleArea">
				<li class="basketName">상품명</li>
				<li class="basketAmount">총수량</li>
				<li class="basketPrice">판매가</li>
				<li class="basketPoint">포인트</li>
				<li class="basketDelFee">배송비</li>
				<li class="basketTotal">합계</li>
			</ul>
			
			
			
<!-- 반복문 사용구간 -->
			<ul class="basketContentArea">
				<li class="basketName1">상품명</li>
				<li class="basketAmount1">총수량</li>
				<li class="basketPrice1">판매가</li>
				<li class="basketPoint1">포인트</li>
				<li class="basketDelFee1">배송비</li>
				<li class="basketTotal1">합계</li>
			</ul>
<!-- ////////////////////////////// -->



			
			<ul class="basketBrief">
				<li class="briefTotal">
					<p>총 주문금액</p>
					<p>${totalPrice }34534</p>
				</li>
				<li class="briefGiho">
					<input class="briefGiho" value="-" readonly>
				</li>
				<li class="briefDiscount">
					<p>최대 할인금액</p>
					<p>${totalPrice }345345</p>
				</li>
				<li class="briefGiho">
					<input class="briefGiho" value="+" readonly>
				</li>
				<li class="briefShipping">
					<p>배송비</p>
					<p>${deliverFee }34534</p>
				</li>
				<li class="briefGiho">
					<input class="briefGiho" value="=" readonly>
				</li>
				<li class="briefGTotal">
					<p>결제예정금액<br>
					<p>${GrandTotal }347347347</p>
				</li>
			</ul>
			<ul class="basketBtnArea">
				<li>
					<a href="payment.jsp"><input type="button" value="주문하기" class="btnBasket2"></a>
				</li>
				<li>
					<a href="/product/productShopList?tab=1"><input type="button" value="계속 쇼핑하기" class="btnBasket1"></a>
				</li>
			
			</ul>
		</div>
	</div>
</div>

<%@ include file="/include/footer.jsp" %>