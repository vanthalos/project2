<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@page import="java.awt.Image"%>
<%@page import="com.sun.jimi.core.Jimi"%>
<%@page import="com.sun.jimi.core.JimiException"%>
<%@page import="com.sun.jimi.core.JimiUtils"%>

<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>전자제품은 하이마트!</title>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

<link rel="stylesheet" href="/css/css.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/img/logo.jpg">

</head>

<%
Cookie[] cookies = request.getCookies();
String cookie_name = "";

if(cookies != null){
	for(int i =0; i < cookies.length; i++){
		if(cookies[i].getName().trim().equals("cid")){
			System.out.println(cookies[i].getValue());
			cookie_name=cookies[i].getValue();
		}
	}
}
%>

<body>



<!--	인덱스에 헤더 복붙/ 메인카테고리 드랍메뉴 펼치기 -> id추가
<style>
	#categoryMenubar li ul {
		display: block;
		height: 350px;
		width: 152px;
		margin: 15px 0 0 -26px;
		padding-left: 25px;
		border: 0px solid blue;
		background: black;
	    opacity: 0.7;
	    z-index: 1;
	}
</style>
-->

<div id="wrap" class="wrappin">
session_id : ${sessionScope.id } |||
session_name : ${sessionScope.name } |||
session_type : ${sessionScope.type } |||
session_pass : ${sessionScope.pass } |||
session_sel_num : ${sessionScope.sel_num} |||
쿠키 이름 ${cookie.cid.name} ||| 쿠키 값 ${cookie.cid.value} ||
<!-- EL -->
	<div id="header">
		<div class="headerWrap">
			<div class="utilWrap">
				<div class="menubar">
					<ul>
						<!-- 로그인 없음 -->
						<c:if test="${sessionScope.id == null }">
						<li class="utilMenu">
							<a href="/member/choiceLogin">로그인&nbsp;&nbsp;|</a>
						</li>	
						<li class="utilMenu">
							<a href="/member/choiceJoin">회원가입&nbsp;&nbsp;|</a>
						</li>
						<li class="utilMenu">
							<a href="#">장바구니&nbsp;&nbsp;|</a>
						</li>
						<li class="utilMenu">
							<a href="#">위시리스트&nbsp;&nbsp;|</a>
						</li>
						</c:if>
						<!-- 관리자 admin -->
						<c:if test="${sessionScope.type eq '0' }">
							<li class="utilMenu">
								관리자님 어서오세요!&nbsp;&nbsp;|
							</li>
							<li class="utilMenu">
								<a href="/member/logout">로그아웃 &nbsp;&nbsp;|</a>
							</li>
							<li class="utilMenu">
								<a href="#" id="current">마이페이지∨&nbsp;&nbsp;|</a>
								<ul>
									<li>
										<a href="#">내정보수정</a>
									</li>
									<li>
										<a href="#">회원관리</a>
									</li>
									<li>
										<a href="#">판매자관리</a>
									</li>
									<li>
										<a href="#">상품관리</a>
									</li>
								</ul>
							</li>
						</c:if>
						<!-- 일반회원 -->
						<c:if test="${sessionScope.type eq '1' }">
							<li class="utilMenu">
								아이디 님 어서오세요!&nbsp;&nbsp;|
							</li>
							<li class="utilMenu">
								<a href="/member/logout">로그아웃&nbsp;&nbsp;|</a>
							</li>
							<li class="utilMenu">
								<a href="#" id="current">마이페이지∨&nbsp;&nbsp;|</a>
								<ul>
									<li>
										<a href="/member/MemberJoin_up">회원정보수정</a>
									</li>
									<li>
										<a href="#">주문배송조회</a>
									</li>
									<li>
										<a href="#">포인트조회</a>
									</li>
								</ul>
							</li>
							<li class="utilMenu">
								<a href="#">장바구니&nbsp;&nbsp;|</a>
							</li>
							<li class="utilMenu">
								<a href="#">위시리스트&nbsp;&nbsp;|</a>
							</li>
						</c:if>
						<!-- 판매자 seller -->
						<c:if test="${sessionScope.type eq '2' }">	
							<li class="utilMenu">
								${sessionScope.name }님 어서오세요!&nbsp;&nbsp;|
							</li>
							<li class="utilMenu">
								<a href="/member/logout">로그아웃&nbsp;&nbsp;|</a>
							</li>
							<li class="utilMenu">
								<a href="/seller/sellerMypage" id="current">마이페이지∨&nbsp;&nbsp;|</a>
								<ul>
									<li>
										<a href="/seller/sellerMypage">내정보수정</a>
									</li>
									<li>
										<a href="/seller/sellerManageBuyer">구매자관리</a>
									</li>
									<li>
										<a href="/product/productShopList?tab=1">상품관리</a>
									</li>
									<li>
										<a href="/product/productWrite.jsp">상품등록</a>
									</li>
									<li>
										<a href="/seller/productDelivery">배송관리</a>
									</li>
									<li>
										<a href="/seller/sellerManageOrder">주문관리</a>
									</li>
								</ul>
							</li>
						</c:if>
						
						<!-- 공통 -->
						<li class="utilMenu">
							<a href="#" id="current">고객센터∨</a>
							<ul>
								<li>
									<a href="#">자주묻는 질문</a>
								</li>
								<li>
									<a href="#">고객센터<br>1588-0000</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="top">
		<div class="inner">
			<div class="mainLogo">
				<a href="/"><img src="/img/imageBanner.gif"></a>
			</div>
			<form action="" method="get">
			<div class="mainSearch">
				<input class="mainInput" type="text" id="" name="search">
			</div>
			<a href="#"><img src="/img/search.png" class="searchImg"></a>
			<div class="appleWrap">
				<a href="#"><img src="/img/apple.png" class="appleLogo"></a>
			</div>
			</form>
		</div>
	</div>
	
	<div id="category">
		<div class="categoryWrap">
			<div id="" class="categoryMenubar">
				<ul>
					<li class="categoryMain">
						<a href="#"><img src="/img/menu.png" height=13>&nbsp;전체 카테고리</a>
						<ul>
							<li>
								<a href="#">필수가전</a>
							</li>
							<li>
								<a href="#">주방/생활/건강</a>
							</li>
							<li>
								<a href="#">컴퓨터</a>
							</li>
							<li>
								<a href="#">휴대폰/스마트워치</a>
							</li>
							<li>
								<a href="#">디지털</a>
							</li>
							<li>
								<a href="#">디지털</a>
							</li>
							<li>
								<a href="#">디지털</a>
							</li>
							<li>
								<a href="#">디지털</a>
							</li>
							<li>
								<a href="#">디지털</a>
							</li>
							<li>
								<a href="#">디지털</a>
							</li>
						</ul>
					</li>
					<li class="categoryMenu">
						<a href="#">&nbsp;&nbsp;최신상품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</a>
						<!-- db 등록날짜순 -->
					</li>
					<li class="categoryMenu">
						<a href="#">인기상품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</a>
						<!-- db 판매량순 -->
					</li>
					<li class="categoryMenu">
						<a href="#">추천상품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</a>
						<!-- db 위시리스트 담은순 -->
					</li>
					<li class="categoryMenu">
						<a href="#">할인상품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						<!-- db ?? -->
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- header end -->
