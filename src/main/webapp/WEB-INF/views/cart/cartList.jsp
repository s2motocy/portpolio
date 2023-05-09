<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<style>
input {
	text-align: center;
	width: 40px;
	
}
#item_name {
	width: 100px;
}
table, th, tr, td {
	border: 1px solid;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
<script>
$(document).ready(function(){
	/* 이미지 경로 설정 */
	$("img").each(function(idx, data){
		var r = $(this).attr('src')
		u= r.replaceAll('\\', '/')
		$(this).attr('src', u )
	})
	
	/* 클릭시 수량 감소 */
	$("button[id^=minusQty]").click(function(e){
		var amount = parseInt($("input[id^=amountData]").val())
		if(amount >1) {
			$("input[id^=amountData]").val(--amount)
			var price = $("input[id^=price_origin]").val()
			$("input[id^=priceData]").val(price*amount)
		}
	})
	
	/* 클릭시 수량 증가 */
	$("button[id^=plusQty]").on('click', function(e){
		var amount = parseInt($("input[id^=amountData]").val())
		$("input[id^=amountData]").val(++amount)
		var price = $("input[id^=price_origin]").val()
		$("input[id^=priceData]").val(price*amount)
	})

	/* 총액 계산 */
	var total = 0
	var amount = 0
	$("#pricing").each(function(idx, data){
		total += parseInt($(data).find('#hidden_total').val())
		amount += parseInt($(data).find('#hidden_amount').val())
	})
	$("#view_amount").val(amount)
	$("#view_price").val(total)

	/* ajax */
	$("#apply").click(function(e){
		var amountData = $("#amountData").val()
		var priceData = $("#priceData").val()
		var memberid = $("#memberData").val()
		var itemid = $("#itemData").val()
		var formData = {amount:amountData, price:priceData, member_id:memberid, item_id:itemid}
		$.ajax({
			url: '/cart/cartUpdate',
			type: 'POST',
			data: formData,
			success: function(result){ alert('success') },
			error: function(xhr,status,error){ alert('false') }
		})
	})
	
 })
 </script>
</head>
<body>
	<h1>장바구니 페이지</h1>
	<table class="cart_table">
		<tr>
			<th>전체<br><input type="checkbox" /></th>
			<th>상품 사진</th>
			<th>상품 이름</th>
			<th>단가</th>
			<th>수량</th>
			<th>합계</th>
			<th>적용</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="list" items="${dtoList}" varStatus="stat">
		<tr>
			<td class="선택_히든" id="pricing">
				<input type="checkbox" id="checkbox" checked="checked" />
				<input type="hidden" id="hidden_amount" value="${list.amount}" />
				<input type="hidden" id="hidden_total" value="${list.price}" />
			</td>
			<td class="사진"><img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}"/></td>
			<td class="품명"><input type="text" id="item_name" value="${list.item_name}" /></td>
			<td class="단가"><input type="text" id="price_origin${list.item_id}" value="${list.item_price}" /></td>
			<td class="수량">
				<button id="minusQty${stat.index}">-</button>
				<input type="text" id="amountData${stat.index}" value="${list.amount}" />
				<button id="plusQty${stat.index}">+</button>
			</td>
			<td class="합계"><input type="text" id="priceData${stat.index}" value="${list.price}" readonly /></td>
			<td class="적용"><button id="apply">적용</button></td>
			<td class="삭제"><button id="remove">삭제</button></td>
		</tr>
		<input type="hidden" id="memberData" value="${list.member_id}" />
		<input type="hidden" id="itemData" value="${list.item_id}" />
	</c:forEach>
	</table>
	
	<hr>
	<div class="결제 정보">
		<div class="수량"> 수량 : <input type="text" id="view_amount" value="0" /></div>
		<div class="총액"> 가격 : <input type="text" id="view_price" value="0" /></div>
		<div class="쿠폰"> 쿠폰 : <input type="text" id="discount" value="0" /></div>
		<div class="배송비"> 배송비 : <input type="text" id="deliverypay" value="0" /></div>
		<div class="결제금액"> 결제금액 : <input type="text" id="totalpay" value="0" /></div>
	</div>
	<div class="버튼">
		<button id="continue" onclick="location.href='/item/itemList'">쇼핑계속하기</button>
		<button id="payment">결제하러가기</button>
	</div>
	
</body>
</html>