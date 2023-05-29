<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.form-label-group {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 1rem;}
.form-label-group input {
    width: 200px;
    height: 30px;
    padding: 5px;
    font-size: 1rem;
    border-radius: 5px;
    border: 1px solid #ccc;}
.form-label-group label {
    margin-top: 10px;
    font-size: 1rem;
    color: #999;}
.form-label-group input:focus,
.form-label-group input:valid {
    border-color: #ff6b00;}
.form-label-group input:focus+label,
.form-label-group input:valid+label {
    color: #ff6b00;}
.form-label-group input[type="button"] {
    margin-top: 10px;
    width: 150px;
    height: 30px;
    background-color: #ff6b00;
    color: #fff;
    cursor: pointer;}
</style>

<script type="text/javascript">
function updatePassword(){
    if(document.findpwd.pwd.value==""){
        alert("비밀번호를 입력해주세요.");
        document.findform.pwd.focus();
    } else if(document.findpwd.pwd.value != document.findpwd.pwd2.value){
        alert("비밀번호가 일치하지 않습니다.");
        document.findpwd.pwd2.focus();
    } else {
        document.findpwd.action="update_password";
        document.findpwd.submit();
        
        alert("비밀번호가 변경되었습니다.");
        self.close();
    }
}
</script>
    
<body>
<form action="login" method="post" name="findpwd">
    <div class="form-label-group">
        <input type="text" id="user_id" name="user_id2" value="${user_id}">
        <label for="userid">아이디</label>
    </div>
    <div class="form-label-group">
        <input type="password" id="pwd" name="pwd" class="form-control"/>
        <label for="password">비밀번호</label>
    </div>
    
    <div class="form-label-group">
        <input type="password" id="pwd2" name="pwd2" class="form-control"/>
        <label for="confirmpassword">비밀번호 확인</label>
    </div>
    
    <div class="form-label-group">
        <input type="button" value="update password" onclick="updatePassword()">
    </div>
</form>
</body>
<%@ include file="../include/footer.jsp" %>