<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<style>
  .btn-primary {
  background-color: #ff6b00;
  border-color: #ffb600;
}

.btn-secondary {
  background-color: #ff6b00;
  border-color: #ffb600;
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#post_code").value = data.zonecode;
           document.querySelector("#addr").value =  data.address;
        }
    }).open();
}
</script>
<body>
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
       <div class="col-sm-13">
         <input type="button" value="우편번호찾기" onclick="kakaopost()" class="btn btn-default"><br>   
         <input type="text" id="post_code" name="post_code" placeholder="우편번호" class="form-control" />
         <input type="text" id="addr" name="addr" class="form-control" value="${vo.addr}"/><br>
         <input type="text" id="addr2" name="addr2" placeholder="상세주소" class="form-control" value="${vo.addr2}"/><br>
       </div>
       <button type="submit" class="btn btn-primary">회원수정</button>
       <a href="home" class="btn btn-secondary">홈으로가기</a>
       <a href="remove" class="btn btn-danger">탈퇴하러가기</a>
     </form>
   </div>
 </body>  
<%@ include file="../include/footer.jsp" %>