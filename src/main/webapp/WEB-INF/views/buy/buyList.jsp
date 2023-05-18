<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/admin/adminPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>

.container {
	margin:60px;
}

table{
	margin-left: auto;
	margin-right: auto;
}

.navi_bar_area #admin4:visited{
    color:black;
    font-weight: bold;
}

</style>
</head>
<body>
<div class="container">
	<table class="table table-striped" id="buytable">
		<tr>
			<td>주문번호</td>
			<td>주문 아이디</td>
			<td>주문날짜</td>
			<td>주문 상품</td>
			<td>구매 가격</td>
			<td>주문 상태</td>
		</tr>
		<c:forEach items="${buylist}" var="buylist">
			<tr>
				<td>${buylist.buy_no}</td>
				<td>${buylist.member_id}"</td>
				<td><fmt:formatDate value="${buylist.buy_date}" pattern="yyyy-MM-dd" /></td>
				<td>"${buylist.cart_id}</td>
				<td>${buylist.price}</td>
				<td>${buylist.buy}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>