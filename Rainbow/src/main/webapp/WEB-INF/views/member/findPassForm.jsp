<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/login.css">
<title>RAINBOW PARK</title>
</head>
<script>
	$(document).ready(function(){
		
		$("#update_btn").click(function(){
			var password = /^[a-z0-9]{4,12}$/;
			
			if($("#userPass").val()==""){
				$("#userPass").focus();
				return false;
			}else if(password.test($("#userPass").val())==false){
				$("#pass_msg").text("비밀번호는 4자리에서 12자리까지 허용됩니다.");
				$("#userPass").focus();
				return false;
   			}else if($("#userPassc").val()==""){
				$("#userPassc").focus();
				return false;
   			}else{
   				upPass.submit();
   			}
		});
		
		// 패스워드&패스워드확인 비교
		$("#userPassc").focusout(function(){
			if($("#userPass").val() !=""){

				if($("#userPassc").val()!=""){
					if($("#userPass").val()==$("#userPassc").val()){
						$("#pass_msg").text("");
					}else{
						$("#pass_msg").text("패스워드가 다릅니다.");
						$("#userPass").val("").focus();
						
						return false;
					}	
				}
			}
		});
		
		
	});
</script>
<body>
	
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	
	
	<section id="content">
	
		 <form name="upPass" role="form" action="/rainbow/member/findPassPro" method="post"  autocomplete="off" id="form">
		 <span class="logSpan"><img src="/rainbow/resources/images/rainbow.png">RAINBOW PARK</span>
		 	<ul>
		 	
		 		<li>
		 			<p> ${userId} 님 비밀번호 변경 </p>
		 		</li>
		 		<li>
				 	<div class="input_area">
					   <input type="password" id="userPass" name="userPass" placeholder="4~12자리" required="required"/> 
					   <div id="pass_msg" class="msg"></div>      
				  </div>
				</li>
				<li>
				 	<div class="input_area" style="margin-top: -5px;">
					   <input type="password" id="userPassc" name="userPassc" placeholder="비밀번호 재입력" required="required" />      
				  </div>
				  <input type="hidden" id="userId" name="userId" value="${userId}"/>
		 		</li>
				 <li>
		 			<button type="button" id="update_btn" name="update_btn">비밀번호 변경</button>
		 		</li> 

				  
		  	</ul>
		 </form>   
	</section>

</body>
</html>