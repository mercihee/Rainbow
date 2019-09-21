<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/login.css">
<title>RAINBOW PARK</title>
</head>
<body>
	
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	
	
	<section id="content">
	
	
		 <form role="form" method="post" action="/rainbow/member/findIdPro" autocomplete="off" id="form">
		 <span class="logSpan"><img src="/rainbow/resources/images/rainbow.png">RAINBOW PARK</span>
		 	<ul>
		 	
		 		<li>
		 			<p> 아이디 찾기 </p>
		 		</li>
		 		<li>
		 			<div class="input_area">
					   	<label for="userName" class="label2"></label>
					   	<input type="text" id="userName" name="userName" required="required" placeholder="닉네임"/>      
					 </div>
		 		</li>
		 		<li>
		 			<div class="input_area">
					  	<label for="userName" class="label2"></label>
					   	<input type="text" id="userPhone" name="userPhone" required="required" placeholder="연락처" />      
					 </div>
		 		</li>
				 <li>
		 			<button type="submit" id="findId" name="findId">아이디 찾기</button>
		 		</li> 
					
				<c:if test="${msg1 == false}">
				   	<p style="color:#f00; font-size:9px;">아이디를 확인해주세요.</p>
				  </c:if>
				  <c:if test="${msg == false}">
				   	<p style="color:#f00; font-size:9px;">비밀번호를 확인해주세요.</p>
				  </c:if>
				  
		  	</ul>
		 </form>   
	</section>

</body>
</html>