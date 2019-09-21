<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/review.css">

<meta charset="UTF-8">
<title>RAINBOW PARK</title>
</head>
<script>
	$(document).ready(function(){

		$("#resetBtn").click(function(){
			 location.href = "/rainbow/shop/product_select?n=" + ${product.pNum};
			
		});
		
		
		$("#rImg").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(150);        
			    }
			    reader.readAsDataURL(this.files[0]);
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
				<h1> 리뷰 수정 </h1>
				
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
					<button type="submit" id="editBtn">수정</button>
					<button type="button" id="resetBtn" >취소</button>
					<input type="hidden" name="pNum" value="${product.pNum }">
					<div class="inputArea1">
						<ul>
							<li>
								 <label for="rTitle">Title</label>
								 <input type="text" id="rTitle" name="rTitle" value="${product.rTitle}"/>
							</li>
							<li>
								<label for="rContent">Content</label>
							 	<input type="text" id="rContent" name="rContent" value="${product.rContent}"/>
							</li>
							<li>
								<input type="file" id="rImg" name="file" />
							</li>
							<li>
								<label for="rImg"></label>
								<div class="select_img"><img src=""/></div>
						 		
						 		<img src="/rainbow/${product.rImg}" style="width: 150px;"/>
							  	<input type="hidden" name="rImg" value="${product.rImg}" /> 
							</li>
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