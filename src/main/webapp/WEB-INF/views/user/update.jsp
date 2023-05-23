<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user update</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}

a {
  text-decoration: none;
  color: black;
}

.wrap {
  width: 100%;
  height: 150vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
}

form {
  width: 500px;
  height: 900px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-weight:bold;
}

h2 {
  color: tomato;
  font-size: 2em;
}

hr {
  background-color: tomato;
  width : 90%;
  height : 3px;
}

.update_cul {
  margin-top: 20px;
  width: 80%;
}

input {
  width: 90%;
  height: 3px;
  border-radius: 15px;
  margin-top: 5px;
  padding:15px;
  border: 1px solid lightgray;
  outline: none;
}

#post {
  width: 95px;
  height: 33px;
  border-radius: 15px;
  margin-top: 5px;
  padding:12px;
  font-size: 4px;
  right: 0;
}

#post_code {
  width: 100px;
  height: 3px;
  border-radius: 30px;
  margin-top: 5px;
  padding:15px;
  border: 1px solid lightgray;
  outline: none;
}

.btn{
  width: 80%;
  margin-left:40px
}

#rebtn {
  margin-top: 30px;
  width: 40%;
  height: 40px;
  border: 0;
  outline: none;
  border-radius: 20px;
  background-image: linear-gradient(to right,  rgb(255,160,20), rgb(255,0,0));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}

#upbtn {
  margin-top: 30px;
  width: 40%;
  height: 40px;
  border: 0;
  outline: none;
  border-radius: 20px;
  background: linear-gradient(to right,  rgb(255,160,20), rgb(255,0,0));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}
</style>
</head>
<body>
	<div class="wrap">
	  <div class="update_content">
	    <div>
	    	<form action="user" method="post">
	    		<h2> 회원 정보 수정 </h2>
	    		<br>
	    		<hr>
	    		<div class="update_cul">
					<label for="name">이름*</label><br>
		            	<input type="text" name="user_name" value="${vo.user_name}" />
		        </div>
		        
		            	<input type="hidden" name="user_id" value="${vo.user_id}" readonly />
		            	
		        <div class="update_cul">
				<label for="pwd">기존 비밀번호*</label> 
		            	<input type="password" name="user_id" value="${vo.user_id}" />
		        </div>
		        
		        <div class="update_cul">
		        	<label for="pwd">새로운 비밀번호*</label>
		            	<input type="password" name="pwd" id="pwd" value="${vo.pwd}" /><br><br>
		            <label class="col-sm-4 control-label" for="pwd2">비밀번호 확인*</label>
		                  <div class="pwdCheck" >
		                    <input type="password" class="pw2" id="pwd2" name="pwd2" placeholder="확인 비밀번호 입력" required/>
		                  </div>
		                  <font id="pwCheck" size="2"></font>
		        </div>
		        
		        <div class="update_cul">
		        	<label for="phone">연락처*</label>
		            	<input type="tel" name="phone" value="${vo.phone}" />
		        </div>
		        
                <div class="update_cul">
		        	<label for="address">주소</label><br>
			            <input type="text" id="post_code" name="post_code" value="${vo.post_code}"/> <button type="button" id="post" onclick="kakaopost()"><h5>우편번호 찾기</h5></button><br>
			            <input type="text" id="addr" name="addr" value="${vo.addr}" /><br>
			         	<input type="text" id="addr2" name="addr2" value="${vo.addr2}"><br>
			    </div>
			    
			    <div class="btn">
                	<button type="reset" id="rebtn">취소</button>
                	<button class="move" type="button" id="upbtn">수정</button>
                </div>
	  		</form>
	      </div>
	    </div>
	 </div>
</body>
<script>
$(document).ready(function(){
    
    /* ID 중복확인 */
    $('.id_input').on("propertychange change keyup paste input", function(){
    	var user_id = $('.id_input').val()
    	var data = {user_id : user_id}	
    	$.ajax({
    		type : "post",
    		url : "/user/userIdCheck",
    		data : data,
    		success : function(result){
    			if(result != 'fail'){
    				$('.id_input_re_1').css("display","inline-block")
    				$('.id_input_re_2').css("display", "none");				
    			} else {
    				$('.id_input_re_2').css("display","inline-block")
    				$('.id_input_re_1').css("display", "none");				
    			}
   			}
    	})
   	 })
    
    /* 인증번호 이메일 전송 */
    $(".mail_check_button").click(function(){
    	var email = $(".mail_input").val()			// 입력한 이메일
    	var checkBox = $(".mail_check_input")		// 인증번호 입력란
    	var boxWrap = $("input[id^=mail_check_input]")	// 인증번호 입력란 박스
    	var warnMsg = $(".mail_input_box_warn")	// 이메일 입력 경고글    	
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
    			//console.log("data : " + data);
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
    	
    	if(inputCode == code){							// 일치할 경우
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
    $a_move= $("a.move")
	$a_move.each(function(idx ,data){
		$(this).click(function(e){
			console.log("눌렸어요 ")
			$("button#a").click(function(e){
				var inp = $("#pwd").val()
				var uno = $($a_move).eq(idx).attr("href")
				console.log(inp , uno )
				e.preventDefault()
				var formData = {uno, pwd:inp}
				$.ajax({
					url: '/board/checkPw',
					type: 'POST',
					data: formData,
					success: function(result){ 
					console.log(result)
					if(result=="1"){
						moveForm.empty().append("<input type='hidden' name='uno' value='"+ $a_move.eq(idx).attr("href") + "'>"); 
	    				moveForm.attr("action", "/user/mypage");
	    				moveForm.submit(); 
					}
					else{
						alert('비밀번호가 올바르지 않습니다')
						}
					}
				}
					
			}
				
			}
	$('.pw2').keyup(function(){
	  var p1 = document.getElementById('pwd').value;
	  var p2 = document.getElementById('pwd2').value;
	  
	  if( p1 != p2 ) {
	    $("#pwCheck").html("비밀번호가 일치하지 않습니다");
	    $("#pwCheck").attr('color','red');
	    return false;
	  } else {
		 $("#pwCheck").html("비밀번호가 일치합니다");
		 $("#pwCheck").attr('color','green');
		 return true;
	  }
	
	})
}) // ready
</script>
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
</html>