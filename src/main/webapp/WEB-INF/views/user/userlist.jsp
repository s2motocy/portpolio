<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<style>
  button.btn-primary {
    background-color: #ff6b00;
  }
</style>
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
        <h2>모든 회원보기</h2>
        <form action="userlist" method="get">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col" width="150" align="center">이름</th>
                <th scope="col" width="200" align="center">아이디</th>
                <th scope="col" width="150" align="center">비밀번호</th>
                <th scope="col" width="200" align="center">이메일</th>
                <th scope="col" width="100" align="center">전화번호</th>
                <th scope="col" width="100" align="center">잡전화번호</th>
                <th scope="col" width="100" align="center">주소</th>
                <th scope="col" width="100" align="center">상세주소</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="list" items="${list1}">
                <tr>
                  <td align="center">${list.user_name}</td>
                  <td align="center">${list.user_id}</td>
                  <td align="center">${list.pwd}</td>
                  <td align="center">${list.email}</td>
                  <td align="center">${list.phone}</td>
                  <td align="center">${list.addr}</td>
                  <td align="center">${list.addr2}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <button type="submit" class="btn btn-primary">홈으로</button>
        </form>
      </div>
</body>
<%@ include file="../include/footer.jsp" %>
    