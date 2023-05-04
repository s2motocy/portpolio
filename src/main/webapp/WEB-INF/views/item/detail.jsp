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
	/* 이미지 경로 변경 */
	$("img").each(function(idx, data){
		var r = $(this).attr('src')
		u= r.replaceAll('\\', '/')
		$(this).attr('src', u )
	})
	
	/* 버튼 중첩실행 방지 */
	$("button").click(function(e){ e.preventDefault() })
	
	/* 전송버튼 실행 */
	$("button[type='submit']").click(function(){
		$("form").submit()
	})
	
	/* 마이너스 버튼실행 + 총액 변경 */
	$(".minusQty").click(function(){
		var inputData = $("#inputData").val()
		inputData = parseInt(inputData)
		if(inputData != null & inputData >1){
			 inputData--
			 console.log("수량이 감소했어요", inputData)
			 var price = $("#price").val()
			 $("#total").val(inputData*parseInte(price))
		} else if(inputData==1){ alert("값이 적어 변경되지 않았습니다")}
		$("#inputData").val(inputData)
	})
	
	/* 플러스 버튼 실행 + 총액 변경 */
	$(".plusQty").click(function(){
		var inputData = $("#inputData").val()
		inputData = parseInt(inputData)
		if(inputData != null & inputData <10){
			 inputData++
			 console.log("수량이 증가했어요", inputData)
			 var price = $("#price").val()
			 $("#total").val(inputData*parseInt(price))
		} else if(inputData==10){ alert("최대 수량을 초과하였습니다 (인당 최대 10개)")}
		$("#inputData").val(inputData)
	})
	
})
 </script>
<body>
	<h1>상품 상세 페이지(Detail)</h1>
	
	<c:forEach var="list" items="${list}">
		<div class="이미지 출력 전체">
			<form action="detail" method="post">
				<div class="이미지 삽입">
					<img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}"/>
				</div>
				<div class="이미지 정보">
					<div class="상품 이름"><h3>상품 이름 : ${list.name}</h3></div>
					<div class="상품 가격"><h3>상품 가격 : <input type="hidden" id="price" value="${list.price}" /></h3></div>
					<div class="쿠폰 사용"><img src="https://cdn-pro-web-134-253.cdn-nhncommerce.com/mychef1_godomall_com/data/skin/front/udweb_pc_20200903/img/common/btn/btn_coupon_apply.png" /></div>
				</div>
				<div class="수량 설정">
					<h3>수량 : </h3>
					<button class="minusQty">-</button>
					<input type="text" id="inputData" name="" value="1" />
					<button class="plusQty">+</button>
				</div>
				<div class="금액 총액">
					<h3>총액 : </h3>
					<input type="text" id="total" name="" value="0" />
				</div>
				<button type="submit" class="addCart">장바구니에 담기</button>
			</form>
		</div>
	</c:forEach>
</body>
</html>
