<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	송장 번호:
	<form action="/guest/OrderInquiry" method="post">
		<input type="text" name="envoice_no">
		<input type="text" name="name">
		<input type="text" name="pwd">
		<input type="submit" value="조회"/>
	</form>
</body>
</html>