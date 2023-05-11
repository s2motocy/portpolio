<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
<script  src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<h1>수정 페이지</h1>
    <form id="modifyForm" action="/notice/modify" method="post">
        <div class="input_wrap">
            <label>게시판 번호</label>
            <input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >
        </div>
        <div class="input_wrap">
            <label>게시판 제목</label>
            <input name="title" value='<c:out value="${pageInfo.title}"/>' >
        </div>
        <div class="input_wrap">
            <label>게시판 내용</label>
            <textarea rows="3" name="content"><c:out value="${pageInfo.content}"/></textarea>
        </div>
        <div class="input_wrap">
            <label>게시판 작성자</label>
            <input name="id" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' >
        </div>
       
        <div class="btn_wrap">
          <a class="btn" id="list_btn">목록 페이지</a> 
             <a class="btn" id="cancel_btn">수정 취소</a>
            <a class="btn" id="delete_btn">삭제</a>
            <input type='submit' value='수정 완료'/>
        </div>
    </form>
	<form id="infoForm" action="/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
	</form>
<script>
    let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
    let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
    
    /* 목록 페이지 이동 버튼 */
    $("#list_btn").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/notice/list");
        form.submit();
    });
    
    /* 수정 하기 버튼 */
    $("#modify_btn").on("click", function(e){
        mForm.submit();
    });
    
    /* 취소 버튼 */
    $("#cancel_btn").on("click", function(e){
        form.attr("action", "/notice/get");
        form.submit();
    });  
     /* 삭제 버튼 */
     $("#delete_btn").on("click", function(e){
        form.attr("action", "/notice/delete");
        form.attr("method", "post");
        form.submit();
    });
</script>
</body>
</html>