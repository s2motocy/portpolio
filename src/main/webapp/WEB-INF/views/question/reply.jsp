<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 작성</title>
</head>
<body>
    <h1>답글 작성</h1>
    <form id="replyForm" action="/question/reply" method="post">
      <input type="hidden" name="parentQno" value="${parentQno}">
      <input type="hidden" name="pageNum" value="${pageNum}">
      <input type="hidden" name="amount" value="${amount}">
      <input type="hidden" name="keyword" value="${keyword}">
      <input type="hidden" name="type" value="${type}">
      <div class="input_wrap">
        <label>답글 내용</label>
        <textarea rows="3" name="replyContent"></textarea>
      </div>
      <div class="btn_wrap">
        <button type="submit" class="btn">답글 작성</button>
      </div>
    </form>
</body>
</html>
