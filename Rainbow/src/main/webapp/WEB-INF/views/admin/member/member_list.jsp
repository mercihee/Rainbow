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
<script>
	$(document).ready(function(){

		 //페이징처리
		 var pager = jQuery('#ampaginationsm').pagination({
            maxSize: 10,               
            totals: '${dbCount}',   
            page: '${page}',           
            pageSize: 5,       
     
            lastText: '&raquo;&raquo;',         
            firstText: '&laquo;&laquo;',       
            prevText: '&laquo;',       
            nextText: '&raquo;',
            btnSize:'sm'           
        });
		 
        jQuery('#ampaginationsm').on('am.pagination.change',function(e){
	        jQuery('.showlabelsm').text('The selected page no: '+e.page);
	        $(location).attr('href', "http://localhost:9000/rainbow/admin/member/member_list?rpage="+e.page);         
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
			<h3>상품 목록</h3>
			<div id="container_box">
				<table>
					 <thead>
					  <tr>
					   <th>아이디</th>
					   <th>닉네임</th>
					   <th>번호</th>
					   <th>가입 날짜</th>
					  </tr>
					 </thead>
					 <tbody>
					  <c:forEach items="${list}" var="list">
					  <tr>
					  	
					  	<td><a href="/rainbow/admin/member/member_select?n=${list.userId}">${list.userId}</a></td>
					   <td>
					   		<a href="/rainbow/admin/member/member_select?n=${list.userId}">${list.userName}</a>
					   </td>
					   <td>${list.userPhone}</td>
					   <td>
					   		<fmt:formatDate value="${list.joinDate}" pattern="yyyy-MM-dd"/>
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