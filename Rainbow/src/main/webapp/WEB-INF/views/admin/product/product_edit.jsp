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

		$("#resetBtn").click(function(){
			 location.href = "/rainbow/admin/product/product_select?n=" + ${product.pNum};
			
		});
		
		var select_cCode = '${product.cCode}';
		var select_cCodeRef = '${product.cCodeRef}';
		var select_cName = '${product.cName}';

		if(select_cCodeRef != null && select_cCodeRef != '') {
		 $(".category1").val(select_cCodeRef);
		 $(".category2").val(select_cCode);
		 $(".category2").children().remove();
		 $(".category2").append("<option value='"
		       + select_cCode + "'>" + select_cName + "</option>");
		} else {
		 $(".category1").val(select_cCode);
		 $(".category2").append("<option value=" + select_cCode + "selected='selected'>전체</option>");
		}
		
		//컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${category}');
		
		// 필요한 배열과 오브젝트 변수 생성
		var cate1Arr = new Array();
		var cate1Obj = new Object();
		
		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
			
			if(jsonData[i].level == "1") {  // 레벨이 1인 데이터가 있다면 
				cate1Obj = new Object();  // 초기화
				
				// cate1Obj에 cateCode와 cateName를 저장
				cate1Obj.cCode = jsonData[i].cCode; 
				cate1Obj.cName = jsonData[i].cName;
				
				// cate1Obj에 저장된 값을 cate1Arr 배열에 저장
				cate1Arr.push(cate1Obj);
			}
		}
		
		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.category1")
		
		for(var i = 0; i < cate1Arr.length; i++) {
		
			// cate1Arr에 저장된 값을 cate1Select에 추가
			cate1Select.append("<option value='" + cate1Arr[i].cCode + "'>"
								+ cate1Arr[i].cName + "</option>");	
		}
		
		
		// 클래스가 category1인 select변수의 값이 바뀌었을 때 실행
		$(document).on("change", "select.category1", function(){
		
			
			// 필요한 배열과 오브젝트 변수를 생성
			var cate2Arr = new Array();
			var cate2Obj = new Object();
			
			// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
			for(var i = 0; i < jsonData.length; i++) {
				
				if(jsonData[i].level == "2") {  // 레빌이 2인 데이터가 있다면
					cate2Obj = new Object();  // 초기화
					
					// cate2Obj에 cateCode, cateName, cateCodeRef를 저장
					cate2Obj.cCode = jsonData[i].cCode;
					cate2Obj.cName = jsonData[i].cName;
					cate2Obj.cCodeRef = jsonData[i].cCodeRef;
					
					// cate2Obj에 저장된 값을 cate1Arr 배열에 저장
					cate2Arr.push(cate2Obj);
				} 
			}
			
			var cate2Select = $("select.category2");

			// cate2Select의 값을 제거함(초기화)
			cate2Select.children().remove();
		 
			// cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
			$("option:selected", this).each(function(){
				
				var selectVal = $(this).val();  // 현재 선택한 cate1Select의 값을 저장
			
				cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
				
				// cate2Arr의 데이터를 cate2Select에 추가
				for(var i = 0; i < cate2Arr.length; i++) {
					
					// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
					if(selectVal == cate2Arr[i].cCodeRef) {
						cate2Select.append("<option value='" + cate2Arr[i].cCode + "'>"
											+ cate2Arr[i].cName + "</option>");
					}
				}		
			});
			
		});
		
		$("#pImg").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(400).margin-bottom(20);        
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
				<h1> 상품 수정 </h1>
				
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
					<input type="hidden" name="pNum" value="${product.pNum }"/>
					
					<div class="inputArea1">
						 <button type="submit" id="editBtn" class="btn btn-edit">수정</button>
						 <button type="button" id="resetBtn" class="btn btn-reset">취소</button>
					</div>
					
					<div class="inputArea"> 
					
						<ul style="text-align: center;">
							<li>
							<label>1차 분류</label>
								<select class="category1">
									<option value="">전체</option>
								 </select>
								
								<label>2차 분류</label>
								<select class="category2" name="cCode">
									<option value="">전체</option>
								</select>
							</li>
							
							<li>
								<label for="pName">상품명</label>
								 <input type="text" id="pName" name="pName" value="${product.pName}"/>
							</li>
							
							<li>
								<label for="pPrice">상품가격</label>
						 		<input type="text" id="pPrice" name="pPrice" value="${product.pPrice}"/>
							</li>
							
							<li>
								<label for="pStock">상품수량</label>
								 <input type="text" id="pStock" name="pStock" value="${product.pStock}"/>
							</li>
							
							<li>
								<label for="pContent">상품소개</label>
						 		<textarea rows="5" cols="50" id="pContent" name="pContent">${product.pContent}</textarea>
							</li>
							
							<li>
								<label for="pImg"></label>
						 		<input type="file" id="pImg" name="file" />
						 		<img src="${product.pImg}" style="width: 400px; margin-top: 20px;"/>
						 		<div class="select_img"><img src=""/></div>
							  	<input type="hidden" name="pImg" value="/rainbow/${product.pImg}" />
							  	<input type="hidden" name="pImg2" value="/rainbow/${product.pImg2}" />  
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