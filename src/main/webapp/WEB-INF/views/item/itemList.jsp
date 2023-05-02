<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 리스트</title>
</head>
 <script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
 <script>
 
 let form = $("#itemid");
 
 /* 수정 하기 버튼 */
 $("#btn btn-update").on("click", function(e){
	 form.attr("action", "/item/update");
     form.submit();
 });
 
 /* 취소 버튼 */
 $("#cancel_btn").on("click", function(e){
     form.attr("action", "/board/get");
     form.submit();
 });    
 </script>
<body>
<table>
	<c:forEach var="list" items="${list}">
			<form action="" id="itemid">	
			<tr>
			<input type="hidden" name="ino" value="${list.itemid}" >
				<td>${list.itemid}</td>
				<td>${list.category}</td>
				<td>${list.name}</td>
				<td>${list.price}</td>
				<td>${list.description}</td>
				
				<td><input type="button" value="수정" class="btn btn-update" id="update"/></td>
				<td><input type="button" value="삭제" class="btn btn-danger" id="delete"/></td>
			</tr>
			</form>
	</c:forEach>
</table>
</body>
</html>