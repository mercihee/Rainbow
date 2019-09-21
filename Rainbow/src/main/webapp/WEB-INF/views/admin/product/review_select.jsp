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
		
		$("#rpDelete").click(function(){
			
			var rpNum = $("#rpNum").val();
			var con = confirm("정말로 삭제하시겠습니까?");
			 
			 if(con) {      
			  formObj.attr("action", "/rainbow/admin/product/rpDelete?n="+rpNum);
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
				<!-- 리뷰 -->
				<h5>REVIEW</h5>
				<div id="reviewDiv">
					
					<table>
						 <thead>
						  <tr>
						   <th>NO</th>
						   <th>TITLE</th>
						   <th>WRITER</th>
						   <th>DATE</th>
						   <th></th>
						  </tr>
						 </thead>
						
						 <tbody>
							  
								  <tr>
									  <td>${rv.rNum}</td>
									   <td>
									   		<p>${rv.rTitle }</p>
									   </td>
									   <td>${rv.userName}</td>
									   <td>
									   		<fmt:formatDate value="${rv.rDate}" pattern="yyyy-MM-dd"/>
									   </td>
									   
								  </tr>   
								  <tr class="rc">
								  
								  		<th></th>
								  		<th colspan="6">
								  		${rv.rContent } <br/>
								  		<c:if test="${rv.rImg != 'null'}">
								  			<img src="${rv.rImg }">
								  		</c:if>
								  		</th>
								  </tr>
								  <tr class="rp" id="rp" >
								  
								  		<th><input type="hidden" name="rNum" class="rNum" id="rNum" value="${rv.rNum }"></th>
								  		<th>
									  		<div id="reply">
									  			
												 <section class="replyList">
													  <ol>
													   <c:forEach items="${reply}" var="reply">
													   		<form role="form" method="post" autocomplete="off">
													   		<input type="hidden" name="rpNum" id="rpNum" value="${reply.rpNum }">
													   		<li>
													   			<div class="userInfo">
													   				<ul>
													   					<li class="uname"><p>${reply.userName }</p></li>
													   					<li class="rcon"><p>${reply.rpContent }</p></li>
													   					<li class="date"><p><fmt:formatDate value="${reply.rpDate}" pattern="yyyy-MM-dd" /></p> </li>
													   					<li><button type="button" id="rpDelete">delete</button></li>
													   				
													   				</ul>
													   			</div>
													   			
													   		</li>
													   		</form>
													   </c:forEach>
													   
													   </ol>    
												</section> 
												<div class="rpForm">
													<c:if test="${member == null }">
										  				<p><a href="/member/login">댓글은 로그인</a> 후 이용 가능합니다.</p>
										  			</c:if>
										  			<c:if test="${member != null }">
										  				<section class="replyForm">
														  <form role="form" method="post" autocomplete="off">
														  		<input type="hidden" name="pNum" value="${rv.pNum }">
														  		<input type="hidden" name="rNum" value="${rv.rNum }">
																<textarea name="rpContent" id="rpContent"></textarea>
																<button type="submit" id="rp_btn">submit</button>
														  </form>
														 </section>
													</c:if>
												</div>
												
												
									  		</div>
								  		</th>
								  </tr>
								 </tbody>
							  

					</table> 
				</div>
				
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