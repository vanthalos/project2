<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>


<div id="product">
	<div class="productWrap">
		홈 > 필수가전 > TV/냉장고/세탁기/건조기 > TV/영상가전 > TV
		<h2 style="margin-top: 20px;">총  ${count } 개의 상품이 있습니다.</h2>
		
		<script>
		
			$(function(){
				$('.tabnav a').click(function () {
					$('.tabnav a').removeClass('active');
					$(this).addClass('active');
				}).filter(':eq(${tab-1})').click();
			});
			  
		</script>
		
		<div class="tab">
			<ul class="tabnav">
			    <li><a href="productShopList?tab=1">신상품순</a></li>
			    <li class="tab2"><a href="productShopList?tab=2">추천수많은순</a></li>
			    <li class="tab3"><a href="productShopList?tab=3">인기상품순</a></li>
			    <li class="tab4"><a href="productShopList?tab=4">낮은가격순</a></li>
			    <li class="tab5"><a href="productShopList?tab=5">높은가격순</a></li>
			</ul>
			<script>
//				history.replaceState({}, null, location.pathname);
			</script>
			<div class="tabContentWrap">
				
			    <ul class="thumnailType">
					<c:set var="number" value="${number }"/>
					<c:forEach var="list" items="${list }">
					<li>
						<a href="/product/productView?uid=${list.p_uid }">
						<div class="prdItem">
							<p class="prdImg">
								<img class="prdImg" src="/upload/${list.pimg }">
							</p>
						</div>
						<div class="prdInfo">
						    <p class="prdTitle">
								<c:choose>
						           <c:when test="${fn:length(list.title) > 14}">
						            <c:out value="${fn:substring(list.title, 0, 13)}"/>...
						           </c:when>
						           <c:otherwise>
						            <c:out value="${list.title}"/>
						           </c:otherwise> 
						        </c:choose>
								<input type="hidden" value="${number }" style="width: 20px;">
							</p>
							<p class="prdName">
								<c:choose>
						           <c:when test="${fn:length(list.p_name) > 46}">
						            <c:out value="${fn:substring(list.p_name, 0, 45)}"/>...
						           </c:when>
						           <c:otherwise>
						            <c:out value="${list.p_name}"/>
						           </c:otherwise> 
						        </c:choose><br>
						    </p>
							<p class="prdPrice">
								<fmt:formatNumber value="${list.price }" pattern="#,###" /> 원<br>
							</p>
							<p class="prdContent">
								<c:choose>
						           <c:when test="${fn:length(list.content) > 46}">
						            <c:out value="${fn:substring(list.content, 0, 45)}"/>...
						           </c:when>
						           <c:otherwise>
						            <c:out value="${list.content}"/>
						           </c:otherwise> 
						        </c:choose><br>
							</p>
							<div class="prdUtil">
								<p class="utilRef">☆추천 : ${list.ref }</p>
								<p class="utilHit">★히트 : ${list.hit }</p>
							</div>
						</div>
						</a>
					</li>
					<c:set var="number" value="${number - 1 }"/>
					</c:forEach>
			
				</ul>
				
			</div>
			
			<!-- 페이징 시작 -->
			<div align=center>	
			<c:if test="${count>0 }">
				<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
				<fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />

				<!-- 2개의 변수 초기화 -->
				<c:set var="startPage" value="${1 }" />
				<c:set var="pageBlock" value="${3 }" />	

				<!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분-->
				<c:if test="${pageNum > pageBlock }">

					<!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
					<fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
					<c:set var="startPage" value="${result * pageBlock + 1 }" />
				</c:if>	

				<!-- endPage 값 설정 부분 -->
				<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount }" />
				</c:if>
				
				<c:set var="tab" value="${tab }"/>
				
				<!-- 이전 링크 -->
				<c:if test="${startPage > pageBlock }">
					<a href="productShopList?tab=${tab }&pageNum=${pageBlock }&field=${field}&search=${search}">[이전] </a>
				</c:if>

				<!-- 페이징 링크 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:choose>
						<c:when test="${pageNum == i }">
							<a href="productShopList?tab=${tab }&pageNum=${i }&field=${field}&search=${search}"><span style="padding:0px 4px;"><font color=red><b>[${i }]</b></font></span></a>
						</c:when>
						<c:otherwise>
							<a href="productShopList?tab=${tab }&pageNum=${i }&field=${field}&search=${search}"><span style="padding:0px 4px;">[${i }]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- 다음 링크 -->
				<c:if test="${endPage < pageCount }">
					<a href="productShopList?tab=${tab }&pageNum=${startPage + pageBlock }&field=${field}&search=${search}">[다음] </a>
				</c:if>
			</c:if>
		</div>
		<!-- 페이징 끝 -->
			
			
		</div>
	</div>
</div>
		
		
	
<%@ include file="/include/footer.jsp" %>