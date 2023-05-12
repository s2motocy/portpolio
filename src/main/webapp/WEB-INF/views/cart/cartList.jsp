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
	$("button[id^=minusQty]").each(function(idx, data){
		$(this).click(function(e){
			var amount = parseInt($("#amountData"+idx).val())
			if(amount >1) {
				$("#amountData"+idx).val(--amount)
				var price = $("#price_origin"+idx).val()
				$("#priceData"+idx).val(price*amount)
			}
		})
	})
	
	/* 클릭시 수량 증가 */
	$("button[id^=plusQty]").each(function(idx, data){
		$(this).click(function(e){
			var amount = parseInt($("#amountData"+idx).val())
			$("#amountData"+idx).val(++amount)
			var price = $("#price_origin"+idx).val()
			$("#priceData"+idx).val(price*amount)
		})
	})
	
	/* 총액 계산 함수 설정 */
	const pricingTotal=()=>{
		var total = 0
		var amount = 0
		$("td[id^=pricing]").each(function(idx, data){
			if($(data).find('#checkbox'+idx).is(':checked')){
				total += parseInt($(data).find('#hidden_total'+idx).val())
				amount += parseInt($(data).find('#hidden_amount'+idx).val())
			}	
		})
		$("#view_amount").val(amount)
		$("#view_price").val(total)
		
		/* 배송비 계산 */
		if($("#view_price").val() > 10000 || $("#view_price").val() == 0 ){ $("#deliverypay").val(0) }
		else { $("#deliverypay").val(3000) }
		
		/* 최종 결제금액 계산 */
		var mid_price = parseInt($("#view_price").val())
		var discount = parseInt($("#discount").val())
		var delivery_pay = parseInt($("#deliverypay").val())
		$("#totalpay").val(mid_price*(1-discount/100)+delivery_pay)
	}
	
	/* 총액 계산 함수 호출 */
	pricingTotal()
	$("td[id^=pricing]").each(function(idx, data){
		$('#checkbox'+idx).change(function(e){
			pricingTotal()
		})
	})
	
	/* ajax 사용하여 update */
	$("button[id^=apply]").each(function(idx, data){
		$(this).click(function(e){
			var amountData = $("#amountData"+idx).val()
			var priceData = $("#priceData"+idx).val()
			var memberid = $("#memberData"+idx).val()
			var itemid = $("#itemData"+idx).val()
			var formData = {amount:amountData, price:priceData, member_id:memberid, item_id:itemid}
			$.ajax({
				url: '/cart/cartUpdate',
				type: 'POST',
				data: formData,
				success: function(result){ 
					alert('success')
					window.location.href="cartList"
				},
				error: function(xhr,status,error){ alert('false') }
			})
		})
	})
	
	/* 체크박스 전체선택 */
	$("#all_checked").click(function(e){
		if($("#all_checked").is(":checked")){
			$("input[type=checkbox]").prop("checked", true)
			pricingTotal()
		} else {
			$("input[id^=checkbox]").prop("checked", false)
			pricingTotal()
		}
	})
	
	/* 장바구니 삭제 */
	$("button[id^=remove]").each(function(idx, data){
		$(this).click(function(e){
			console.log("삭제버튼이 눌림"+idx)
			$("#delete_hidden").attr('action','/cart/cartDelete').attr('method','POST')
			$("#cart_id").val($(this).data("cart_id"))
			$("#delete_hidden").submit()
		})
	})
	
	/* 구매페이지로 정보전송 */
	$("#payment").click(function(e){
		$("#frm").submit()
	})
	
 })
 </script>
</head>
<body>
	<h1>장바구니 페이지</h1>
	
	<form action="/Buy/buyPage" id="frm">
		<table class="cart_table">
			<tr>
				<th>전체<br><input type="checkbox" id="all_checked" checked="checked" /></th>
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
					<td class="선택_히든" id="pricing${stat.index}">
						<input type="checkbox" id="checkbox${stat.index}" checked="checked" />
						<input type="hidden" id="hidden_amount${stat.index}" value="${list.amount}" />
						<input type="hidden" id="hidden_total${stat.index}" value="${list.price}" />
					</td>
					<td class="사진"><img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}"/></td>
					<td class="품명"><input type="text" name="item_name" id="item_name" value="${list.item_name}" /></td>
					<td class="단가"><input type="text" id="price_origin${stat.index}" value="${list.item_price}" /></td>
					<td class="수량">
						<button id="minusQty${stat.index}">-</button>
						<input type="text" name="amount" id="amountData${stat.index}" value="${list.amount}" />
						<button id="plusQty${stat.index}">+</button>
					</td>
					<td class="합계"><input type="text" id="priceData${stat.index}" value="${list.price}" readonly /></td>
					<td class="적용"><button id="apply${stat.index}">적용</button></td>
					<td class="삭제"><button id="remove${stat.index}" data-cart_id="${list.cart_id}" >삭제</button></td>
				</tr>
				<input type="hidden" id="memberData${stat.index}" name="member_id" value="${list.member_id}" />
				<input type="hidden" id="itemData${stat.index}" value="${list.item_id}" />
			</c:forEach>
		</table>
		
		<hr>
		<div class="결제 정보">
			<div class="수량"> 수량 : <input type="text" name="total_price" id="view_amount" value="0" /></div>
			<div class="총액"> 가격 : <input type="text" id="view_price" value="0" /></div>
			<div class="할인"> 할인 : <input type="text" id="discount" value="0" />% <img src="https://cdn-pro-web-134-253.cdn-nhncommerce.com/mychef1_godomall_com/data/skin/front/udweb_pc_20200903/img/common/btn/btn_coupon_apply.png" /></div>
			<div class="배송비"> 배송비 : <input type="text" name="delivery_cost" id="deliverypay" value="0" />원</div>
			<div class="결제금액"> 결제금액 : <input type="text" id="totalpay" value="0" />원</div>
		</div>
		<div class="버튼">
			<button id="continue" onclick="location.href='/item/itemList'">쇼핑계속하기</button>
			<button id="payment">구매페이지로 이동</button>
		</div>
	</form>
	<form action="#" method="get" class="삭제_히든" id="delete_hidden">
		<input type="hidden" name="cart_id" id="cart_id" />
	</form>
	
</body>
</html>