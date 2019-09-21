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
					 <h3>'${sname}'을 검색한 결과입니다.</h3>
					 <h3>${text }</h3>
					<ul id="listUl">
						 <c:forEach items="${list}" var="list">
						
							 <li>
								  <div class="productOne">
									   <span><a href="/rainbow/shop/product_select?n=${list.pNum}"><img src="/rainbow/${list.pImg2}" id="imgSize"></a></span>
									   <span class="productPname"><a href="/rainbow/shop/product_select?n=${list.pNum}">${list.pName }</a></span>
										<span><fmt:formatNumber value="${list.pPrice}" pattern="###,###,###"/>원</span>
								  </div> 
							 </li>
						 </c:forEach>
					</ul>
				
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
