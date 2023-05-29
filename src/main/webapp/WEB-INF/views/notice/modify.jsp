<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<style>
.container {
	margin-top:10px;}
label {
	display: block;
	font-weight: bold;}
#modifyForm {
	text-align:center;}
.form-control,
.input-notice,
textarea {
	width: 30%;
	padding: 10px;
	margin:0 auto;
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
<script>
 $(document)ready(function(e){
	 let form = $("#infoForm");
     let mForm = $("#modifyForm");

     /* 목록 페이지 이동 버튼 */
     $("#list_btn").on("click", function (e) {
         form.find("#bno").remove();
         form.attr("action", "/notice/list");
         form.submit();
     });
     
     /* 취소 버튼 */
     $("#cancel_btn").on("click", function (e) {
         form.attr("action", "/notice/get");
         form.submit();
     });
     /* 삭제 버튼 */
     $("#delete_btn").on("click", function (e) {
         form.attr("action", "/notice/delete");
         form.attr("method", "post");
         form.submit();
     });	 
 });
       
</script>
<body>
 <div class="page-style-a">
     <div class="container">
         <div class="page-intro">
             <h2>공지사항</h2>
             <ul class="bread-crumb">
                 <li class="has-separator">
                     <i class="ion ion-md-home"></i>
                     <a href="/">Home</a>
                 </li>
                 <li class="is-marked">
                     <a href="modify">수정</a>
                 </li>
             </ul>
         </div>
     </div>
 </div>
 <div class="container">
 <form id="modifyForm" action="/notice/modify" method="post">
   	<div class="form-group">
        <label>게시판 번호</label>
        <input class="form-control" name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>'>
    </div>
    <div class="form-group">
        <label>게시판 제목</label>
        <input class="input-notice" name="title" value='<c:out value="${pageInfo.title}"/>'>
    </div>
    <div class="form-group">
        <label>게시판 내용</label>
        <textarea class="input-notice" rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
    </div>
    <div class="form-group">
        <label>게시판 등록일</label>
        <input class="form-control" name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'>
    </div>
    <div class="btn_wrap">
        <button id="list_btn">목록</button>
    	<button id="cancel_btn">취소</button>
    	<button id="delete_btn">삭제</button>
    	<button id="good_btn">완료</button>
    </div>
    </form>
    <form id="infoForm" action="/notice/modify" method="get">
        <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
    </form>
  </div>
</body>
<%@ include file="../include/footer.jsp" %>