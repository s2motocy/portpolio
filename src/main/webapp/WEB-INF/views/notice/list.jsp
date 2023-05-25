<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ include file="../include/header.jsp" %>
    <style>
        .btn-primary {
  background-color: #ff6b00;
  /* 다른 스타일 옵션들 */
}
    </style>
    <body>
        <div class="page-style-a">
            <div class="container">
                <div class="page-intro">
                    <h2>공지사항 목록</h2>
                    <ul class="bread-crumb">
                        <li class="has-separator">
                            <i class="ion ion-md-home"></i>
                            <a href="/">Home</a>
                        </li>
                        <li class="is-marked">
                            <a href="faq.html">공지사항 목록</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="table_wrap">
                <table class="table">
                    <thead>
                        <th class="bno">번호</th>
                        <th class="title">제목</th>
                        <th class="id">아이디</th>
                        <th class="regdate">작성일</th>
                        <th class="updateDate">수정일</th>
                    </thead>
                    <c:forEach var="list" items="${list1}">
                        <tr>
                            <td><c:out value="${list.bno}"/></td>
                            <td>
                                <a class="move" href='/notice/get?bno=<c:out value="${list.bno}"/>'>
                                    <c:out value="${list.title}"/>
                                </a>
                            </td>
                            <td><c:out value="${list.writer}"/></td>
                            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <a href="/notice/enroll" class="btn btn-primary">게시판 등록</a>
            </div>
        </div>
    <script>
        $(document).ready(function(){
            let result = '<c:out value="${result}"/>';
            checkAlert(result);
            function checkAlert(result){
                if(result === ''){
                    reutrn;
                }
                if(result === "create success"){
                    alert("등록이 완료되었습니다.");
                }
                
                if(result === "modify success"){
                    alert("수정이 완료되었습니다.");
                }
                if(result === "delete success"){
                alert("삭제가 완료되었습니다.");
                }    
            }
            let moveForm = $("#moveForm");
     
            $(".move").on("click", function(e){
                e.preventDefault();
                
                moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
                moveForm.attr("action", "/notice/get");
                moveForm.submit();
            });
        });
    </script>
    </body>
    <%@ include file="../include/footer.jsp" %>