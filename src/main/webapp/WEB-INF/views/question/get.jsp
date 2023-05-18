<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
</style>
</head>
<body>
<h1>조회 페이지</h1>
<div class="input_wrap">
  <label>문의 번호</label>
  <input name="qno" readonly="readonly" value='<c:out value="${pageInfo.qno}"/>'>
</div>
<div class="input_wrap">
  <label>문의 제목</label>
  <input name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>'>
</div>
<div class="input_wrap">
  <label>문의 내용</label>
  <textarea rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
</div>
<div class="input_wrap">
  <label>문의 작성자</label>
  <input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>'>
</div>
<div class="input_wrap">
  <label>문의 등록일</label>
  <input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.writedate}"/>'>
</div>
<div class="input_wrap">
  <label>문의 수정일</label>
  <input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>'>
</div>
<div class="btn_wrap">
  <a class="btn" id="list_btn">문의 페이지</a>
  <a class="btn" id="modify_btn">수정 하기</a>
  <a class="btn" id="reply_btn">답글 작성</a>
</div>
<form id="infoForm" action="/question/modify" method="get">
  <input type="hidden" id="qno" name="qno" value='<c:out value="${pageInfo.qno}"/>'>
  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
  <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
  <input type="hidden" name="keyword" value="${cri.keyword}">
  <input type="hidden" name="type" value="${pageMaker.cri.type}">
</form>
<form id="replyForm" action="/question/reply" method="post">
  <input type="hidden" name="parentQno" value='<c:out value="${pageInfo.qno}"/>'>
  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
  <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
  <input type="hidden" name="keyword" value="${cri.keyword}">
  <input type="hidden" name="type" value="${pageMaker.cri.type}">
</form>
<script>
  let form = $("#infoForm");
  let replyForm = $("#replyForm");
  const isAdmin = true; // 여기에 관리자 여부를 판단하는 로직을 추가해주세요.

  $("#list_btn").on("click", function (e) {
    form.find("#qno").remove();
    form.attr("action", "/question/list");
    form.submit();
  });
  $("#modify_btn").on("click", function (e) {
    form.attr("action", "/question/modify");
    form.submit();
  });
  $("#reply_btn").on("click", function (e) {
    if (isAdmin) {
      replyForm.submit();
    } else {
      alert("관리자만 답글을 작성할 수 있습니다.");
    }
  });
</script>

</body>
</html>