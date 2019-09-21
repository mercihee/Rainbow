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
					   <th>제목</th>
					   <th>내용</th>
					   <th>작성자</th>
					   <th>작성 날짜</th>
					  </tr>
					 </thead>
					 <tbody>
					  <c:forEach items="${list}" var="list">
					  <tr>
					  	<td>${list.rNum }</td>
					  	<td><a href="/rainbow/admin/product/review_select?n=${list.rNum }">${list.rTitle }</a></td>
					   <td>${list.rContent}</td>
					   <td>${list.userId}</td>
					   <td>
					   		<fmt:formatDate value="${list.rDate}" pattern="yyyy-MM-dd"/>
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