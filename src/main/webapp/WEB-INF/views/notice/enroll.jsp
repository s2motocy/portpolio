<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록페이지</title>
</head>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<body>
    <form action="enroll" method="post">
        <div class="input_wrap">
            <label>Title</label>
            <input name="title">
        </div>
        <div class="input_wrap">
            <label>Content</label>
            <textarea rows="3" name="content"></textarea>
        </div>
        <div class="input_wrap">
            <label>Writer</label>
            <input name="writer">
        </div>
        <button>등록</button>
    </form>
</body>
</html>