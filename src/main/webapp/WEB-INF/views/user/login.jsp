<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.btn-primary {
  background-color: #ff6b00;
  border-color: #ff6b00;
  color: #ffffff; /* 버튼 텍스트 색상을 밝은 색상으로 설정 */}
.btn-link a {
  color: #ff6b00; /* 링크 텍스트 색상을 #ff6b00으로 설정 */}
.modal {
	text-align: center;}
@media screen and (min-width: 768px) { 
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;}
}
.modal-content {
	margin-left:36.7%;
	width:25%;}
.modal-dialog {
        display: inline-block;
        text-align: center;
        vertical-align: middle;
        width:100%;
}
</style>

<script>	
$(document).ready(function(){

// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
var key = getCookie("key");
$("#user_id").val(key); 
  
if($("#user_id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
}
  
$("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
    if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
        setCookie("key", $("#user_id").val(), 7); // 7일 동안 쿠키 보관
    }else{ // ID 저장하기 체크 해제 시,
        deleteCookie("key");
    }
});
  
// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
$("#user_id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
    if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
        setCookie("key", $("#user_id").val(), 7); // 7일 동안 쿠키 보관
    }
});

	$("#findid").click(function(){
		var name = $("#checkname").val()
		var phone = $("#checkphone").val()
		$.ajax({
			url: '/user/findid',
			type: 'POST',
			data: {user_name:name, phone:phone},
			success: function(result){ 
				console.log(result)
				$(".resultId").html("<span>찾으시는 아이디는 <b>"+result+"</b> 입니다.</span>")
			},
			error: function(xhr,status,error){ 
				console.log("실패") 
			}
		})
	});
	
	$("#findpwd").click(function(){
		var id = $("#checkpwdid").val()
		var name = $("#checkpwdname").val()
		var phone = $("#checkpwdphone").val()
		$.ajax({
			url: '/user/findpwd',
			type: 'POST',
			data: {user_id:id, user_name:name, phone:phone},
			success: function(result){ 
				console.log(result)
				$(".resultPwd").html("<span>찾으시는 비밀번호는 <b>"+result+"</b> 입니다.</span><br><span>로그인 후 비밀번호를 변경하세요.</span>")
			},
			error: function(xhr,status,error){ 
				console.log("실패") 
			}
		})
	});

}); // ready

function setCookie(cookieName, value, exdays){
var exdate = new Date();
exdate.setDate(exdate.getDate() + exdays);
var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
var expireDate = new Date();
expireDate.setDate(expireDate.getDate() - 1);
document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
cookieName = cookieName + '=';
var cookieData = document.cookie;
var start = cookieData.indexOf(cookieName);
var cookieValue = '';
if(start != -1){
    start += cookieName.length;
    var end = cookieData.indexOf(';', start);
    if(end == -1)end = cookieData.length;
    cookieValue = cookieData.substring(start, end);
}
return unescape(cookieValue);
}

// Flash 메시지 가져오기
var message = "${message}";

// 메시지가 존재하는 경우에만 처리
if (message) {
    // 메시지 출력
    alert(message);
}
</script>

<body>
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>로그인</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="/">Home</a>
                </li>
                <li class="is-marked">
                    <a href="login">로그인</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="page-account u-s-p-t-80 u-s-p-b-80">
    <div class="container">
        <div class="row">
            <!-- Login -->
            <div class="col-lg-12">
                <div class="login-wrapper">
                    <form action="login" method="post">
                        <div class="u-s-m-b-30">
                            <label for="user_id">아이디</label>
                            <input type="text" class="form-control" name="user_id" id="user_id">
                        </div>
                        <div class="u-s-m-b-30">
                            <label for="pwd">비밀번호</label>
                            <input type="password" class="form-control" name="pwd" id="pwd">
                        </div>
                        <div class="group-inline u-s-m-b-30">
                            <div class="group-1">
                                <input type="checkbox" id="idSaveCheck">
                                         아이디 기억하기
                            </div>
                            <div class="group-2 text-right">
                                <div class="page-anchor">
                                    <a class="findid" data-toggle="modal" data-target="#idModal"> 아이디 찾기</a>
                                        &nbsp;
                                    <a class="findpwd" data-toggle="modal" data-target="#pwdModal">비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                        <div class="m-b-45">
                            <button type="submit" class="btn btn-primary" id="loginButton">로그인</button>
                            <button class="btn btn-link"><a href="join">회원가입</a></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<div id="app">
	<!-- findid Modal -->
	<div class="modal fade" id="idModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
		    <div class="modal-content">
				<div class="modal-body">
					<div class="u-s-m-b-10">
						<label for="name">이름</label>
						<input type="text" name="name" id="checkname" placeholder="이름">
	                </div>
	                <div class="u-s-m-b-10">
						<label for="phone">전화번호</label>
						<input type="tel" name="phone" id="checkphone" placeholder="전화번호">
	                </div>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="findid">아이디 찾기</button>
				</div>
				<div class="resultId"></div>
			</div>
		</div>
	</div>
	
	<!-- findpwd Modal -->
	<div class="modal fade" id="pwdModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
		    <div class="modal-content">
				<div class="modal-body">
					<div class="u-s-m-b-10">
						<label for="id">아이디</label>
						<input type="text" name="id" id="checkpwdid" placeholder="아이디">
	                </div>
					<div class="u-s-m-b-10">
						<label for="name">이름</label>
						<input type="text" name="name" id="checkpwdname" placeholder="이름">
	                </div>
	                <div class="u-s-m-b-10">
						<label for="phone" >전화번호</label>
						<input type="tel" name="phone" id="checkpwdphone" placeholder="전화번호">
	                </div>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="findpwd">비밀번호 찾기</button>
				</div>
				<div class="resultPwd"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>