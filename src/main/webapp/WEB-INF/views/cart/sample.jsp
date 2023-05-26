<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}

.container {
  width: 800px;
  height: 600px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
}

form {
  width: 500px;
  height: 500px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

a {
  text-decoration: none;
  color: black;
}

h2 {
  color: tomato;
  font-size: 2em;
  padding: 20px;
}

hr {
  background-color: tomato;
  width : 90%;
}

input {
  width: 90%;
  height: 30px;
  border-radius: 30px;
  margin-top: 5px;
  font-weight : 5px;
  padding: 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_etc {
  padding: 10px;
  width: 30%;
  font-size: 8px;
  text-align:left;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}

button {
  margin-top: 20px;
  width: 100px;
  height: 35px;
  border: 0;
  outline: none;
  border-radius: 15px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  font-weight: bold;
  letter-spacing: 2px;
}
</style>
</head>
<body>
<div class="container">
<form action="login" method="post">
  <h2>로그인</h2>
  <hr>
  <br>
  <div>
    <label for="text">아이디</label><p>
    	<input type="text" name="user_id" />
  </div>
  <div>
    <label for="text">비밀번호</label><p>
    	<input type="password" name="pwd" />
  </div>
		
  <div class="login_etc">
    <a href="#">아이디 찾기</a>/
    <a href="#">비밀번호 찾기</a>
  </div>
  <div class="btn">
  	<button id="loginbtn">로그인</button>
    <button type="reset" id="rebtn">취소</button>
  </div>  
</form>
</div>
</body>
</html>
