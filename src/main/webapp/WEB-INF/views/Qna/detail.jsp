<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
<h3>QNA 조회</h3>
	<table>
	<tr>
		<th class="w-px60">제목</th>
		<th class="w-px100">작성자</th>
		<th class="w-px140">내용</th>
		<th class="w-px180">작성일자</th>
	</tr>
	<tr>
			<td>${list.writer}</td>
			<td>${list.title}</td>
		    <td>${list.content}</td>
		    <td>${list.writedate}</td>
	</tr>
	</table>
</body>
</html>