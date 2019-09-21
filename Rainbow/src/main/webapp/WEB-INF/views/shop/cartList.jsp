<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>RAINBOW PARK</title>
</head>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/content.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script>

	$(document).ready(function(){
		
		//체크박스 선택
        $("#checkAll").click(function(i){
        	
        	if($("#checkAll").is(":checked")){	// 전체선택 체크시 리스트 전체체크
        		$("input[type=checkbox]").prop("checked",true);
        	}else{
        		$("input[type=checkbox]").prop("checked",false);	// 전체선택 해제
        	}
        });
        
		//제품 체크박스 선택
        $("[name=checkCart]").click(function(){
        	$("#checkAll").prop("checked",false);	// 전체선택이 돼있을시 리스트 체크박스 하나라도 해제시 전체선택도 해제
        });
		
		
        $("#checkDelete").click(function(e){
  		  e.preventDefault();
  	         wrapWindowByMask1();   // 장바구니담기 버튼 클릭시 팝업이 뜬 후에 장바구니에 담김
  	         $(".window").show();
        });
		
		
		//체크박스 삭제 버튼
		$(".btn_check").click(function(){
			$("#mask, #mask1, .window").hide(); 
            

			var chkList=new Array();	// 삭제버튼 누를시 체크박스 데이터 넘어가는 배열 객체 생성
			
			$("input[type=checkbox]:checked").each(function(i){	// 확장for문으로 돌면서 체크 돼있는 value를 chkList에 담음
				if($("#checkAll").is(":checked")){	// 전체체크가 돼있으면 i-1해서 check on값을 지움
					chkList[i-1]=$(this).val();
				}else{
					chkList[i]=$(this).val();
				}
			});
		
			var chkName="";
			$.each(chkList,function(i){
				chkName=chkName+"chkName="+chkList[i]+"&";	// chkName에 체크된 chkList 값을 넣고 cartSeleteDelte로 보냄
			}); 
			
			$.ajax({
			    url : "/rainbow/shop/cartSelectDelete",
			    type : "post",
			    data : chkName,
			    success : function(result){
			    	
			    	if(result==1){
			    		location.reload();
			    	}else{
			    		alert("삭제 실패 ");
			    	}
			     
			    }
			});
		});
		
		//선택 주문 
		$("#selectBuy").click(function(){
			
		
			var chkList=new Array();	// 구매 버튼 누를시 체크박스 데이터 넘어가는 배열 객체 생성
				
			$("input[type=checkbox]:checked").each(function(i){	// 확장for문으로 돌면서 체크 돼있는 value를 chkList에 담음
				if($("#checkAll").is(":checked")){	// 전체체크가 돼있으면 i-1해서 check on값을 지움
					chkList[i-1]=$(this).val();
				}else{
					chkList[i]=$(this).val();
				}
			});
			
			var chkName="";
			$.each(chkList,function(i){
				chkName=chkName+"chkName="+chkList[i]+"&";	// chkName에 체크된 chkList 값을 넣고 cartSeleteDelte로 보냄
			}); 

			if(chkName == ""){	// 선택한 상품이 없을시
				alert("구매할 상품을 선택해주세요.");
			}else{
				location.href = "/rainbow/shop/selectBuy?"+chkName;	// 선택한 상품이 있을시 주문 페이지로 이동
			}

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
					url:"/rainbow/shop/editStock",
					type : "post",
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
		
		
		//팝업
	      function wrapWindowByMask1(){
	           //화면의 높이와 너비를 구한다.
	           var maskHeight = 9000;  
	           var maskWidth = 1941;  
	          var maskLeft=-450;
	          var maskTop=-75;
	           
	           //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	           $("#mask1").css({"width":maskWidth,"height":maskHeight,"left":maskLeft,"top":maskTop}); 

	           //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
	           $("#mask1").fadeIn(0);      
	           $("#mask1").fadeTo("slow",0.6);    
	    
	      }
	           //닫기 버튼을 눌렀을 때
	           $("#close").click(function (e) {  
	               //링크 기본동작은 작동하지 않도록 한다.
	               $("#mask, #mask1, .window").hide();  
	           });     
	    
	           //검은 막을 눌렀을 때
	           $("#mask, #mask1").click(function () {  
	               $(this).hide();  
	               $(".window").hide();  
	           });   
	
	});
		 
		 
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
				<h3>SHOPPING CART</h3> 
				<p class="chd"> 총 <span style="color:black; font-weight: bold">${dbCount} 개</span> 의 상품이 담겨있습니다.</p>
			</div>
			
			<div class="cart_index">
				<c:choose>
					<c:when test="${dbCount!=0 }">
						<label class="container" id="checkcontainer">전체 선택
							<input type="checkbox" id="checkAll" checked>
							<span class="checkmark"></span>
						</label>
						
						<button type="button" id="checkDelete">선택 삭제하기</button>
						<div id="cart_all">
						<c:forEach var="list" items="${list }" varStatus="status">
						
							<div class="desc_cart">
							<ul class="cart_list">
								<li class="check_on">
									<label class="container" style="left: -20px;">
										<input type="checkbox" name="checkCart" id="checkCart" value="${list.cartNum}" style="left:-6px;" checked>
										<span class="checkmark"></span>
									</label>
								</li>
								<li>
									<a href="/shop/product_select?n=${list.pNum}"><img src="/rainbow/${list.pImg2 }" class="list_img"></a>
								</li>	
								
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
							</div>
						
					</c:forEach>
					
						<div class="cart_price">
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

						
						<div class="buy_btn">
							<a href="/shop/listAll" class="btn_continue">
								<span class="txt_g">쇼핑 계속하기</span>
							</a>
							
								<button type="button" id="selectBuy">
									선택 구매하기
								</button>
						</div>
					</div>
					
					</c:when>
					
				</c:choose>
			</div>
			
			
		</div>


				</section> 
				
				<!-- 팝업 -->
				<div id="wrap"> 
					<div id="container">  
						<div id="mask1"></div>
							<div class="window">
							<div class="cartBox">
							    <p class="desc_layer">선택한 상품을 삭제하시겠습니까?</p>
							</div>
							<button type="button" id="close" style="border: 1px solid gray;">취소</button>
							<button type="button" class="btn_check">확인</button>
							</div>
					</div>
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
