<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>
</head>
<body>
    <form method="post" action="remove">
        <p>
            <label>ID: <input type="text" name="id"></label>
        </p>
        <p>
            <label>pwd:<input type="text" name="pwd"></label>
        </p>
        <button type="submit">탈퇴하기</button>
    </form>
</body>
</html>