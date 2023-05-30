<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<style>
tr {
	text-align: center;
	border: 1px solid;}
.container {
	padding-top: 10px;}
.navi_bar_area #admin2:visited {
	color: black;
	font-weight: bold;}
.table td {
	vertical-align: middle;}
</style>

<script>
$(document).ready(function () {
	/* 삭제버튼 */
	$("button#deletebtn").each(function (idx, data) {
		$(this).click(function (e) {
			var confirmation = confirm("정말로 삭제하시겠습니까?");
			if (confirmation) {
				// 확인 버튼 클릭 시 동작
				alert("동작을 시작합니다.");
			} else {
				// 취소 버튼 클릭 시 동작
				e.preventDefault();
				alert("동작을 취소했습니다.");
			}
		}) // click
	}) // each
}) // ready
</script>

<body>
<div id="app">
	<!-- Page Introduction Wrapper -->
	<div class="page-style-a">
		<div class="container">
			<div class="page-intro">
				<h2>상품 목록</h2>
				<ul class="bread-crumb">
					<li class="has-separator">
						<i class="ion ion-md-home"></i>
						<a href="#">Home</a>
					</li>
					<li class="is-marked">
						<a href="#">상품 목록</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Page Introduction Wrapper /- -->
	<div class="container">
		<table class="table table-hover">
			<tr>
				<th scope="col">상품 번호</th>
				<th scope="col">상품 사진</th>
				<th scope="col">상품 분류</th>
				<th scope="col">상품 이름</th>
				<th scope="col">상품 가격</th>
				<th scope="col">상품 재고</th>
				<th scope="col">수정 여부</th>
				<th scope="col">삭제 여부</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr class="table-light">
					<td>${list.item_id}</td>
					<td data-label=""><img
							src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\', '/')}/${list.attachList[0].uuid}_${list.attachList[0].fileName}"
							width="100px" height="100px" /></td>
					<td>${list.category}</td>
					<td><a href="/item/detail?item_id=${list.item_id}">${list.item_name}</a></td>
					<td>
						<fmt:formatNumber value="${list.item_price}" pattern="###,### 원" />
					</td>
					<td>${list.item_stock}</td>
					<td><a href="update?item_id=${list.item_id}"><button id="updatebtn" type="button" class="btn btn-primary">수정</button></a></td>
					<td><a href="delete?item_id=${list.item_id}" id="delete"><button id="deletebtn" type="button" class="btn btn-danger">삭제</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>