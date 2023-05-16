<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>문의 등록</h1>
<form action="/board/enroll" method="post">
	<div class="input_wrap">
		<label>제목</label>
		<input name="title">
	</div>
	<div class="input_wrap">
		<label>내용</label>
		<textarea rows="3" name="content"></textarea>
	</div>
	<div class="input_wrap">
		<label>글쓴이</label>
		<input name="writer">
	</div>
	<button class="btn">등록</button>
</form>
</body>
</html>