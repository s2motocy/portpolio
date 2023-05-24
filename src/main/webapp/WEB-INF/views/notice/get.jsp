<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %> 
<!DOCTYPE html>
<html class="no-js" lang="en-US">
<style>
.form-group {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.form-control {
  width: 50%; /* 폼 요소의 너비를 화면의 절반으로 설정합니다 */
  margin: 0 auto; /* 가운데 정렬을 위해 수평 마진을 자동으로 설정합니다 */
}

.btn_wrap {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.btn {
  margin-right: 10px;
  background-color: #ff6b00;
}
</style>
<body>
<div id="app">
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
                        <a href="get">게시판 조회</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label>게시판 번호</label>
        <input class="form-control" name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>'>
    </div>
    <div class="form-group">
        <label>게시판 제목</label>
        <input class="form-control" name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>'>
    </div>
    <div class="form-group">
        <label>게시판 내용</label>
        <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
    </div>
    <div class="form-group">
        <label>게시판 작성자</label>
        <input class="form-control" name="id" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>'>
    </div>
    <div class="form-group">
        <label>게시판 등록일</label>
        <input class="form-control" name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'>
    </div>
    <div class="form-group">
        <label>게시판 수정일</label>
        <input class="form-control" name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>'>
    </div>
    <div class="btn_wrap">
        <a class="btn btn-primary" id="list_btn">목록 페이지</a>
        <a class="btn btn-primary" id="modify_btn">수정 하러가기</a>
    </div>
    <form id="infoForm" action="/notice/modify" method="get">
        <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
    </form>
    </div>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/notice/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/notice/modify");
		form.submit();
	});	
</script>
</body>
<%@ include file="../include/footer.jsp" %>
