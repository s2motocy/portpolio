<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<style>
    .btn-secondary {
  background-color: #ff6b00;
  color: #ffffff; /* 버튼 텍스트 색상을 밝은 색상으로 설정 */
}
.form-signin {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 50vh; /* 화면의 절반 높이로 설정합니다 */
  text-align: center;
}

.form-label-group {
  margin-bottom: 20px;
}

.form-control {
  width: 100%; /* 폼 요소의 너비를 화면의 절반으로 설정합니다 */
}

.btn-block {
  width: 50%; /* 버튼의 너비를 조정할 수 있습니다 */
  margin: 0 auto;
}
</style>
<body>
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>비밀번호 찾기</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="findpwd">비밀번호 찾기</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
	<form method="post" class="form-signin" action="findpwd" name="findpwd">
        <div class="form-label-group">
            <label for="user_id">ID</label>
            <input type="text" id="user_id" name="user_id" class="form-control"/>
        </div>
        
        <div class="form-label-group">
            <label for="phone">phone</label>
            <input type="text" id="phone" name="phone" class="form-control"/>
        </div>

        <div class="form-label-group">
            <input class="btn btn-lg btn-secondary btn-block text-uppercase"
                type="submit" value="check">
        </div>

        <!-- 정보가 일치하지 않을 때-->
        <c:if test="${check == 1}">
            <script>
            opener.document.findpwd.id.value = "";
                opener.document.findpwd.name.value = "";
                opener.document.findpwd.phone.value = "";
            </script>
            <label>일치하는 정보가 존재하지 않습니다.</label>
        </c:if>

        <!-- 이름과 전화번호가 일치할떄 -->
        <c:if test="${check == 0 }">
            <a href="update_password">비밀번호 바꾸러가기</a>
        </c:if>
    </form>
</body>
<%@ include file="../include/footer.jsp" %>
