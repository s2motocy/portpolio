<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="../include/header.jsp" %>
<style>
button.btn-primary {
  background-color: #ff6b00;
}
.container2 {
  width: 50%;
  margin-left: auto;
  margin-right: auto;
}
</style>
<body>
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>마이페이지</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="mypage">마이페이지</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container2">
      <form action="update" method="get">
        <table class="table">
          <tbody>
            <tr>
              <td><div>이름</div></td>
              <td><div><input name="user_name" class="form-control" value="${vo.user_name}" readonly="readonly" /></div></td>
            </tr>
            <tr>
              <td><div>아이디</div></td>
              <td><div><input name="user_id" class="form-control" value="${vo.user_id}" readonly="readonly" /></div></td>
            </tr>
            <tr>
              <td><div>비밀번호</div></td>
              <td><div><input name="pwd" class="form-control" value="${vo.pwd}" readonly="readonly" /></div></td>
            </tr>
            <tr>
              <td><div>이메일</div></td>
              <td><div><input name="email" class="form-control" value="${vo.email}" readonly="readonly" /></div></td>
            </tr>
            <tr>
              <td><div>전화번호</div></td>
              <td><div><input name="phone" class="form-control" value="${vo.phone}" readonly="readonly" /></div></td>
            </tr>
            <tr>
              <td><div>주소</div></td>
              <td><div><input name="addr" class="form-control" value="${vo.addr}" readonly="readonly" /></div></td>
            </tr>
            <tr>
              <td><div>상세주소</div></td>
              <td><div><input name="addr2" class="form-control" value="${vo.addr2}" readonly="readonly" /></div></td>
            </tr>
          </tbody>
        </table>
        <button type="submit" class="btn btn-primary">수정하러가기</button>
        </form>
      <button class="btn-primary"><a href="buyList">구매내역 확인</a></button>
    </div>
</body>
<%@ include file="../include/footer.jsp" %>
