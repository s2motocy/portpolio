<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
button.btn-primary {
	background-color: #ff6b00;}
.container2 {
	width: 20%;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
<div id="app">
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>회원탈퇴</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="remove">회원탈퇴</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container2">
      <form method="post" action="remove">
        <div class="form-group">
          <label for="id">ID:</label>
          <input type="text" class="form-control" name="user_id" id="user_id">
        </div>
        <div class="form-group">
          <label for="pwd">pwd:</label>
          <input type="password" class="form-control" name="pwd" id="pwd">
        </div>
        <button type="submit" class="btn btn-primary">탈퇴하기</button>
      </form>
    </div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>
