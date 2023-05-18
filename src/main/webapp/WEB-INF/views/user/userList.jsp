<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/adminPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.navi_bar_area #admin3:visited{
    color:black;
    font-weight: bold;
}
</style>
</head>
<body>
<h2>모든 회원보기</h2>
<form action="userList" method="get">
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
				<td width="150" align="center">${list.user_name}</td>
				<td width="200" align="center">${list.user_id}</td>
				<td width="150" align="center">${list.pwd}</td>
				<td width="200" align="center">${list.email}</td>
				<td width="100" align="center">${list.phone}</td>
				<td width="100" align="center">${list.post_code}</td>
				<td width="100" align="center">${list.addr}</td>
				<td width="100" align="center">${list.addr2}</td>
			</tr>
		</c:forEach>	
	<button>홈으로</button>
	</table>
</form>
</body>
</html>