<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/content.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<meta charset="UTF-8">
<title>RAINBOW PARK</title>
</head>

 <script>
 	$(document).ready(function(){

     
    //수량
    if($("#cartStock").val()=="")$("#cartStock").val("1");
    
    // 수량증가
    $("#plus").click(function(){
       if(parseInt($("#cartStock").val())<10){
          var count=parseInt($("#cartStock").val())+1;
          $("#cartStock").val(count);
       }
    });
    
    //수량감소
    $("#minus").click(function(){
       if(parseInt($("#cartStock").val())>1){
          var count=parseInt($("#cartStock").val())-1;
          $("#cartStock").val(count);
       }   
    });
 		
    
    // 상품 구매했는지 체크
    $("#writereview").click(function(e){
  		var pNum = $("#pNum").val();
    	
    	$.ajax({
    		url : "/rainbow/shop/product_select/orderCheck",
    		data : "pNum="+pNum,
    		success : function(result){
    			
    			if(result!=0){
    				location.href = "/rainbow/shop/review_write?n="+pNum
    			}else{
    				e.preventDefault();
			         wrapWindowByMask1();
			         $(".window3").show(); 
    			}
    		}
    	});
    });
    
    // 상품 삭제 확인 
    $("#rvDelete").click(function(e){
    	e.preventDefault();
        wrapWindowByMask1();
        $(".window4").show(); 
    });	
    
 		
	  $(".addCart_btn").click(function(e){

		   var pNum = $("#pNum").val();
		   var cartStock = $("#cartStock").val();
		   var pPrice = $("#pPrice").val();
		   
		   var data = {
		     pNum : pNum,
		     cartStock : cartStock,
		     pPrice : pPrice
	    	};
   
	   $.ajax({
		    url : "/rainbow/shop/product_select/addCart",
		    type : "post",
		    data : data,
		    success : function(result){
		    	
		    	if(result==1){
		    		e.preventDefault();
			         wrapWindowByMask1();
			         $(".window").show(); 
				    $("#cartStock").val("1");
		    	}else{
		    		e.preventDefault();
			         wrapWindowByMask1();
			         $(".window2").show(); 
				    $("#cartStock").val("1");
		    	}
		     
		    },
		    error : function(){
		     alert("카트 담기 실패");
	    	}
	   });
	   
	  });
	  
	  
	  $(".rt").click(function(){
			var id=$(this).attr("id");
			var id_name=id.substring(0, id.length-1);
			var num=id.substring(id.length-1, id.length);
			
			$("#rc"+num).fadeToggle();
			$("#rp"+num).fadeToggle();

	   });
		
	
	  
	  
	  //팝업
      function wrapWindowByMask(){
          //화면의 높이와 너비를 구한다.
          var maskHeight = 2000;  
          var maskWidth = 1941;  
          var maskLeft=-450;
          var maskTop=-725;
           
           //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
           $("#mask").css({"width":maskWidth,"height":maskHeight,"left":maskLeft,"top":maskTop}); 
			
           //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
           $("#mask").fadeIn(0);      
           $("#mask").fadeTo("slow",0.6);    
      }
	  
	  
	//팝업
      function wrapWindowByMask1(){
           //화면의 높이와 너비를 구한다.
           var maskHeight = 9000;  
           var maskWidth = 1941;  
          var maskTop=-75;
           
           //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
           $("#mask1").css({"width":maskWidth,"height":maskHeight,"top":maskTop}); 

           //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
           $("#mask1").fadeIn(0);      
           $("#mask1").fadeTo("slow",0.6);    
    
      }
           //닫기 버튼을 눌렀을 때
           $("#close, #close2, #close3, #close4").click(function (e) {  
               //링크 기본동작은 작동하지 않도록 한다.
               $("#mask, #mask1, .window, .window2, .window3, .window4").hide();  
           });     
    
           //검은 막을 눌렀을 때
           $("#mask, #mask1").click(function () {  
               $(this).hide();  
               $(".window, .window2, .window3, .window4").hide();  
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

			<div id="container_box">
				
				<form role="form" method="post">
				 <input type="hidden" id="pNum" name="pNum" value="${product.pNum}" />
				 <input type="hidden" id="pPrice" name="pPrice" value="${product.pPrice}" />
				
				<div class="pd_content">
					 <img src="/rainbow/${product.pImg}" id="imgOne">
					 <ul>
					 	<li><p class="pName">${product.pName}</p></li>
					 	<li><p class="cName"><span>category</span> / ${product.cName}</p></li>
					 	
					 	
					 	<li>
					 		<p class="p_price" id="p_price">
					  			 <fmt:formatNumber pattern="###,###,###" value="${product.pPrice}"/> 원
					  		</p>
					 	 </li>
					 	 
					 	 <li>
					 	 	<div class="box">
							 <input type="number" id="cartStock" name="cartStock" class="inp_quantity" value="1" readonly>
			                 <button type="button" class="btn_g btn_minus" id="minus"><span class="ico_newfriends_v1 ico_minus"><i class="fas fa-minus"></i></span></button>
			                 <button type="button" class="btn_g btn_plus" id="plus"><span class="ico_newfriends_v1 ico_plus" ><i class="fas fa-plus"></i></span></button>
							</div>
					 	 </li>
					 	 <li>
					 	 	<p class="addToCart">
							   <button type="button" class="addCart_btn">ADD TO CART</button>
							</p>
					 	 </li>
					 	 
					 </ul>

					  
				</div>
					 
					 <div class="pContent">${product.pContent}</div>
				</form>		
				
				<!-- 리뷰 -->
				<h5>REVIEW</h5>
				<div id="reviewDiv">
					<button type="button" id="writereview">WRITE</button>
	
					<table>
						 <thead>
						  <tr>
						   <th>NO</th>
						   <th>TITLE</th>
						   <th>WRITER</th>
						   <th>DATE</th>
						   <th></th>
						  </tr>
						 </thead>
						 <c:forEach items="${list}" var="list" varStatus="status">
						 <tbody>
							  
								  <tr>
									  <td>${list.rNum}</td>
									   <td>
									   		<p class="rt" id="rt${status.index}">${list.rTitle }</p>
									   </td>
									   <td>${list.userName}</td>
									   <td>
									   		<fmt:formatDate value="${list.rDate}" pattern="yyyy-MM-dd"/>
									   </td>
									   
									   <td>
									   <c:if test="${list.userId ==  member.userId}">
									   		<span><a href="/rainbow/shop/review_edit?n=${list.rNum }">edit</a></span>
									   		<button type="button" id="rvDelete">delete</button>
									   		<div id="wrap"> 
												<div id="container">  
													<div id="mask1"></div>
														<div class="window4">
														<div class="cartBox">
														    <p class="desc_layer">리뷰를 삭제하시겠습니까?</p>
														</div>
														<button type="button" id="close4" style="border: 1px solid gray;">취소</button>
														<button type="button" class="btn_check" onclick = "location.href = '/rainbow/shop/review_delete?n=${list.rNum }' ">삭제</button>
													</div>
												</div>
											</div>
													
									   </c:if>
									   </td>
								  </tr>   
								  <tr class="rc" id="rc${status.index}"  >
								  
								  		<th></th>
								  		<th colspan="6">
								  		${list.rContent } <br/>
								  		<c:if test="${list.rImg != 'null'}">
								  			<img src="/rainbow/${list.rImg }">
								  		</c:if>
								  		</th>
								  </tr>
								  <tr class="rp" id="rp${status.index}" >
								  
								  		<th><input type="hidden" name="rNum" class="rNum" id="rNum${status.index}" value="${list.rNum }"></th>
								  		<th>
									  		<div id="reply">
									  			
												 <section class="replyList">
													  <ol>
													   <c:forEach items="${reply}" var="reply">
													   		<c:if test="${reply.rNum == list.rNum }">
													   		<li>
													   			<div class="userInfo">
													   				<ul>
													   					<li class="uname"><p>${reply.userName }</p></li>
													   					<li class="rcon"><p>${reply.rpContent }</p></li>
													   					<li class="date"><p><fmt:formatDate value="${reply.rpDate}" pattern="yyyy-MM-dd" /></p> </li>
													   				</ul>
													   			</div>
													   			
													   		</li>
													   		</c:if>
													   </c:forEach>
													   
													   </ol>    
												</section> 
												<div class="rpForm">
													<c:if test="${member == null }">
										  				<p><a href="/member/login">댓글은 로그인</a> 후 이용 가능합니다.</p>
										  			</c:if>
										  			<c:if test="${member != null }">
										  				<section class="replyForm">
														  <form role="form" method="post" autocomplete="off">
														  		<input type="hidden" name="pNum" value="${list.pNum }">
														  		<input type="hidden" name="rNum" value="${list.rNum }">
																<textarea name="rpContent" id="rpContent"></textarea>
																<button type="submit" id="rp_btn">submit</button>
														  </form>
														 </section>
													</c:if>
												</div>
												
												
									  		</div>
								  		</th>
								  </tr>
								 </tbody>
							  </c:forEach>

					</table> 
				</div>
				
				<!-- 팝업 -->
				<div id="wrap"> 
					<div id="container">  
						<div id="mask1"></div>
							<div class="window">
							<div class="cartBox">
							    <p class="desc_layer">장바구니로 이동하시겠습니까?</p>
							</div>
							<button type="button" id="close" style="border: 1px solid gray;">취소</button>
							<button type="button" class="btn_check" onclick = "location.href = '/rainbow/shop/cartList' ">확인</button>
							</div>
							<div class="window2">
							<div class="cartBox">
							    <p class="desc_layer">로그인 후 이용해주세요.</p>
							</div>
							<button type="button" id="close2" style="border: 1px solid gray;">취소</button>
							<button type="button" class="btn_check" onclick = "location.href = '/rainbow/member/login' ">로그인</button>
							</div>
							<div class="window3">
							<div class="cartBox">
							    <p class="desc_layer">구매 후 이용해주세요.</p>
							</div>
							<button type="button" id="close3" style="border: 1px solid gray;">취소</button>
							<button type="button" class="btn_check" onclick = "location.href = '/rainbow/member/login' ">로그인</button>
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