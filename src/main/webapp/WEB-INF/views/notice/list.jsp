<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<style>
.btn-write {
	boder:none;
	color:white;
    background-color: #ff6b00;}
#content {
	display: inline-block; 
    width: 150px;
    overflow: hidden; 
    white-space: nowrap; 
    text-overflow: ellipsis;}
</style>

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
                    <a href="faq.html">목록</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
    <div class="table_wrap">
        <table class="table">
            <thead>
            	<tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>내용</th>
	                <th>작성일</th>
                </tr>
            </thead>
            <c:forEach var="list" items="${list1}">
                <tr>
                    <td><c:out value="${list.bno}" /></td>
                    <td>
                        <a class="move" href='/notice/get?bno=${list.bno}'>${list.title}</a>
                    </td>
                    <td>
                        <a class="move" href='/notice/get?bno=${list.bno}' id="content">${list.content}</a>
                    </td>
                    <td>
                        <fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}" />
                    </td>
                </tr>
            </c:forEach>
        </table>
        <c:if test="${admin == 'a'}">
            <a href="/notice/enroll" class="btn btn-write">게시판 등록</a>
        </c:if>
    </div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>