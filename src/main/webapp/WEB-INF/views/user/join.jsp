<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.container {
	margin-top:10px;}
#signupForm {
  width: 500px;
  height: 900px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-weight:bold;}
.update_cul {
  margin-top: 20px;
  width: 80%;}
.user-input{
  width: 90%;
  height: 3px;
  border-radius: 15px;
  margin-top: 5px;
  padding:15px;
  border: 1px solid lightgray;
  outline: none;}
#post {
  width: 95px;
  height: 33px;
  border-radius: 15px;
  margin-top: 5px;
  padding:12px;
  font-size: 4px;
  right: 0;}
#post_code {
  width: 100px;
  height: 3px;
  border-radius: 30px;
  margin-top: 5px;
  padding:15px;
  border: 1px solid lightgray;
  outline: none;}
.address, .mail_check_button {
  width: 30%;
  border-radius: 30px;
  margin-top: 10px;
  padding:auto;
  border: 1px solid lightgray;
  outline: none;}
.btn{
  width: 80%;
  margin-left:40px}
.btn-re, .btn-join {
	margin-top: 30px;
	width: 40%;
	height: 40px;
	border: 0;
	outline: none;
	border-radius: 20px;
	background-color:#ff6b00;
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;}
.mail_input{
  width: 59%;
  height: 3px;
  border-radius: 15px;
  margin-top: 5px;
  padding:15px;
  border: 1px solid lightgray;
  outline: none;}
#mail_check_input_box_false{
    background-color:#ebebe4;} 
#mail_check_input_box_true{
    background-color:white;}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	/* 정규표현식 */
    let checkNum = /[0-9]/;
    let checkEng = /[a-zA-Z]/;
    let checkSpc = /[~!@#$%^&*()_+|<>?:;{}"']/;
    let checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ]/;
    let checkKor2 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    let checkPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1}|0[6-8]0|050[2-9]{1})([0-9]{3,4})([0-9]{4})$/;
    let checkName = RegExp(/^[가-힣]{2,6}$/);
    let checkId = RegExp(/^[a-zA-Z0-9]{3,16}$/);
    let checkPwd = RegExp(/^[a-zA-Z0-9~!@#$%^&*()_+|<>?:;{}"']{10,20}$/);
    /* 유효성검사(이름) */
   	$("input[name=user_name]").blur(function(){
   		let user_name = $("input[name=user_name]").val()
   		let re = $(".name_input_re")
   		if(user_name=="") {
			re.text("이름을 입력해주세요.").css("color", "gray")
		} else if(checkSpc.test(user_name)) {
			re.text("특수문자가 포함되어있습니다.").css("color", "gray")
		} else if(user_name.includes(" ")) {
			re.text("띄어쓰기가 들어있습니다.").css("color", "gray")
		} else if(checkNum.test(user_name)) {
			re.text("숫자가 포함되어있습니다.").css("color", "gray")
		} else if(checkEng.test(user_name)) {
			re.text("영어가 포함되어있습니다.").css("color", "gray")
		} else if(checkKor.test(user_name)) {
			re.text("사용할 수 없는 글자가 포함되어있습니다.").css("color", "gray")
		} else if(!checkName.test(user_name)) {
			re.text("2자이상 6자 이하 로 작성하세요").css("color", "gray")
		} else {
			re.text("사용가능한 이름입니다.").css("color", "#3f8ef7");
		}
	});
   	/* 유효성검사(아이디) */
   	$("input[name=user_id]").blur(function(){
   		let user_id = $("input[name=user_id]").val()
   		let re = $(".id_input_re")
   		if(user_id=="") {
   			re.text("아이디를 입력해주세요.").css("color","gray")
   		} else if(checkSpc.test(user_id)) {
   			re.text("특수문자가 포함되어있습니다.").css("color","gray")
   		} else if(checkKor2.test(user_id)) {
   			re.text("한글이 포함되어있습니다.").css("color","gray")
   		} else if(!checkId.test(user_id)) {
   			re.text("3자이상 16자 이하 로 작성하세요").css("color","gray")
   		} else {
   			checkID(user_id, function(){
   				re.text("중복된 아이디 입니다.").css("color","gray")
   			}, function(){
   				re.text("사용가능한 아이디입니다.").css("color", "#3f8ef7");
   			})
   		}
   	})
   	/* 유효성검사(비밀번호1) */
   	$("input[name=pwd]").blur(function(){
   		let pwd = $("input[name=pwd]").val()
   		let re = $(".pwd_input_re")
   		if(pwd=="") {
   			re.text("비밀번호를 입력해주세요.").css("color","gray")
   		} else if(pwd.includes(" ")) {
   			re.text("띄어쓰기가 들어있습니다.").css("color","gray")
   		} else if(checkKor2.test(pwd)) {
   			re.text("한글이 포함되어있습니다.").css("color","gray")
   		} else if(!checkPwd.test(pwd)) {
   			re.text("10자이상 20자 이하 로 작성하세요.").css("color","gray")
   		} else {
   			re.text("사용가능한 비밀번호입니다.").css("color", "#3f8ef7");
   		}
   	})
   	/* 유효성검사(비밀번호2) */
   	$("input[name=pwd2]").blur(function(){
   		let pwd = $("input[name=pwd]").val()
   		let pwd2 = $("input[name=pwd2]").val()
   		let re2 = $(".pwd2_input_re")
   		if(pwd2=="") {
   			re2.text("비밀번호를 입력해주세요.").css("color","gray")
   		} else if(pwd.includes(" ")) {
   			re2.text("띄어쓰기가 들어있습니다.").css("color","gray")
   		} else if(checkKor2.test(pwd)) {
   			re2.text("한글이 포함되어있습니다.").css("color","gray")
   		} else if(!checkPwd.test(pwd)) {
   			re2.text("10자이상 20자 이하 로 작성하세요.").css("color","gray")
   		} else if(pwd != pwd2) {
   			re2.text("비밀번호가 일치하지 않습니다.").css("color","gray")
   		} else {
   			re2.text("비밀번호가 일치합니다.").css("color", "#3f8ef7");
   		}
   	})
   	/* 유효성검사(연락처) */
   	$("input[name=phone]").blur(function(){
   		let phone = $("input[name=phone]").val()
   		let transPhone = phone.replaceAll("-","")
   		let re = $(".phone_input_re")
   		if(phone=="" || transPhone==""){
   			re.text("연락처를 입력해주세요").css("color","gray")
   		} else if(transPhone.length <10 && transPhone.length >11){
   			re.text("유효하지 않은 번호입니다.").css("color","gray")
   		} else if(checkPhone.test(transPhone)){
   			transPhone = transPhone.replace(checkPhone,"$1-$2-$3")
   			$("input[name=phone]").val(transPhone)
   			re.text("사용가능한 번호입니다.").css("color", "#3f8ef7");
   		} else {
   			re.text("값이 올바르지 않습니다.").css("color","gray")
   		}
   	})
    /* 인증번호 이메일 전송 */
    $(".mail_check_button").click(function(){
    	var email = $(".mail_input").val()				// 입력한 이메일
    	var checkBox = $(".mail_check_input")			// 인증번호 입력란
    	var boxWrap = $("input[id^=mail_check_input]")	// 인증번호 입력란 박스
    	var warnMsg = $(".mail_input_box_warn")			// 이메일 입력 경고글
    	console.log("emailcheck",email)
    	/* 이메일 형식 유효성 검사 */
    	if(mailFormCheck(email)){
    		warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.")
    		warnMsg.css("display", "inline-block")
    	} else {
    		warnMsg.html("올바르지 못한 이메일 형식입니다.")
    		warnMsg.css("display", "inline-block")
    		return false;
    	}
    	$.ajax({	
    		type:"GET",
    		url:"mailCheck?email=" + email,
    		success:function(data){
    			checkBox.attr("disabled",false);
    			boxWrap.attr("id", "mail_check_input_true");
    			code = data
    		}		
    	})	// ajax
    }) // click button
    /* 인증번호 비교 */
    $(".mail_check_input").blur(function(){
    	console.log("인증번호 비교 ")
    	var inputCode = $(".mail_check_input").val();		// 입력코드	
    	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
    	console.log("어기들어온다" ,inputCode , checkResult)
    	if(inputCode == code){							// 일치할 경우
    		checkResult.html("인증번호가 일치합니다.").css("color", "#3f8ef7");	
    		checkResult.attr("class", "correct");		
    		mailnumCheck = true;
    	} else {											// 일치하지 않을 경우
    		checkResult.html("인증번호를 다시 확인해주세요.").css("color","gray");
    		checkResult.attr("class", "incorrect");
    		mailnumCheck = false;
    	}
    });
   	
   	$("button[type=submit]").click(function(e){
   		e.preventDefault()
   		let name = $(".name_input_re")
   		let id = $(".id_input_re")
   		let pwd = $(".pwd_input_re")
   		let pwd2 = $(".pwd2_input_re")
   		let phone = $(".phone_input_re")
   		let code = $("#mail_check_input_box_warn")
   		if(name.css("color") !="rgb(63, 142, 247)"){
   			$("input[name=user_name]").focus()
   		} else if(id.css("color") != "rgb(63, 142, 247)"){
   			$("input[name=user_id]").focus()
   		} else if(pwd.css("color") !="rgb(63, 142, 247)"){
   			$("input[name=pwd]").focus()
   		} else if(pwd2.css("color") !="rgb(63, 142, 247)"){
   			$("input[name=pwd2]").focus()
   		} else if(phone.css("color") !="rgb(63, 142, 247)"){
   			$("input[name=phone]").focus()
   		} else if(code.css("color") !="rgb(63, 142, 247)"){
   			$("input[class=mail_check_input]").focus()
   		} else {
   			alert("가입이 완료되었습니다.")
   			$("form").submit()
   		}
   	})
}) // ready
function checkID(user_id, OK, NO){
	var user_id = user_id
	$.ajax({
		type : "post",
		url : "/user/userIdCheck",
		data : {user_id : user_id},
		success : function(result){
			if(result === "success"){
				OK();
			} else {
				NO();
			}
		}
	})
}
function mailFormCheck(email){
	console.log('form check: ',email)
    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return form.test(email);
}
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
			<h2>회원 가입</h2>
			<ul class="bread-crumb">
				<li class="has-separator">
					<i class="ion ion-md-home"></i>
					<a href="/">Home</a>
				</li>
				<li class="is-marked">
					<a href="#">회원가입</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="container">
  <div class="update_content">
    <div>
    	<form action="join" method="post" id="signupForm">
    		<div class="update_cul">
				<label for="name">*이름</label><br>
            	<input type="text" class="user-input" name="user_name" id="user_name" placeholder="이름 입력" required/>
	        </div>
	        <span class="name_input_re"></span>
	        
	        <div class="update_cul">
				<label for="id">*아이디</label><br>
            	<input type="text" class="user-input" name="user_id" id="user_id"  placeholder="아이디 입력" required/>
	        </div>
	        <span class="id_input_re"></span>
	        
	        <div class="update_cul">
			<label for="pwd">*비밀번호</label> 
			<input type="password" class="user-input" name="pwd" id="pwd" placeholder="비밀번호 입력" maxlength="20" required/>
	        </div>
	        <span class="pwd_input_re"></span>
	        <div class="update_cul">
	        	<label for="pwd">*비밀번호 확인</label>
                <div class="pwdCheck" >
                  <input type="password" class="user-input" class="pw2" id="pwd2" name="pwd2" placeholder="확인 비밀번호 입력" maxlength="20" required/>
                </div>
	        </div>
	        <span class="pwd2_input_re"></span>
	        <div class="update_cul">
	        	<label for="phone">*연락처</label>
            	<input type="tel" class="user-input" name="phone" id="phone" placeholder="연락처 입력" required/>
	        </div>	      
	        <span class="phone_input_re"></span>
	        <div class="update_cul">
	        	<label for="email">*이메일</label><br>
            	<input type="email" class="mail_input" name="email" id="email" placeholder="이메일 입력" required/>
        		<input type="button" class="mail_check_button" value="인증번호 전송" />
       			<span class="mail_input_box_warn"></span>
	        	<div class="mail_check_wrap">
	        		<div class="mail_check_input_box">
						<input class="mail_check_input user-input" id="mail_check_input_box_false" disabled="disabled" required />
					</div>
					<span id="mail_check_input_box_warn"></span>
				</div>
	        </div>
               <div class="update_cul">
	        	<label for="address">주소</label><br>
	        		<input type="text" class="user-input" id="post_code" name="post_code" value="${vo.post_code}"/><input type="button" class="address" value="우편번호찾기" onclick="kakaopost()"><br>
		            <input type="text" class="user-input" id="addr" name="addr" value="${vo.addr}" /><br>
		         	<input type="text" class="user-input" id="addr2" name="addr2" value="${vo.addr2}" placeholder="상세주소 입력" ><br>
		    </div>
		    
		    <div class="btn">
               	<button type="reset" class="btn-re">취소</button>
               	<button type="submit" class="btn-join">회원가입</button>
               </div>
  		</form>
      </div>
  </div>
</div>
</body>
 </body>
<%@ include file="../include/footer.jsp" %>