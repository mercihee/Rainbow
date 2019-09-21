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
	
		<div id="form">
 		
		 <span class="logSpan"><img src="/rainbow/resources/images/rainbow.png">RAINBOW PARK</span>
		
			<c:if test="${check == 1 }">
		 	<ul>
		 		<li>
		 			<p>회원님의 이메일 주소는</p>
		 		</li>
		 		<li>
		 			<span id="usermail" >${userId }</span> 입니다. 
		 		</li>
		 		<li>
		 			
		 		</li>
		 		<li>
		 			<button type="submit" id="findPass" name="findPass" onclick = "location.href = '/rainbow/member/findPass' ">비밀번호 찾기</button>
		 		</li>
				 <li>
		 			<button type="button" id="findId" onclick = "location.href = '/rainbow/member/login' ">로그인 하러가기 </button>
		 		</li> 
		 	</ul>
		 	</c:if>
			
			<c:if test="${check == 0 }">
			<ul>
				<li>
					<p id="pp">일치하는 회원 정보가 존재하지 않습니다.</p>
				</li>
				<li>
		 			<button type="button" id="findId" name="findId" onclick = "location.href = '/rainbow/member/findId' ">아이디 찾기</button>
		 			
		 			<button type="button" id="findPass" name="findPass" onclick = "location.href = '/rainbow/member/findPass' ">비밀번호 찾기</button>
		 		</li> 
			
				<c:if test="${msg1 == false}">
				   	<p style="color:#f00; font-size:9px;">아이디를 확인해주세요.</p>
				  </c:if>
				  <c:if test="${msg == false}">
				   	<p style="color:#f00; font-size:9px;">비밀번호를 확인해주세요.</p>
				  </c:if>
			</ul>	
			</c:if>	
		 </div>
	</section>

</body>
</html>