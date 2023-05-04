<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록</title>
</head>
<body>
<h2>여기는 큐앤애이 입니다아핰</h2>
<table>
	<c:forEach items="${list}" var="quest">
	<tr>
		<td><input type="text" value="${quest.qno}"></td>
		<td><input type="text" value="${quest.title}"></td>
		<td><input type="text" value="${quest.content}"></td>
		<td><input type="text" value="${quest.writer}"></td>
	</tr>
	</c:forEach>
</table>
</body>
</html>