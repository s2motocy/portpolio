<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
 <style>
.container {
	margin-top:10px;}
label {
	display: block;
	font-weight: bold;}
input[type="text"],
textarea {
	width: 30%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;}
button {
	margin-top:10px;
	padding: 10px 20px;
	background-color: #ff6b00;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;}
</style>
<body>
  <div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>공지 사항</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="home.html">Home</a>
                </li>
                <li class="is-marked">
                    <a href="single-product.html">등록</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <form action="enroll" method="post">
      <div class="form-group">
        <label for="title">제목:</label>
        <input type="text" class="form-control" name="title">
      </div>
      <div class="form-group2">
        <label for="content">내용:</label>
        <textarea class="form-control" rows="3" name="content"></textarea>
      </div>
      <button type="submit">등록</button>
    </form>
  </div>
</body>
<%@ include file="../include/footer.jsp" %>