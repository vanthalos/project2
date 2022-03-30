<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>
<style>
#listss {width:100%; height:50px; border:3px solid orange; display:flex;}
#iteeem {width:20%; height:100%; border:3px solid black;}
#listItem {width:10%; height:50px; border:1px solid blue;}
#az {border:3px solid gray;}
#az1 {height:100px; border:3px solid gray;}
#paging {height:50px; border:3px solid red;}
#currentPage {color: red; font-weight: bold;}
</style>

		<div id="product">
			<div class="productWrap">
				<h1>등록 물품 수 : ${Count}</h1>
				<div><a href="/seller/productManagement">상품리스트 홈</a></div>
					
						<c:forEach var="list" items="${List}">
							<div id="listss">
								<div id="listItem"><input id="ckck" type="checkbox" value="${list.uid}" ></div>
								<div id="listItem">${list.numbering}</div>
								<div id="listItem">${list.uid}</div>
								<div id="listItem">상품명 : ${list.p_name }</div>
								<div id="listItem">${list.p_id}</div>
								<div id="listItem">가격 :${list.price }</div>
								<div id="listItem">수량 :${list.amount }</div>
								<div id="listItem">재고 :${list.stock }</div>
							</div>
						</c:forEach>
						
					<div style="display:flex;">
						<c:forEach begin="1" end="${lastPage}" step="1" var="i" >
							<c:choose>
								<c:when test="${param.pageNow == i }">
									<div><a id="currentPage"  href="/seller/ProductManagementAllList?code=All&pageNow=${i}">[ ${i} ] </a></div>
								</c:when>
								<c:otherwise>
									<div><a href="/seller/ProductManagementAllList?code=All&pageNow=${i}">[ ${i} ] </a></div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>


		
	
<%@ include file="/include/footer.jsp" %>