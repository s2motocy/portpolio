<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
<h3>Q&A</h3>
	<td><a href="new">글쓰기</a></td>
<form method="post" action="list" id="page">
	<input type="hidden" name="curPage" value="1" />
	<table>
	<tr>
		<th class="w-px60">번호</th>
		<th class="w-px100">작성자</th>
		<th class="w-px140">제목</th>
		<th class="w-px180">작성일자</th>
	</tr>
	<c:forEach items="${page}" var="list">
	<tr>
			<td><a href="detail">${list.id}</a></td>
			<td>${list.writer}</td>
			<td>${list.title}</td>
		    <td>${list.writedate}</td>
	</tr>
	</c:forEach>
</table>
</form>
<div class="btnSet">
</div>
</body>
</html>