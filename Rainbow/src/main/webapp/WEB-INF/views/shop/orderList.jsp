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
 
 					<div><h3>주문 목록</h3>
						 <c:forEach items="${orderList}" var="orderList">
							<ul class="orderList">
								<li>주문번호 - <a href="/rainbow/shop/orderView?n=${orderList.orderId}"> ${orderList.orderId}</a></li>
								<li>수령인 - ${orderList.orderRec}</li>
								<li>주소 - (${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3} </li>
								<li>가격 - <fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</li>
							</ul>
						</c:forEach>
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
