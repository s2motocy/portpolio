<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
			</head>

			<body>
				<h2>해윙✋✋</h2>
				<h2>여기는 주문 내역입니다앙</h2>
				<table>
					<tr>
						<td>주문번호</td>
						<td>주문날짜</td>
						<td>주문 상품</td>
						<td>구매 가격</td>
						<td>주문 상태</td>
					</tr>
					<c:forEach items="${mblist}" var="mblist">
						<tr>
							<td><a href="배송조희">${mblist.buy_no}</a></td>
							<td><input type="text"
									value='<fmt:formatDate value="${mblist.buy_date}" pattern="yyyy-MM-dd" />'></td>
							<td><input type="text" value="${mblist.cart_id}"></td>
							<td><input type="text" value="${mblist.price}"></td>
							<td><input type="text" value="${mblist.buy}"></td>
						</tr>
					</c:forEach>
				</table>
			</body>

			</html>