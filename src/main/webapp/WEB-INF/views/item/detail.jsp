<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
<script>
$(document).ready(function(){
	$("img").each(function(idx, data){
		var r = $(this).attr('src')
		u= r.replaceAll('\\', '/')
		$(this).attr('src', u )
	})
	
})
 </script>
<body>
	<h1>상품 상세 페이지(Detail)</h1>
	<c:forEach var="list" items="${list}">
		<div class="이미지 출력 전체">
			<div class="이미지 삽입">
				<img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}"/>
			</div>
			<div class="이미지 정보">
				<div class="상품 이름"><h3>상품 이름 : ${list.name}</h3></div>
				<div class="상품 가격"><h3>상품 가격 : ${list.price}</h3></div>
			</div>
			<div class="수량 설정">
				<h3>수량 : </h3>
				<button class="minusQty">-</button>
				<input type="text" id="inputData" value="1" />
				<button class="plusQty">+</button>
			</div>
			<button class="addCart">장바구니에 담기</button>
			<button class="heartPlus"><span class="icon_heart_alt"></span></button>
		</div>
	</c:forEach>
</body>
</html>
