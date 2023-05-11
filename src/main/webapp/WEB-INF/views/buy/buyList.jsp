<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	관리자용 전체 구매내역
	<table>
	<tr>
		<td>주문번호</td>
		<td>주문날짜</td>
		<td>주문 상품</td>
		<td>구매 가격</td>
		<td>주문 상태</td>
	</tr>
	
	<c:forEach items="${buylist}" var="buylist">
		<tr>
			<td>${buylist.buy_no}</td>
			<td><input type="text" value="${buylist.member_id}"></td>
			<td><input type="text" value='<fmt:formatDate value="${buylist.buy_date}" pattern="yyyy-MM-dd" />'></td>
			<td><input type="text" value="${buylist.cart_id}"></td>
			<td><input type="text" value="${buylist.price}"></td>
			<td><input type="text" value="${buylist.buy}"></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>