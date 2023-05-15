<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Document</title>
</head>
<body>
    <form action="/user/login" method="post">
      아이디<input type="text" name="id"><br/>
      암호<input type="password" name="pwd"><br/>
      <input type="submit" value="로그인"><br/>
    </form>
</body>
</html>
