<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>
	<h1>상품 상세 페이지(Detail)</h1>
	<form action="detail" method="post">
		<div>
			<div>
				<label for="category">
					<input type="text" name="category" id="category" placeholder="종류" />
				</label>
			</div>
		</div>
	</form>
</body>
</html>
