<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>RAINBOW PARK</title>
</head>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/content.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script>

	$(document).ready(function(){
		
		
		// 상품 삭제 
		$(".seldel").click(function(){
			var id=$(this).attr("id");
			var num=id.substring(id.length-1, id.length);
			var cartNum = $("#seldel"+num).val();
			
			$.ajax({
				url:"/shop/oneDelete",
				data:"cartNum="+cartNum,
				success:function(result){
					
					if(result==1){
						location.reload();	// 수량 변경이 되면 총결제금액 부분만 reload
					}else{
						alert("error");s
					}
					
				}
				
			});
			
		});
		
		//수량 증가,감소 버튼
		$("button").click(function(){
			var id=$(this).attr("id");
			var id_name=id.substring(0, id.length-1);
			var num=id.substring(id.length-1, id.length);
			var num2=$("#cartCount"+num).val();

			if(id_name=="plus"){
				if(num2<10){
					num2++;
					$("#cartCount"+num).val(num2);
				}
			}else if(id_name=="minus"){
				if(num2>1){
					num2--;
					$("#cartCount"+num).val(num2);
				}
			}
		});
		
		//수량 변경
		$(".btn_change").click(function(){
			var cartNum = $(this).val();
			var id=$(this).attr("id");
			var num=id.substring(id.length-1, id.length);
			var cartStock = $("#cartCount"+num).val();
			
			var data = {
				cartNum : cartNum,
				cartStock : cartStock
			};
			
				$.ajax({
					url:"/shop/editStock",
					data:data,
					success:function(result){
						
						if(result==1){
							location.reload();	// 수량 변경이 되면 총결제금액 부분만 reload
						}else{
							alert("error");
						}
						
					}
					
				});
		});
	
	});
		 
		 
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>

		<section id="container">
			
			<div id="container_b">
				
				<section id="content">
				
					
		<div id="header" style="margin-top:125px">
			<div class="cart_image">
				<h2>주문 상품</h2> 
			</div>
			
			<div class="cart_index">

						<div id="cart_all">
						<c:forEach var="list" items="${list }" varStatus="status">
						
							<div class="desc_cart1">
							<ul class="cart_list1">
								<li class="check_on">
									<label class="container" style="left: -20px;">
										<button type="button" id="seldel${status.index}" class="seldel" value="${list.cartNum}">삭제</button>
										<span class="checkmark"></span>
									</label>
								</li>
								<li>
									<a href="/shop/product_select?n=${list.pNum}"><img src="${list.pImg2 }" class="list_img"></a>
								</li>	
								<ul class="ul2">
									<li style="margin: 8px 0px 3px 0px;">
										<strong class="tit_product"><a href="/shop/product_select?n=${list.pNum}" style="color:black">${list.pName}</a></strong>
									</li>
									<li style="margin-bottom: 5px;">	
												<em class="tit_append">금액 :</em> 
													<span class="desc_append">
														<span class="screen_out"></span>
														<input type="hidden" class="hidden_price" value="${list.pPrice}">
														<span class="current_price">${list.one_price}원</span>
													</span>
									</li>			
										
									<li>
										<div class="box_quantity">
											<label class="screen_out"></label>
													<input type="number" id="cartCount${status.index}" class="cartCount" name="prEas" value="${list.cartStock}" readonly>
													<button type="button" class="btn_minus" id="minus${status.index}"><span class="ico_minus"><i class="fas fa-minus"></i></span></button>
													<button type="button" class="btn_plus" id="plus${status.index}"><span class="ico_plus" ><i class="fas fa-plus"></i></span></button>
													<button type="button" class="btn_change" id="countUpdate${status.index}" value="${list.cartNum}"><span class="txt_g">변경</span></button>
													
										</div>
									</li>
								</ul>
							</ul>
							</div>
						
					</c:forEach>
					
						<div class="cart_price1">
							<dl class="list_price">
								<dt>장바구니 합계 :</dt>
								<dd>
									<span id="cart_allPrice"><fmt:formatNumber value="${cartPrice}" pattern="###,###,###"/></span> 원
								</dd>
								<dt>배송비 :</dt>
								<dd>
									<span id="ship_price"><fmt:formatNumber value="${ship}" pattern="###,###,###"/></span> 원
								</dd>
				
							</dl>
							<dl class="all_price">
								<dt>총 결제금액</dt>
								<dd>
									<strong><span id="total_price"><fmt:formatNumber value="${allPrice}" pattern="###,###,###"/></span> 원</strong>
								</dd>
							</dl>
						</div>

					</div>

			</div>
			
			
		</div>


				</section> 
				

				<div class="orderInfo" style="width: 600px; margin: auto;">
					 <form role="form" method="post" autocomplete="off" id="orderInfo">
					    
					  <input type="hidden" name="amount" value="${allPrice }" />
					  <ul>
					  
					  		<li>
					  			<div class="inputArea">
								   <label for="">수령인</label>
								   <input type="text" name="orderRec" id="orderRec" required="required" />
								  </div>
					  		</li>
					  		
						  	<li>
						  		<div class="inputArea">
								   <label for="orderPhon">수령인 연락처</label>
								   <input type="text" name="orderPhone" id="orderPhone" required="required" />
								  </div>
						  	</li>

						  	
						  	<li>
						  		<div class="inputArea">
									<input type="text" id="sample6_postcode" placeholder="우편번호">
									<input type="button" id="postnum" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" name="userAddr1" id="sample6_address" placeholder="주소"><br>
									<input type="text" name="userAddr2" id="sample6_detailAddress" placeholder="상세주소">
									<input type="text" name="userAddr3" id="sample6_extraAddress" placeholder="참고항목">
						  		</div>
						  	</li>
						  	
						  	
						  	<li>
						  		<div class="inputArea">
								   <button type="submit" class="order_btn">주문</button>
								   <button type="button" class="cancel_btn">취소</button> 
								  </div>
						  	</li>

					  </ul>
					 </form> 
				</div>
	
				</div>
		</section>
		
		<footer id="footer">
			<div id="footer">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	
	</div>

</body>
</html>
