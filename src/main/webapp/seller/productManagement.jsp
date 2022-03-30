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
</style>

		<div id="product">
			<div class="productWrap">
				<h1>등록상품 리스트 홈</h1>
				
					<div>총 상품 수 : ${count}</div>
					<div><a href="/seller/ProductManagementAllList?code=All">모든 상품 보기</a></div>
					<div></div>
					
			</div>
		</div>
		
		
	
<%@ include file="/include/footer.jsp" %>