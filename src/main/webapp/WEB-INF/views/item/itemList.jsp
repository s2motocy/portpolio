<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
</head>
<style>
table, tr, th {
	border: 1px solid black
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
<script>
$(document).ready(function(){
	$("img").each(function(idx, data){
		var r = $(this).attr('src')
		u= r.replaceAll('\\', '/')
		$(this).attr('src', u )
	})
	
 })
 </script>
<body>
<table>
	<tr>
		<th>상품 사진</th>
		<th>상품 분류</th>
		<th>상품 이름</th>
		<th>상품 가격</th>
	</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td><img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}"/></td>
			<td>${list.category}</td>
			<td><a href="detail?itemid=${list.itemid}">${list.name}</a></td>
			<td>${list.price}</td>
		</tr>
		
	</c:forEach>
</table>
</body>
</html>
