<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/rainbow/resources/images/rainbow.png">
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/admin.css">
<meta charset="UTF-8">
<title>RAINBOW PARK</title>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
</head>

<body>
	<div id="kHead">
		<div class="title" id="rainLogo">
			<h1><a href="/" >RAINBOW PARK</a></h1>
		</div>
			
			
			<div id="right_icon">
							
				<c:if test="${member == null}">
					 <span><a href="/rainbow/member/login">LOGIN</a></span>
					 <span><a href="/rainbow/member/signup">JOIN</a></span>
				</c:if>
				
					<c:if test="${member != null}">
						<span id="welcome"> <p>${member.userName}</p> 님 환영합니다. </span>
						
						 <li id="lout">
					 	 	<a href="/rainbow/member/logout">LOGOUT</a>
						 </li>
					 </c:if>

					<c:if test="${member.rainAdmin == 1 }">
						<li><a href="/rainbow/admin/index">ADMIN</a></li>
					</c:if>
					<c:if test="${member.rainAdmin == 0 }">
						<li>
						 	<a href="/rainbow/shop/cartList">CART</a>
						 </li>
						
					</c:if>	

			</div>
			
			<div id="sideMenu">
				<ul>
					<li class="adminHome" style="margin-bottom: 25px;"><a href="/rainbow/admin/index">관리자 홈</a></li>
					<li><a href="/rainbow/admin/product/product_insert">상품 등록</a></li>
					<li><a href="/rainbow/admin/product/product_list">상품 목록</a></li>
					<li><a href="/rainbow/admin/product/product_review">상품 후기</a></li>
					<li><a href="/rainbow/admin/member/member_list">회원 목록</a></li>
				</ul>
				
			</div>
			
		</div>
		
		
		
</body>
</html>