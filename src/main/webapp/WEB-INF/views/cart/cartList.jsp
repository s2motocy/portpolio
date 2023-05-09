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
	$("#minusQty").click(function(e){
		var amount = parseInt($("#amountData").val())
		if(amount >1) {
			--amount 
			$("#amountData").val(amount)
			var price = $("#price_origin").val()
			price = price*amount
			$("#priceData").val(price)
		}
	})
	
	/* 클릭시 수량 증가 */
	$("#plusQty").click(function(e){
		var amount = parseInt($("#amountData").val())
		++amount
		$("#amountData").val(amount)
		var price = $("#price_origin").val()
		price = price*amount
		$("#priceData").val(price)
	})
	
	$("#checkbox").each(function(idx, data){
		var price = parseInt($("#priceData").val())
		if(price != null & price != 0){
			$(this).attr('checked', 'checked')
		}
		
	})

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
	<table>
		<tr>
			<th>선택</th>
			<th>상품 사진</th>
			<th>상품 이름</th>
			<th>단가</th>
			<th>수량</th>
			<th>가격</th>
			<th>적용</th>
		</tr>
	<c:forEach var="list" items="${dtoList}">
		<tr>
			<td><input type="checkbox" id="checkbox" /></td>
			<td><img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}"/></td>
			<td><input type="text" id="item_name" value="${list.item_name}" /></td>
			<td><input type="text" value="${list.item_price}" /></td>
			<td>
				<button id="minusQty">-</button>
				<input type="text" id="amountData" value="${list.amount}" />
				<button id="plusQty">+</button>
			</td>
			<td><input type="text" id="priceData" value="0" readonly /></td>
			<td><button id="apply">적용</button></td>
		</tr>
		<input type="hidden" id="price_origin" value="${list.price}" />
		<input type="hidden" id="memberData" value="${list.member_id}" />
		<input type="hidden" id="itemData" value="${list.item_id}" />
	</c:forEach>
	</table>
	
	<hr>
	<div class="결제 정보">
		<div class="총액"> 가격 : <input type="text" id="view_price" value="0" /></div>
		<div class="할인"> 할인 : <input type="text" id="discount" value="0" /></div>
		<div class="배송비"> 배송비 : <input type="text" id="deliverypay" value="0" /></div>
		<div class="결제금액"> 결제금액 : <input type="text" id="totalpay" value="0" /></div>
	</div>
	<div class="버튼">
		<button id="continue" onclick="location.href='/item/itemList'">쇼핑계속하기</button>
		<button id="payment">결제하러가기</button>
	</div>
		
		<%-- <input type="text" value="${list.cart_id}" />
		<input type="text" value="${list.member_id}" />
		<input type="text" value="${list.item_id}" />
		<input type="text" value="${list.item_name}" />
		<input type="text" value="${list.amount}" />
		<input type="text" value="${list.price}" /> --%>
	
</body>
</html>