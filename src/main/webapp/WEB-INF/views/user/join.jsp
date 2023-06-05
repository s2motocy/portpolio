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
.btn{
  width: 80%;
  margin-left:40px}
#btn-re {
  margin-top: 30px;
  width: 40%;
  height: 40px;
  border: 0;
  outline: none;
  border-radius: 20px;
  background-image: linear-gradient(to right,  rgb(255,160,20), rgb(255,0,0));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;}
#btn-join {
  margin-top: 30px;
  width: 40%;
  height: 40px;
  border: 0;
  outline: none;
  border-radius: 20px;
  background: linear-gradient(to right,  rgb(255,160,20), rgb(255,0,0));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;}

.mail_input {
	float: left;}
#mail_check_input_box_false{
    background-color:#ebebe4;} 
#mail_check_input_box_true{
    background-color:white;}
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

$(document).ready(function(){
	
	var checkString = RegExp(/^[a-z0-9]{6,20}$/);
    var checkName = RegExp(/^[가-힣]|[A-Z]|[a-z]$/);
    
    function check(){
    	$("#user_name").blur(function(){
            if($("#user_name").val() == "" ){  
                $(".name_input_re").text("이름을 입력해주세요.");             
                $("#user_name").focus();
                return false;
            }else if(!checkName.test($("#userName").val())) {
                $(".name_input_re").text("한글 또는 영문으로 입력해주세요.");
                $("#user_name").focus();                
                return false;
            }else if(checkName.test($("#userName").val())) {
                $(".name_input_re").text("사용가능한 이름입니다.").css("color", "#3f8ef7");            
                return true;
            }
        });
    	 $("#user_id").blur(function (){                
             if($("#user_id").val() == "" ){
                 $(".id").text("아이디를 입력해주세요");
                 $("#user_id").focus();
                 return false;
             }else if(!checkString.test($("#userID").val())) {
                 $(".id_input_re").text("영문 혹은 영문과 숫자를 조합하여 최소 6자리이상 20자리로 입력해주세요.");
                 $("#user_id").val("");
                 $("#user_id").focus();                
                 return false;
             }else if(checkString.test($("#user_id").val())) {
                 $(".id_input_re").text("사용가능한 아이디입니다.").css("color", "#3f8ef7");
                 return true;
             }
         });
    	 
    	 $("#pwd").blur(function(){
             if($("#pwd").val() == "" ){                
                 $(".pwCheck1").text("비밀번호를 입력해주세요");
                 $("#pwd").focus();
                 return false;
             }else if(!checkString.test($("#pwd").val())) {
                 $(".pwd_input_re").text("3개 이상을 조합하여 8자리 이상 입력해 주세요.").css("color", "red");
                 $("#pwd").focus();
                 return false;
             }else if(checkString.test($("#pwd").val())) {
                 $(".pwd_input_re").text("사용가능한 비밀번호 입니다.").css("color", "#3f8ef7");
                 return true;                          
             }
         });
    };
	
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
    	
    	var inputCode = $(".mail_check_input").val();		// 입력코드	
    	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
    	
    	if(inputCode == code){								// 일치할 경우
    		checkResult.html("인증번호가 일치합니다.");
    		checkResult.attr("class", "correct");		
    		mailnumCheck = true;
    	} else {											// 일치하지 않을 경우
    		checkResult.html("인증번호를 다시 확인해주세요.");
    		checkResult.attr("class", "incorrect");
    		mailnumCheck = false;
    	}	
    });	
    function mailFormCheck(email){
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}
    
    $("button[type='submit']").click(function(e){
    	check()
    	if(check()){$("form").submit()}
           }                      
    })
}) // ready
</script>

 <body>
<div class="page-style-a">
	<div class="container">
		<div class="page-intro">
			<h2>회원 가입</h2>
			<ul class="bread-crumb">
				<li class="has-separator">
					<i class="ion ion-md-home"></i>
					<a href="home.html">Home</a>
				</li>
				<li class="is-marked">
					<a href="single-product.html">회원가입</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="container">
  <div class="update_content">
    <div>
    	<form  action="join" method="post" class="form-horizontal" id="signupForm">
    		<div class="update_cul">
				<label for="name">*이름</label><br>
	            	<input type="text" class="user-input" name="user_name" id="user_name"  placeholder="이름 입력" required/>
	        </div>
	        <span class="name_input_re"></span>
	        
	        <div class="update_cul">
				<label for="id">*아이디</label><br>
	            	<input type="text" class="user-input" name="user_id" id="user_id"  placeholder="ID 입력" required/>
	        </div>
	        <span class="id_input_re"></span>
	        
	        <div class="update_cul">
			<label for="pwd">*비밀번호</label> 
	            	<input type="password" class="user-input" name="pwd" name="pwd" id="pwd"  placeholder="4~12자의 영문 대소문자와 숫자로만 입력" maxlength="12" required/>
	        </div>
	        <span class="pwd_input_re"></span>
	        <div class="update_cul">
	        	<label for="pwd">*비밀번호 확인</label>
	                  <div class="pwdCheck" >
	                    <input type="password" class="user-input" class="pw2" id="pwd2" name="pwd2" placeholder="확인 비밀번호 입력" maxlength="12" required/>
	                  </div>
	        </div>	
	        <div class="update_cul">
	        	<label for="phone">연락처*</label>
	            	<input type="tel" class="user-input" name="phone" id="phone" required/>
	        </div>	        
	        <div class="mail_wrap">
	        	<label for="email">*이메일</label>
	            	<input type="email" class="mail_input user-input" name="email" id="email" placeholder="이메일을 입력해주세요" required/>
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
	        		<input type="button" class="address" value="우편번호찾기" onclick="kakaopost()"><br>
		            <input type="text" class="user-input" id="post_code" name="post_code" value="${vo.post_code}"/> <button type="button" id="post" onclick="kakaopost()"><h5>우편번호 찾기</h5></button><br>
		            <input type="text" class="user-input" id="addr" name="addr" value="${vo.addr}" /><br>
		         	<input type="text" class="user-input" id="addr2" name="addr2" value="${vo.addr2}"><br>
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