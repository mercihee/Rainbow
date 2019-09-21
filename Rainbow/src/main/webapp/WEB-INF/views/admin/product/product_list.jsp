<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/admin.css">
<script src="/rainbow/resources/bootstrap/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>RAINBOW PARK</title>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>

		<section id="container">
			<h3>상품 목록</h3>
			<div id="container_box">
				<table>
					 <thead>
					  <tr>
					   <th>번호</th>
					   <th>사진</th>
					   <th>이름</th>
					   <th>카테고리</th>
					   <th>가격</th>
					   <th>수량</th>
					   <th>등록날짜</th>
					  </tr>
					 </thead>
					 <tbody>
					  <c:forEach items="${list}" var="list">
					  <tr>
					  	<td>${list.pNum }</td>
					  	<td><a href="/rainbow/admin/product/product_select?n=${list.pNum}"><img src="/rainbow/${list.pImg2 }" style="width: 100px; height: auto;"></a></td>
					   <td>
					   		<a href="/rainbow/admin/product/product_select?n=${list.pNum}">${list.pName}</a>
					   </td>
					   <td>${list.cCode}</td>
					   <td>
					   		<fmt:formatNumber value="${list.pPrice}" pattern="###,###,###"/>
					   	</td>
					   <td>${list.pStock}</td>
					   
					   <td>
					   		<fmt:formatDate value="${list.pDate}" pattern="yyyy-MM-dd"/>
					   </td>
					  </tr>   
					  </c:forEach>
					 </tbody>
					</table>
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