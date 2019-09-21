<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/login.css">
<title>RAINBOW PARK</title>
</head>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>

<script src="/rainbow/resources/bootstrap/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
	 

	  // 회원가입 버튼 클릭
		$("#signup_btn").click(function(){
			$("#id_msg").text("");
			$("#phone_msg").text("");
			$("#pass_msg").text("");
			$("#name_msg").text("");
			
			joinFormCheck();
		});
	  
		function joinFormCheck(){
   			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
   			var password = /^[a-z0-9]{4,12}$/;
   			var phonecheck = /^\d{3}-\d{4}-\d{4}$/;

			if($("#userId").val()==""){
				$("#userId").focus();
				return false;
			}else if(exptext.test($("#userId").val())==false){
				$("#id_msg").text("이메일 형식이 올바르지 않습니다.");
				$("#userId").focus();
				return false;
			}else if($("#userPass").val()==""){
				$("#userPass").focus();
				return false;
			}else if(password.test($("#userPass").val())==false){
				$("#pass_msg").text("비밀번호는 4자리에서 12자리까지 허용됩니다.");
				$("#userPass").focus();
				return false;
   			}else if($("#userPassc").val()==""){
				$("#userPassc").focus();
				return false;
			}else if($("#userPhone").val()==""){
				$("#userPhone").focus();
				return false;
			}else if(phonecheck.test($("#userPhone").val())==false){
				$("#phone_msg").text("010-1234-5678 형식으로 입력해주세요.");
				$("#userPhone").focus();
				return false;
			}else if($("#userName").val()==""){
				$("#userName").focus();
				return false;
			}
			
			postSignup();
		}
		
		
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
	
		// 회원 가입 
		function postSignup(){
			
			var userId = $("#userId").val();
			var userPass = $("#userPass").val();
			var userName = $("#userName").val();
			var userPhone = $("#userPhone").val();
			
			var data = {
					userId : userId,
					userPass : userPass,
					userName : userName,
					userPhone : userPhone
			};
			
			$.ajax({
				url : "/rainbow/member/signup",
				type : "post",
				data : data,
				success : function(result){
					if(result==0){
						alert("회원가입을 축하드립니다.");
						location.href = '/';
					}else if(result==1){
						$("#phone_msg").text("이미 사용중인 번호입니다.");
					}else{
						$("#id_msg").text("이미 사용중인 아이디입니다.");
					}
				}
			});
		};

		
	});
</script>
<body>

	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
			<section id="content">
				<span>레인보우 파크에 오신 것을 환영합니다.</span>
				
				 <form role="form" method="post" autocomplete="off" id="form2">
				 <span class="logSpan"><img src="/rainbow/resources/images/rainbow.png">RAINBOW PARK</span>
				 	<ul>
				 		<li><label for="userId" class="label1">아이디</label></li>
				 		<li>
				 			<div class="input_area">
							   <input type="email" id="userId" name="userId" placeholder="example@email.com" required="required" />   
							   <div id="id_msg" class="msg"></div>   
						 	 </div>
				 		</li>
				 		<li><label for="userPass" class="label1">비밀번호</label></li>
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
				 		</li>
				 		<li><label for="userName" class="label1">닉네임</label></li>
					  	<li>
					  		<div class="input_area">
							   <input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요" required="required" />   
							   <div id="name_msg" class="msg"></div>    
						  </div>
					  	</li>
					  	<li><label for="userPhone" class="label1">연락처</label></li>
					  	<li>
					  		 <div class="input_area">
								   <input type="text" id="userPhone" name="userPhone" placeholder="010-1234-5678 형식" required="required" />  
								   <div id="phone_msg" class="msg"></div>     
							  </div>
					  	</li>
					  	<li>
					  		<button type="button" id="signup_btn" name="signup_btn" style="margin-top: 15px;">회원가입</button>
					  	</li>

				  </ul>
			 </form>   
		</section>
		
		 <footer id="footer">
						<div id="footer">
							<%@ include file="../include/footer.jsp" %>
						</div>
					</footer>

</body>
</html>