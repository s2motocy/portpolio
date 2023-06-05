<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.container{
	padding-top:10px;}
table{
	margin-left: auto;
	margin-right: auto;}
th, td {
	text-align: center;}
.navi_bar_area #admin4:visited{
    color:black;
    font-weight: bold;}
</style>

<script>
$(document).ready(function (e) {
	$(".button-outline-secondary").each(function (idx, data) {
		$(this).click(function (e) {
			var text = $("tr td#first").eq(idx).text()
			var status = $("tr #buy_status").eq(idx).val()
			console.log("눌렸다", idx, text, status)
			// AJAX (jQuery) code
			$.ajax({
				url: "/buy/order",
				type: "POST",
				data: { buy_status: status, buy_no: text },
				dataType: "JSON",
				success: function (response) {
					alert("주문상태 수정완료");
					console.log("성공" + response);
				},
				error: function (xhr, status, error) {
					console.error(error);
				}
			});
		})
	})
})
</script>

<body>
<!-- Page Introduction Wrapper -->
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>주문 리스트</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="/">Home</a>
                </li>
                <li class="is-marked">
                    <a href="#">구매 관리</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- Page Introduction Wrapper /- -->
<div id="app">
	<div class="container">
		<table class="table table-striped" id="buytable">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>결제일</th>
			<th>상품</th>
			<th>수량</th>
			<th>가격</th>
			<th>상태</th>
		</tr>
		<c:forEach var="list" items="${buyList}">
			<tr>
				<td id="first">${list.buy_no}</td>
				<td>${list.user_id}</td>
				<td><fmt:formatDate value="${list.buy_date}" pattern="yyyy-MM-dd" /></td>
				<td><c:forEach var="todo" items="${list.buy_list}">
						${todo.item_name}<br>
					</c:forEach></td>
				<td><c:forEach var="todo" items="${list.buy_list}">
						${todo.amount}<br>
					</c:forEach></td>
				<td><c:forEach var="todo" items="${list.buy_list}">
						${todo.buy_price}<br>
					</c:forEach></td>
				<td>
					<select name="buy_status" id="buy_status">
						<option value="결제 완료" <c:if test="${list.buy_status == '결제 완료'}">selected</c:if>>결제 완료</option>
						<option value="상품 준비 중" <c:if test="${list.buy_status == '상품 준비 중'}">selected</c:if>>상품 준비중</option>
						<option value="배송 시작" <c:if test="${list.buy_status == '배송 시작'}">selected</c:if>>배송 시작</option>
						<option value="배송 중" <c:if test="${list.buy_status == '배송 중'}">selected</c:if>>배송 중</option>
						<option value="배송 완료" <c:if test="${list.buy_status == '배송 완료'}">selected</c:if>>배송 완료</option>
					</select>
				<div class="action-wrapper">
					<button class="button button-outline-secondary fas fa-sync"></button>
				</div>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>