<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.btn-secondary {
  background-color: #ff6b00 !important;
  border-color: #ff6b00 !important;
  color: #ffffff !important; /* 버튼 텍스트 색상을 밝은 색상으로 설정 */}
.form-signin {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 50vh; /* 화면의 절반 높이로 설정합니다 */}
.form-label-group {
  margin-bottom: 20px;
  text-align: center;}
.btn-block {
  width: 50%; /* 버튼의 너비를 조정할 수 있습니다 */
  margin: 0 auto;}
button a {
  color: #ffb600;}
button a:hover {
  color: #ff6b00; /* 호버 시에도 동일한 색상 유지 */}
button {
  background: none;
  border: none;
  padding: 0;
  font: inherit;
  cursor: pointer;}
button:focus {
  outline: none;}
</style>

<script type="text/javascript">
function closethewindow() {
	self.close();
}
</script>

<body>
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>아이디 찾기</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="/">Home</a>
                </li>
                <li class="is-marked">
                    <a href="findid.jsp">아이디 찾기</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<form method="post" class="form-signin" action="findid" name="findid">
	<div class="form-label-group">
		<label for="name">이름</label>
		<input type="text" id="user_name" name="user_name" class="form-control"/>
	</div>
	
	<div class="form-label-group">
		<label for="phone">전화번호</label>
		<input type="text" id="phone" name="phone" class="form-control"/>
	</div>

	<div class="form-label-group">
		<input class="btn btn-lg btn-secondary btn-block text-uppercase" type="submit" value="Check">
	</div>

	<!-- 이름과 전화번호가 일치하지 않을 때-->
	<c:if test="${check == 1}">
		<script>
			opener.document.findid.name.value = "";
			opener.document.findid.phone.value = "";
		</script>
		<label>일치하는 정보가 존재하지 않습니다.</label>
	</c:if>

	<!-- 이름과 비밀번호가 일치하지 않을 때 -->
	<c:if test="${check == 0 }">
		<label>찾으시는 아이디는 '${id}' 입니다.</label>
		<button><a href="login">로그인 하러가기</a></button>
	</c:if>
</form>
<!-- FAQ-Page /- -->
</body>
<%@ include file="../include/footer.jsp" %>
