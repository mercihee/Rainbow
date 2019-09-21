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
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>

<body>
	
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<section id="content">
	
	
		 <form role="form" method="post" autocomplete="off" id="form">
		 <span class="logSpan"><img src="/rainbow/resources/images/rainbow.png">RAINBOW PARK</span>
		 	<ul>
		 		<li>
		 			<p> 비밀번호 찾기 </p>
		 		</li>

		 		<li>
		 			<div class="input_area">
					   	<label for="userId" class="label2"></label>
					   	<input type="email" id="userId" name="userId" required="required" placeholder="이메일을 입력해주세요."/>      
					 </div>
		 		</li>
		 		<li>
		 			<span>${text }</span>
		 		</li>
				 <li>
		 			<button type="submit" id="findPass" name="findPass">비밀번호 찾기</button>
		 		</li> 


		  	</ul>
		 </form>   
	</section>

</body>
</html>