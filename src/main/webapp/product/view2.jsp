<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>


		<div id="product">
			<div class="productWrap">
				<a href="/">홈</a> > <a href="">필수가전</a> > <a href="">TV/냉장고/세탁기/건조기</a> > <a href="">TV/영상가전</a> > <a href="">TV</a>
				<div class="detailHeader">
					<p class="brandName">
						<h3><a href="#">${p.company }</a></h3>
					</p>
					<p class="prdTitle">
						<h1>${p.title }</h1>
					</p>
				</div>

				<div class="prdLeftSec">
					<div class="prdViewImg">
						<img id="big" src="/upload/${p.pimg }" class="prdViewImg">
					</div>
					<div class="thumbnailView">
						<ul style="width: 450px; left: 0px;">
							<li><img class="small" src="/upload/${p.pimg }" onerror="this.style.display='none'"></li>
							<li><img class="small" src="/upload/${p.pimg1 }" onerror="this.style.display='none'"></li>
							<li><img class="small" src="/upload/${p.pimg2 }" onerror="this.style.display='none'"></li>
							<li><img class="small" src="/upload/${p.pimg3 }" onerror="this.style.display='none'"></li>
							<li><img class="small" src="/upload/${p.pimg4 }" onerror="this.style.display='none'"></li>
						</ul>
					</div>
					<script>
						var bigPic = document.querySelector('#big');
						var smallPics = document.querySelectorAll('.small');
						
						console.log("Element :", bigPic);
						console.log("Element :", smallPics);
						
						for(var i=0; i<smallPics.length; i++) {
							smallPics[i].onclick = showIMG;		//이벤트 처리
						}

						function showIMG() {
							var newIMG = this.src;
							bigPic.setAttribute('src', newIMG);
							//또는 big.src = newIMG;
						}
					</script>
				</div>
				<div class="prdRightSec">
					<ul>
						<li class="modelCode">
							<dl class="modelName">
								<dt>모델명</dt>
								<dd>${p.p_name }</dd>
							</dl>
						</li>
						<li class="priceArea">
							<dl>
								<dt style="font-size: 15px; margin-top: -2px;">정상가</dt>
								<dd>
									<h2 class="price1"><fmt:formatNumber value="${p.price }" pattern="#,###" /> 원</h2>
								</dd>
								<dt style="font-size: 15px; color:red;">회원판매가</dt>
								<dd>
									<h2 class="price2"><fmt:formatNumber value="${p.price *0.95}" pattern="#,###" /> 원</h2>
								</dd>
							</dl>
						</li>
						<li class="delvArea">
							<dl>
								<dt>배송방법</dt>
								<dd>업체배송</dd>
								<dt><br></dt>
								<dd>무료배송</dd>
								<dt><br></dt>
								<dd>※ 택배로 배송되는 경우, 코로나19 예방 / 고객 안전 위해 가급적 비대면 배송 진행</dd>
								<dt><br></dt>
								<dd>※ 지역 및 상품에 따라 추가 배송비가 발생할 수 있습니다.</dd>
								<dt><br></dt>
								<dd>※ 도서/산간(제주 포함)의 경우 추가 배송비가 발생하거나 물류 사정에 따라 배송이 불가할 수 있습니다.</dd>
							</dl>
						</li>
						<li class="optionChoiceSel">
							<span>
								<dl>
									<dt>상품선택</dt>
									<dd>
										<select class="viewOpt">
											<option class="viewOpt">상품을 선택 해 주세요.</option>
											<option class="viewOpt">${p.p_option }</option>
											<option class="viewOpt">${p.p_option }</option>
											<option class="viewOpt">${p.p_option }</option>
											<option class="viewOpt">${p.p_option }</option>
										</select>
									</dd>
								</dl>
							</span>
						</li>
					</ul>
					<div class="qtyArea">
					
					<!-- /////////////////////////////////////수량 유효성검사////////////////////////////////// -->
						<script>
							$(document).ready(function(){
							    $('.count_range input[count_range]').click(function(e){
							        e.preventDefault();
							        var type = $(this).attr('count_range'); //m, p
							        var count = parseInt($('#count').val());
							        var totalPrice = 0;
							        //var $count = $(this).parent().children('input.count');
							        //var count_val = $count.val(); // min 1
							        if(type=='m'){
							            if(count==1){
							            	alert("최소 주문수량은 1개입니다.");
							            	document.getElementById("count").value = 1;
							            	totalPrice = ${p.price * 0.95};
								            totalPrice = totalPrice.toLocaleString();
							            	document.getElementById("totalPrice").innerHTML = totalPrice + " 원";
							                return;
							            }else{
							            	count -= 1;
								            document.getElementById("count").value = count;
								            totalPrice = count * ${p.price * 0.95};
								            totalPrice = totalPrice.toLocaleString();
							            	document.getElementById("totalPrice").innerHTML = totalPrice + " 원";
							            }
							        }else if(type=='p'){
							            count += 1;
							            document.getElementById("count").value = count;
							            totalPrice = count * ${p.price * 0.95};
							            totalPrice = totalPrice.toLocaleString();
						            	document.getElementById("totalPrice").innerHTML = totalPrice + " 원";
							        }
							    });
							});
						</script>
						<dl>
							<dt>수량</dt>
							<dd>
								<div class="count_range">
									<input value="-" count_range="m" type="button" class="qtyDown">
									<input class="count" name="count" id="count" value="1" readonly>
									<input value="+" count_range="p" type="button" class="qtyUp">
								</div>
							</dd>
						</dl>
					</div>
					<div class="totalPriceArea">
						<dl>
							<dt>총 합계금액</dt>

							<dd id="totalPrice"><fmt:formatNumber value="${p.price *0.95}" pattern="#,###" /> 원</dd>
						</dl>
					</div>
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
					<div class="viewBtnArea">
						<div>
							<a href=""><input type="button" value="바로구매" class="btnView1"></a>
							<form id="id" action="/product/ProductJang" method="post">
								<input name="uid" type="hidden" value="${p.p_uid }">
								<a href="productJang.jsp?totalPrice=${totalPrice}"><input type="button" value="장바구니" class="btnView2"></a>
							</form>
							<a href="#"><input type="button" value="찜♡" class="btnView3"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	
<%@ include file="/include/footer.jsp" %>