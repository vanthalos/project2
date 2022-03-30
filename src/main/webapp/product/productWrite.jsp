<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<div id="product">
	<div class="productWrap">
		<h2>판매자 상품등록</h2><br>
		<form action="productWriteInsert" method="post" enctype="multipart/form-data">
		<input type="text" name="s_name" value="${sessionScope.name}">
		<input type="text" name="s_id" value="${sessionScope.id }">
		<div>
			<ul>
<!--				<li>
 					카테고리
				<select>
						<option>필수가전</option>
						<option>필수가전</option>
						<option>필수가전</option>
						<option>필수가전</option>
					</select><br>
					
					<input type="text" id="categoryy" name="" class="productWriteInput"><br>
				</li>
 -->				
				<li>
					상품명<br>
					<input type="text" id="p_name" name="p_name" class="productWriteInput">
				</li>
				<li>
					제조사<br>
					<input type="text" id="" name="company" class="productWriteInput">
				</li>
				<li>
					가격<br>
					<input type="number" id="" name="price" class="productWriteInput">
				</li>
				<li>
					재고<br>
					<input type="number" id="" name="stock" class="productWriteInput">
				</li>
				<li>
					제목<br>
					<input type="text" id="" name="title" class="productWriteInput">
				</li>
				<li>
					상품설명<br>
					<textarea cols="140" rows="30" class="productWriteDesc" id="" name="content"></textarea>
				</li>
				<li>
					수량<br>
					<script>
					function count(type)  {
						  // 결과를 표시할 element
						  const resultElement = document.getElementById('result');
						  
						  // 현재 화면에 표시된 값
						  let number = resultElement.innerText;
						  
						  // 더하기/빼기
						  if(type === 'plus') {
						    number = parseInt(number) + 1;
						  }else if(type === 'minus')  {
						    number = parseInt(number) - 1;
						  }
						  
						  // 결과 출력
						  resultElement.innerText = number;
						}
					</script>
					<input type="number" id="result" name="amount" value="${result }" class="productWriteInput"> <!-- hidden으로 값 넘길것 -->
				</li>
				<li>
					상품이미지<br>
					 리스트 이미지 : <input type="file" name="pimg" placeholder="파일 선택" ><br>
					 상세 이미지 1 : <input type="file" name="pimg1" placeholder="파일 선택" ><br>
					 상세 이미지 2 : <input type="file" name="pimg2" placeholder="파일 선택" ><br>
					 상세 이미지 3 : <input type="file" name="pimg3" placeholder="파일 선택" ><br>
					 상세 이미지 4 : <input type="file" name="pimg4" placeholder="파일 선택" ><br>
				</li>
				
				
<!-- 형섭///////////////////////////////////////// -->
				<li>
					<div style="border:1px solid black; display:flex;">
							<div style="width:200px; border:3px solid red;">
						
							<div style="background-color: #ddd;">
							상품군 분류
							</div>
							<div id="proudctCategory" style=" height:200px; overflow:scroll;">
								<input type="text" id="category1" name="category1" value="">
								<div id="essentialAppliance">필수가전</div>
								<div id="linvingLifeHelathAppliance">주방/생활/건강가전</div>
								<div id="computer">컴퓨터</div>
								<div id="phoneSmartwatch">휴대폰/스마트워치</div>
								<div id="digital">디지털</div>
							</div>
						</div>
						
						<div style=" width:200px; border:3px solid red; margin-left:20px;">
							<div id="proudctCategoryList" style="background-color: #ddd;">
								대분류
							</div>
							
							<div style=" height:200px; overflow:scroll;">
							<input type="text" id="category2" name="category2" value="">
								<div id="proudctCategoryListView">
									<div id="proudctCategoryList1"></div>
									<div id="proudctCategoryList2"></div>
									<div id="proudctCategoryList3"></div>
									<div id="proudctCategoryList4"></div>
									<div id="proudctCategoryList5"></div>
									<div id="proudctCategoryList6"></div>
									<div id="proudctCategoryList7"></div>
									<div id="proudctCategoryList8"></div>
								</div>
								
							</div>
						</div>
						<div style=" width:200px; border:3px solid red; margin-left:20px;">
							<div id="proudctCategoryListGoods" style="background-color: #ddd;">
								상품
							</div>
							
							<div style=" height:200px; overflow:scroll;">
							<input type="text" id="category3" name="category3" value="">
								
								<div id="proudctCategoryListGoodsView">
									<div id="proudctCategoryProductListGoods1"></div>
									<div id="proudctCategoryProductListGoods2"></div>
									<div id="proudctCategoryProductListGoods3"></div>
									<div id="proudctCategoryProductListGoods4"></div>
									<div id="proudctCategoryProductListGoods5"></div>
									<div id="proudctCategoryProductListGoods6"></div>
									<div id="proudctCategoryProductListGoods7"></div>
									<div id="proudctCategoryProductListGoods8"></div>
								</div>
								
							</div>
						</div>
						<div><input id="categoryNum" name="categoryNum" value="${categoryNum.value}"></div>
						
					</div>
				</li>
				
				<li>
					<div>옵션
						<select name="p_option">
							<option id="option1" value="1">1번옵션</option>
							<option id="option2" value="2">2번옵션</option>
							<option id="option3" value="3">3번옵션</option>
						</select>
					</div>
				</li>
				<!-- 카테고리 선택 스크립트 -->
				<%@ include file="/include/ct1.jsp" %> 
				<%@ include file="/include/ct2.jsp" %> 
				<%@ include file="/include/ct3.jsp" %> 
				
				<script>
					$("#1번").val("10");
					$("#2번").val("10");
					
					$("#3번").on({
						click:function(){
							$("#3번").val("10");
							$("#결과").val(1.value + 2.value);
						}
					});
				</script>
<!-- 형섭 END///////////////////////////////////////// -->				
				<li>			
					<input type="submit" value="상품등록">
				</li>
			</ul>
		</div>
		</form>
	</div>
</div>
	
<%@ include file="/include/footer.jsp" %>