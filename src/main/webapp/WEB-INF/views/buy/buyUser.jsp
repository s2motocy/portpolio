<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>구매 페이지</title>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
			<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
			<script>
				/* 우편번호 */
				function kakaopost() {
					new daum.Postcode({
						oncomplete: function (data) {
							document.querySelector("#post_code").value = data.zonecode;
							document.querySelector("#addr").value = data.address;
						}
					}).open();
				}

				$(document).ready(function () {
					/* 결제 API 활용 */
					$("#").click(function (e) { // #buybtn
						e.preventDefault()
						var buy_no = $("#buy_no").val()
						var item_name = $("#item_name0").val() + " 외"
						var sum_price = 0;
						$("input[id^=buy_price]").each(function (idx, data) { sum_price += parseInt($(this).val()) })

						requestPay(buy_no, item_name, sum_price)
						// ,name,amount,buyer_email,buyer_name,buyer_tel,buyer_addr,buyer_postcode
					})
					const IMP = window.IMP; // 생략 가능
					IMP.init("imp86273375");
					function requestPay(buy_no, item_name, sum_price) {
						IMP.request_pay({
							pg: "INIBillTst",
							pay_method: "card",
							merchant_uid: buy_no,   // 주문번호 "ORD20180131-0000011"
							name: item_name, // 이름 "아메리카노 벤티"
							amount: sum_price // 숫자 타입
							/* buyer_email: email,
							buyer_name: "홍길동",
							buyer_tel: "010-4242-4242",
							buyer_addr: "서울특별시 강남구 신사동",
							buyer_postcode: "01181" */
						}, function (rsp) { // callback
							//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
							if (rsp.success) {
								$('form').submit()
							} else {
								alert("결제에 실패하였습니다. ${rsp.error_msg}")
							}
						});
					}
				})

			</script>
		</head>

		<body>
			<form action="register" method="post">
				<h1>회원: 주문/결제하기</h1>
				<div class="container">
					<div class="상품 정보">
						<h2>주문 상품</h2>
						<hr>
						<table>
							<tr>
								<th>상품사진</th>
								<th>상품이름</th>
								<th>상품수량</th>
								<th>상품가격</th>
							</tr>
							<c:forEach var="dto" items="${dlist}" varStatus="stat">
								<tr>
									<td><img
											src="/display?fileName=/${vlist[stat.index].attachList[0].uploadPath.replace('\\', '/')}/s_${vlist[stat.index].attachList[0].uuid}_${vlist[stat.index].attachList[0].fileName}" />
									</td>
									<td><input type="text" id="item_name${stat.index}"
											name="buy_list[${stat.index}].item_name" value="${dto.item_name}" /></td>
									<td><input type="text" name="buy_list[${stat.index}].amount"
											value="${dto.amount }" /></td>
									<td><input type="text" id="buy_price${stat.index}"
											name="buy_list[${stat.index}].buy_price" value="${dto.buy_price}" /></td>
								</tr>
								<input type="hidden" name="buy_list[${stat.index}].buy_no" value="${dto.buy_no}" />
								<input type="hidden" name="buy_list[${stat.index}].item_id" value="${dto.item_id}" />
							</c:forEach>
						</table>
					</div>
					<div class="구매자 정보">
						<h2>배송 정보</h2>
						<hr>
						<div>
							<label for="name"><b>이름</b></label><br>
							<input type="text" id="buyer_name" name="buyer_name" value="${data.buyer_name}"
								required /><br>
						</div>
						<div>
							<label for="pnum"><b>연락처</b></label><br>
							<input type="tel" id="phone" name="phone" value="${data.phone}" required /><br>
						</div>
						<div>
							<label for="post_code"><b>우편번호</b></label><br>
							<input type="text" id="post_code" name="post_code" placeholder="우편번호"
								value="${data.post_code}" required />
							<input type="button" value="우편번호찾기" onclick="kakaopost()"><br>
						</div>
						<div>
							<label for="addr"><b>주소</b></label><br>
							<input type="text" id="addr" name="addr" value="${data.addr}" required /><br>
						</div>
						<div>
							<label for="addr2"><b>상세주소</b></label><br>
							<input type="text" id="addr2" name="addr2" placeholder="상세주소" value="${data.addr2}"
								required><br>
						</div>
						<div class="히든">
							<input type="hidden" id="buy_no" name="buy_no" value="${data.buy_no}" />
							<input type="hidden" name="user_id" value="${data.user_id}" />
						</div>
					</div>
				</div>
				<button type="reset" id="resetbtn" class="resetbtn">취소</button>
				<button type="submit" id="buybtn" class="buybtn">결제하기</button>
			</form>
		</body>

		</html>