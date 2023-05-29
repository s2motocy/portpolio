<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../include/header.jsp" %>
<style>
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
.modal-content {
	margin-left:36.7%;
	width:25%;}
.modal-dialog {
        display: inline-block;
        text-align: center;
        vertical-align: middle;
        width:100%;
}
input::placeholder {
	font-size:10px;}
</style>

<script>
$(document).ready(function(){
	/* 상품별 '가격'x'수량' 을 '합계'에 입력 */
	const priced=()=>{
		$("div[class^=h-class]").each(function(idx, data){
			var price = parseInt($(data).find(".item_price"+idx).val())
			var amount = parseInt($(data).find(".amount"+idx).val())
			$(".totalData"+idx).val(price*amount) // hidden data
			$(".totalprice"+idx).text(price*amount)
		})
	}
	priced() // 함수 호출
	
	/* '상품별 합계 의 총합' x '할인율' + '배송비' 를 '결제예정금액' 에 입력 */
	const pricing=()=>{
		var total=0
		$("div[class^=h-class]").each(function(idx, data){
			total += parseInt($(".totalprice"+idx).text())
		})
		$(".totals").text(total) // item 의 price 를 더해 total 에 전달
		if(total < 10000){ $(".del_cost").text(3000) } // 가격의 총합이 10000 이하일때 배송비 3000 전달
		var totalprice = parseInt($(".totals").text())
		var discount = parseInt($(".discount").text())
		var del_cost = parseInt($(".del_cost").text())
		$(".final-totals").text(totalprice*(1-discount/100)+del_cost)
	}
	pricing() // 함수 호출
	
	/* 수정버튼 누르면 ajax 를 사용하여 수정 */
	$("button[id^=apply]").each(function(idx, data){
		$(this).click(function(e){
			e.preventDefault()
			var amountData = $(".amountData"+idx).val()
			var priceData = $(".item_price"+idx).val()
			var userid = $("#userData"+idx).val()
			var itemid = $("#itemData"+idx).val()
			console.log("여기에 수량:",amountData)
			var formData = {amount:amountData, cart_price:priceData, user_id:userid, item_id:itemid}
			$.ajax({
				url: '/cart/cartUpdate',
				type: 'POST',
				data: formData,
				success: function(result){ 
					alert('정상적으로 수정되었습니다.')
					window.location.href="cartList"
				},
				error: function(xhr,status,error){ 
					alert('false') 
				}
			})
		})
	})
	/* 수량 적용하기 */
	$("a[class^=plus-a]").each(function(idx, data){
		$(this).click(function(e){
			var amount = parseInt($(".amountData"+idx).val())
			$(".amountData"+idx).val(amount)
		})
	})
	
	$("a[class^=minus-a]").each(function(idx, data){
		$(this).click(function(e){
			var amount = parseInt($(".amountData"+idx).val())
			$(".amountData"+idx).val(amount)
		})
	})
	
	/* 장바구니 삭제 */
	$("button[id^=remove]").each(function(idx, data){
		$(this).click(function(e){
			e.preventDefault()
			console.log("삭제버튼이 눌림"+idx)
			$("#delete_hidden").attr('action','/cart/cartDelete').attr('method','POST')
			$("#cart_id").val($(this).data("cart_id"))
			$("#delete_hidden").submit()
		})
	})

	$(".checkout").click(function(e){
		e.preventDefault()
		$('#myModal').modal('show')
	})
	
	$("#buyLogin").click(function(e){
		e.preventDefault()
		var userid= $("#yourModal [id='user_id']").val()
		var password= $("#yourModal [id='pwd']").val()
		console.log("buyLogin에서 암호" ,userid, password)
		$.ajax({
			url: '/buy/buyLogin',
			type: 'POST',
			data: JSON.stringify({user_id:userid, pwd:password}),
			contentType:"application/json",
			success: function(result){
				console.log("result: ",result)
				if(result == "0"){
					alert("로그인되었습니다.")
					var userid= $("#yourModal [id='user_id']").val()
					var password= $("#yourModal [id='pwd']").val()
					console.log("암호" ,userid, password)
					var str="<input type='text' name='user_id' value='" + userid +"'/><input type='text' name='pwd'  value='" + password +"'/>"
					console.log(str)
					$("#frm").append(str)
					$("#frm").submit()
				}
			},
			error: function(xhr,status,error){ alert('아이디 또는 비밀번호가 잘못되었습니다.') }
		})
	})
	
	$(".btn-primary").click(function(e){
		console.log("회원구매")
		$("#yourModal").modal('show')
	})
	$(".btn-secondary").click(function(e){
		console.log("비회원구매")
		$("#frm").attr("action", "/buy/buyGuest").submit()
	})
</script>
<body>
<div id="app">
	<!-- Page Introduction Wrapper -->
	<div class="page-style-a">
		<div class="container">
			<div class="page-intro">
				<h2>장바구니</h2>
				<ul class="bread-crumb">
					<li class="has-separator">
						<i class="ion ion-md-home"></i>
						<a href="/">Home</a>
					</li>
					<li class="is-marked">
						<a href="/cart/cartList">장바구니</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Page Introduction Wrapper /- -->

	<!-- Modal 1 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-primary" data-dismiss="modal">회원구매</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">비회원구매</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 2 -->
	<div class="modal fade" id="yourModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<div>
						아이디<input type="text" name="user_id" />
					</div>
					<div>
						암호<input type="password" name="pwd" />
					</div>
					<input type='submit' id="buyLogin" value="전송" />
				</div>
			</div>
		</div>
	</div>

	<!-- Cart-Page -->
	<div class="page-cart u-s-p-t-80">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form id="frm">
						<!-- Products-List-Wrapper -->
						<div class="table-wrapper u-s-m-b-60">
							<table>
								<thead>
									<tr>
										<th>상품</th>
										<th>단가</th>
										<th>수량</th>
										<th>변경</th>
										<th>합계</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${dtoList}" varStatus="stat">
										<tr>
											<td>
												<div class="cart-anchor-image">
													<a href="#">
														<img src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\', '/')}/${list.attachList[0].uuid}_${list.attachList[0].fileName}"
															width="50px" height="50px" />
														<h6> ${list.item_name} </h6>
														<input type="hidden"
															name="buy_list[${stat.index}].item_name"
															value="${list.item_name}" />
													</a>
												</div>
											</td>
											<td>
												<div class="cart-price">
													<fmt:formatNumber value="${list.item_price}"
														pattern="###,### 원" />
													<input type="hidden"
														class="item_price${stat.index}"
														name="buy_list[${stat.index}].buy_price"
														value="${list.item_price}" />
												</div>
											</td>
											<td>
												<div class="cart-quantity">
													<div class="quantity">
														<input type="text"
															class="quantity-text-field amountData${stat.index}"
															name="buy_list[${stat.index}].amount"
															value="${list.amount}">
														<a class="plus-a plusQty${stat.index}"
															data-max="1000">&#43;</a>
														<a class="minus-a minusQty${stat.index}"
															data-min="1">&#45;</a>
													</div>
												</div>
											</td>
											<td>
												<div class="action-wrapper">
													<button
														class="button button-outline-secondary fas fa-sync"
														id="apply${stat.index}"></button>
													<button
														class="button button-outline-secondary fas fa-trash"
														id="remove${stat.index}"
														data-cart_id="${list.cart_id}"></button>
												</div>
												<input type="hidden" id="userData${stat.index}"
													value="${list.user_id}" />
												<input type="hidden" id="itemData${stat.index}"
													name="buy_list[${stat.index}].item_id"
													value="${list.item_id}" />
											</td>
											<td>
												<div class="cart-total">
													<span class="totalprice${stat.index}">0</span>원
													<input type="hidden"
														class="totalData${stat.index}" />
												</div>
												<div class="h-class${stat.index}">
													<input type="hidden"
														class="item_price${stat.index}"
														value="${list.item_price}" />
													<input type="hidden" class="amount${stat.index}"
														value="${list.amount}">
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- Products-List-Wrapper /- -->

						<div class="coupon-continue-checkout u-s-m-b-60">
							<div class="button-area">
								<a href="/item/categoryAll?user_id=${user_id}" class="continue">계속
									쇼핑하기</a>
								<a href="#" class="checkout">구매 로 이동</a>
							</div>
						</div>
					</form>

					<!-- hidden cart Delete area -->
					<form action="#" method="get" id="delete_hidden">
						<input type="hidden" name="cart_id" id="cart_id" />
					</form>

					<!-- Billing -->
					<div class="calculation u-s-m-b-60">
						<div class="table-wrapper-2">
							<table>
								<thead>
									<tr>
										<th colspan="2">결제예정 금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<h3 class="calc-h3 u-s-m-b-0">상품 금액</h3>
										</td>
										<td>
											<span class="calc-text totals">0</span>원
										</td>
									</tr>
									<tr>
										<td>
											<h3 class="calc-h3 u-s-m-b-0">할인</h3>
										</td>
										<td>
											<span class="calc-text discount">0</span>%
										</td>
									</tr>
									<tr>
										<td>
											<h3 class="calc-h3 u-s-m-b-0">배송비</h3>
											<span>
												<font size="1">10,000원 이상시 무료배송</font>
											</span>
										</td>
										<td>
											<span class="calc-text del_cost">0</span>원
										</td>
									</tr>
									<tr>
										<td>
											<h3 class="calc-h3 u-s-m-b-0">총 합계</h3>
										</td>
										<td>
											<span class="calc-text final-totals">0</span>원
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Billing /- -->
				</div>
			</div>
		</div>
	</div>
	<!-- Cart-Page /- -->
</div>
</body>
<%@ include file="../include/footer.jsp" %>