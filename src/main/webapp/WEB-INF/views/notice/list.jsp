<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록페이지</title>
</head>
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
<body>
    <div class="table_wrap">
        <a href="/notice/enroll">게시판 등록</a>
        <table>
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
        <form id="moveForm" method="get">    
        </form>
    </div>
</body>
</html>