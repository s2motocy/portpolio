<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<style>
  .btn-primary {
  background-color: #ff6b00;
  border-color: #ff6b00;
}

.btn-secondary {
  background-color: #ff6b00;
  border-color: #ff6b00;
}

.btn-danger {
  background-color: #ff6b00;
  border-color: #ff6b00;
}
.container2 {
  width: 30%;
  margin-left: auto;
  margin-right: auto;
}
</style>
    <body>
    <div id="app">
        <div class="page-style-a">
            <div class="container">
                <div class="page-intro">
                    <h2>회원수정</h2>
                    <ul class="bread-crumb">
                        <li class="has-separator">
                            <i class="ion ion-md-home"></i>
                            <a href="/">Home</a>
                        </li>
                        <li class="is-marked">
                            <a href="update">회원수정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container2">
          <form method="post" action="update">
            <div class="form-group">
              <label for="name">Name:</label>
              <input type="text" class="form-control" name="user_name" value="${vo.user_name}">
            </div>
            <div class="form-group">
              <label for="id">ID:</label>
              <input type="text" class="form-control" name="user_id" value="${vo.user_id}" readonly="readonly">
            </div>
            <div class="form-group">
              <label for="pwd">Password:</label>
              <input type="text" class="form-control" name="pwd" value="${vo.pwd}">
            </div>
            <div class="form-group">
              <label for="email">Email:</label>
              <input type="email" class="form-control" name="email" value="${vo.email}">
            </div>
            <div class="form-group">
              <label for="phone">Phone Number:</label>
              <input type="tel" class="form-control" name="phone" value="${vo.phone}">
            </div>
            <div class="form-group">
              <label for="addr">Address:</label>
              <input type="text" class="form-control" name="addr" value="${vo.addr}">
            </div>
            <div class="form-group">
              <label for="addr2">More Address:</label>
              <input type="text" class="form-control" name="addr2" value="${vo.addr2}">
            </div>
            <button type="submit" class="btn btn-primary">회원수정</button>
            <a href="home" class="btn btn-secondary">홈으로가기</a>
            <a href="remove" class="btn btn-danger">탈퇴하러가기</a>
          </form>
        </div>
<%@ include file="../include/footer.jsp" %>
    