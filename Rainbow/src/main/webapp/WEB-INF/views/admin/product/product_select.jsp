<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/admin.css">
<meta charset="UTF-8">
<title>RAINBOW PARK</title>
</head>
<script>
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		$("#editBtn").click(function(){
			formObj.attr("action", "/rainbow/admin/product/product_edit");
			formObj.attr("method", "get")
			formObj.submit();
		});
		
		$("#deleteBtn").click(function(){
			 
			 var con = confirm("정말로 삭제하시겠습니까?");
			 
			 if(con) {      
			  formObj.attr("action", "/rainbow/admin/product/product_delete");
			  formObj.submit();
			 }
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

			<div id="container_box">
				<h1> 상품 No. ${product.pNum } </h1>
				
				<form role="form" method="post" autocomplete="off">
				
					<div class="inputArea1">
						<button type="button" id="editBtn" class="btn btn-edit">수정</button>
						<button type="button" id="deleteBtn" class="btn btn-delete">삭제</button>
					</div>
				
				<input type="hidden" name="n" value="${product.pNum }"/>
				
					<div class="inputArea">
						 <label for="gdsImg"></label>
						 <img src="${product.pImg}" class="img1" style="width: 400px; padding: 20px;"/>
					
					
						<ul>
							<li>
								<label>1차 분류</label> 
								 <span class="category1">${product.cCodeRef }</span>        
							</li>
							
							<li>
								<label>2차 분류</label>
								 <span class="category2">${product.cCode}</span>
							</li>
							<li>
								 <label for="pName">상품명</label>
							 	<span>${product.pName}</span>
							</li>
							<li>
								<label for="pPrice">상품가격</label>
								 <span> <fmt:formatNumber value="${product.pPrice}" pattern="###,###,###" /></span>
							</li>
							<li>
								<label for="pStock">상품수량</label>
							 	<span>${product.pStock}</span>
							</li>
							<li>
								<label for="pContent">상품소개</label>
							 <span>${product.pContent}</span>
							</li>
							<li></li>
						</ul>
					</div>
					
					
					
				</form>
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