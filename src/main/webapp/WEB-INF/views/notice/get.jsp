<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<style>
.container {
	margin-top:10px;}
.form-group {
    display: flex;
    flex-direction: column;
    text-align: center;}
.form-control {
    width: 30%;
    margin: 0 auto;}
.btn_wrap {
    display: flex;
    justify-content: center;
    margin-top: 20px;}
#list_btn,
#modify_btn	{
	color:white;
    boder:none;
    margin-right: 10px;
    background-color: #ff6b00;}
</style>

<script>
$(document).ready(function(e){
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
});
</script>

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
                        <a href="get">조회</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
	<div class="container">
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
			<label>게시판 등록일</label>
			<input class="form-control" name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'>
		</div>
		<div class="btn_wrap">
			<a class="btn btn-list" id="list_btn">목록 페이지</a>
			<c:if test="${admin == 'a'}">
			<a class="btn btn-modify" id="modify_btn">수정</a>
			</c:if>
		</div>
		<form id="infoForm" action="/notice/modify" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		</form>
    </div>   
</div>
</body>
<%@ include file="../include/footer.jsp" %>