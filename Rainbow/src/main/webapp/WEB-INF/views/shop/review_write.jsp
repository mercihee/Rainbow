<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/rainbow/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/rainbow/resources/css/review.css">
<meta charset="UTF-8">
<title>RAINBOW PARK</title>
<script>
	$(document).ready(function(){
	  $("#rImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(400);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
	
	});
</script>

</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>

		<section id="container">

			<div id="container_box">
				<h1> 후기 등록 </h1>
				
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
					
					
					<div class="inputArea2">
						
						<span><img src="/rainbow/${product.pImg}" class="pImg"></span>
						<input type="hidden" name="pNum" id="pNum" value="${product.pNum } ">
						<ul>
						
						<li><span>NO. ${product.pNum} </span></li>
						<li><span>${product.pName }</span></li>
						<li><span>${product.pPrice } KRW</span></li>
						</ul>
						
						
					</div>
					<div class="inputArea" style="text-align-last: center;">
						<ul>
							<li>
								 <label for="rTitle">Title</label>
								 <input type="text" id="rTitle" name="rTitle" />
							</li>
							<li>
								<label for="rContent">Content</label>
							 	<input type="text" id="rContent" name="rContent" />
							</li>
							<li style="text-align-last: auto;">
								<label for="rImg"></label>
						 		<input type="file" id="rImg" name="file" />
						 		<div class="select_img"><img src="" style="margin-top:20px;"/></div>
							</li>
						</ul>
						
						 	<button type="submit" id="insert_Btn" class="btn btn-primary">등록</button>
						 	<button type="button" id="resetBtn" class="btn btn-reset">취소</button>
						
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