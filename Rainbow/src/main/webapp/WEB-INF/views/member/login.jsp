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
	
	
		 <form role="form" method="post" autocomplete="off" id="form">
		 <span class="logSpan"><img src="/rainbow/resources/images/rainbow.png">RAINBOW PARK</span>
		 	<ul>
		 		<li>
		 			<div class="input_area">
					   	<label for="userId" class="label2"></label>
					   	<input type="email" id="userId" name="userId" required="required" placeholder="이메일"/>      
					 </div>
		 		</li>
		 		<li>
		 			<div class="input_area">
					  	<label for="userPass" class="label2"></label>
					   	<input type="password" id="userPass" name="userPass" required="required" placeholder="비밀번호" />      
					 </div>
		 		</li>
				 <li>
		 			<button type="submit" id="login_btn" name="login_btn">LOGIN</button>
		 		</li> 
		 		<li>
		 			<button type="button" id="findId" name="findId" onclick = "location.href = '/rainbow/member/findId' ">아이디 찾기</button>
		 			
		 			<button type="button" id="findPass" name="findPass" onclick = "location.href = '/rainbow/member/findPass' ">비밀번호 찾기</button>
		 		</li> 
					
				
				   	<p style="color:#f00; font-size:9px;">${msg }</p>
				  
				  
		  	</ul>
		 </form>   
	</section>

</body>
</html>