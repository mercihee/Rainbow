<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/rainbow/resources/images/rainbow.png">
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/header.css">
<meta charset="UTF-8">
<title>RAINBOW PARK</title>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>

<body>
	<div id="kHead">
						
		<div class="title" id="rainLogo">
			<h1><a href="/rainbow" >RAINBOW PARK</a></h1>
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
			
			
			<div id="rainList">
			
				<div class="list_drop5">
					<ul>
						<li><a href="/rainbow/shop/listAll" id="category">ALL</a>	</li>
					</ul>
				</div>
				
				<div class="list_drop1">
					<ul>
						<li><a href="/rainbow/shop/list?c=100&l=1" id="category">리빙</a>
							<ul class=".cmenu">
								<li><a href="/rainbow/shop/list?c=101&l=2">컵</a></li>
								<li><a href="/rainbow/shop/list?c=102&l=2">텀블러</a></li>
							</ul>
						</li>
					</ul>
				</div>
						
						
						<div class="list_drop2">
							<ul>
								<li><a href="/rainbow/shop/list?c=200&l=1" id="category">잡화</a>
									<ul class=".cmenu">
										<li><a href="/rainbow/shop/list?c=201&l=2">가방</a></li>
										<li><a href="/rainbow/shop/list?c=202&l=2">우산</a></li>
									</ul>
								</li>
							</ul>
						</div>
					  
					  <div class="list_drop3">
							<ul>
								<li><a href="/rainbow/shop/list?c=300&l=1" id="category">계절</a>
									<ul class=".cmenu">
										<li><a href="/rainbow/shop/list?c=301&l=2">봄</a></li>
										<li><a href="/rainbow/shop/list?c=302&l=2">여름</a></li>
										<li><a href="/rainbow/shop/list?c=303&l=2">가을</a></li>
										<li><a href="/rainbow/shop/list?c=304&l=2">겨울</a></li>
									</ul>
								</li>
							</ul>
						</div>
					  
						<form name="searchform" role="form" action="/rainbow/shop/search" method="post"  autocomplete="off">
							<div class="list_drop4">
								<ul>
									<li style="margin-left: 40px;">
										<input type="text" id="pName" name="pName">
									</li>
									<li style="margin-top: 8px;">
										<button type="submit" id="goSearch">search</button>
									</li>
								</ul>
							</div>
						</form>
						
						
						
			</div> <!--  카테고리 리스트 -->
			
			
			
			
		</div>
		
</body>
</html>