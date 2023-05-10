<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
<h3>신규 QNA</h3>
<script>
	$(document).ready(function(){
		
		
		$(".btn-primary").click(function(e){
			e.preventDefault();
			console.log("문자");
			$(".sad").submit();
		});
		
	});
</script>

<form action="/Qna/new" method="post" class="sad">
	<table>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" value="rlagmltn"></td>
		</tr>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn btn-primary" href="">등록</a>
	<a class="btn-empty" href="index">취소</a>
</div>
</body>
</html>