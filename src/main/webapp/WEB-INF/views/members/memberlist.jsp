<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>모든 회원보기</h2>
<form action="memberlist" method="get">
	<table border="1">
		<tr height="50">
			<td width="150" align="center">이름</td>
			<td width="200" align="center">아이디</td>
			<td width="150" align="center">비밀번호</td>
			<td width="200" align="center">아매알</td>
			<td width="100" align="center">전화번호</td>
			<td width="100" align="center">잡전화번호</td>
			<td width="100" align="center">주소</td>
			<td width="100" align="center">상세주소</td>
		</tr>
	<c:forEach var="list" items="${list1}">
		<tr height="50">
			<td width="150" align="center">${list.name}</td>
			<td width="200" align="center">${list.id}</td>
			<td width="150" align="center">${list.pwd}</td>
			<td width="200" align="center">${list.email}</td>
			<td width="100" align="center">${list.pnum}</td>
			<td width="100" align="center">${list.hnum}</td>
			<td width="100" align="center">${list.address}</td>
			<td width="100" align="center">${list.moreaddress}</td>
		</tr>
	</c:forEach>	
	<button type="submit">홈으로</button>
	</table>
</form>
</body>
</html>