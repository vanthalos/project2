<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>


		<div id="product">
			<div class="productWrap">
				홈 > 필수가전 > TV/냉장고/세탁기/건조기 > TV/영상가전 > TV
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
								<dt>판매가</dt>
								<dd><fmt:formatNumber value="${p.price }" pattern="#,###" /> 원</dd>
							</dl>
						</li>
						<li class="delvArea">
							<dl>
								<dt>배송방법</dt>
								<dd>업체배송<br><br><br>
									무료배송<br><br><br>
									※ 택배로 배송되는 경우, 코로나19 예방 / 고객 안전 위해 가급적 비대면 배송 진행<br><br>
									※ 지역 및 상품에 따라 추가 배송비가 발생할 수 있습니다.<br><br>
									※ 도서/산간(제주 포함)의 경우 추가 배송비가 발생하거나 물류 사정에 따라 배송이 불가할 수 있습니다.
								</dd>
							</dl>
						</li>
						<li class="optionChoiceSel">
							<span>
								<dl>
									<dt>상품선택</dt>
									<dd>
										<select class="viewOpt">
											<option class="viewOpt">상품을 선택 해 주세요.</option>
											<option class="viewOpt">${p.p_option }1</option>
											<option class="viewOpt">${p.p_option }2</option>
											<option class="viewOpt">${p.p_option }3</option>
											<option class="viewOpt">${p.p_option }4</option>
										</select>
									</dd>
								</dl>
							</span>
						</li>
					</ul>
					<div class="viewBtnArea">
						<div>
							<a href="#"><input type="button" value="바로구매" class="btnView1"></a>
							<a href="#"><input type="button" value="장바구니" class="btnView2"></a>
							<a href="#"><input type="button" value="찜♡" class="btnView3"></a>
						</div>
					</div>
				<div>
					
				</div>
				</div>
			</div>
		</div>
		
		
	
<%@ include file="/include/footer.jsp" %>