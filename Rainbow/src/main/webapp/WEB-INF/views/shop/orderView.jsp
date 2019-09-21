<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>RAINBOW PARK</title>
</head>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/shop.css">
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>

		<section id="container">
			
			<div id="container_box">
				<section id="content">

				 <div class="orderInfo">
				 	<h3>주문 내역</h3>
					  <c:forEach items="${orderView}" var="orderView" varStatus="status">
					   
					   <c:if test="${status.first}">
							    <p><span>수령인 - </span>${orderView.orderRec}</p>
							    <p><span>주소 - </span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
							    <p><span>총 결제 금액 - </span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
					   		
					   </c:if>
					   
					  </c:forEach>
				
					 
					 <ul class="orderView">
						  <c:forEach items="${orderView}" var="orderView">     
						  	<li>
							   <div class="thumb">
							    	<a href="/rainbow/shop/product_select?n=${orderView.pNum }"><img src="/rainbow/${orderView.pImg2}" /></a>
							   </div>
							</li>
							<li>상품명 : ${orderView.pName}</li>
							<li>가격 : <fmt:formatNumber pattern="###,###,###" value="${orderView.pPrice}" /> 원</li>
							<li>수량 : ${orderView.cartStock} 개</li>
							<li>총 가격 : <fmt:formatNumber pattern="###,###,###" value="${orderView.pPrice * orderView.cartStock}" /> 원 </li>                  
							
						  </c:forEach>
					 </ul>
					 
					 </div>
				</section>
				 
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
