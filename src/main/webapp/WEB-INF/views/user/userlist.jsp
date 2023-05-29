<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<style>
.container{
	margin-top:10px;}
</style>
<script>
	$(document).ready(function () {
		$("button#deletebtn").each(function (idx, data) {
			$(this).click(function (e) {
				var confirmation = confirm("정말로 삭제하시겠습니까?");
				if (confirmation) {
					// 확인 버튼 클릭 시 동작
					alert("삭제되었습니다.");
				} else {
					// 취소 버튼 클릭 시 동작
					e.preventDefault();
					alert("취소했습니다.");
				}
			}) // click
		}) // each
	}) // ready
</script>
<body>
<div class="page-style-a">
	<div class="container">
        <div class="page-intro">
            <h2>회원목록</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="/">Home</a>
                </li>
                <li class="is-marked">
                    <a href="userlist">회원목록</a>
                </li>
            </ul>
        </div>
    </div>
</div>
 <div class="container">
   <form action="userlist" method="get">
     <table class="table table-hover">
       <thead>
         <tr>
			<th>회원 번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
         </tr>
       </thead>
       <tbody>
         <c:forEach var="list" items="${list1}">
           <tr>
             <td>${list.uno}</td>
             <td>${list.user_name}</td>
             <td>${list.user_id}</td>
             <td>${list.pwd}</td>
             <td>${list.email}</td>
             <td>${list.phone}</td>
             <td>${list.post_code}</td>
             <td>${list.addr}</td>
             <td>${list.addr2}</td>
             <td><a href="delete?uno=${list.uno}" id="delete"><button id="deletebtn" type="button" class="btn btn-danger">삭제</button></a></td>
           </tr>
         </c:forEach>
       </tbody>
     </table>
   </form>
 </div>
</body>
<%@ include file="../include/footer.jsp" %>