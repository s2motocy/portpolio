<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>회원가입</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<style>
.id_input_re_1{
	color : green;
	display : none;
}
.id_input_re_2{
	color : red;
	display : none;
}

#mail_check_input_box_false{
    background-color:#ebebe4;
}
 
#mail_check_input_box_true{
    background-color:white;
}
</style>
</head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">회원 가입</h3>
            </div>
            <div class="panel-body">
               <form  action="join" method="post" class="form-horizontal" id="signupForm">
                <div class="form-group">
		        <label for="user_name"  class="col-sm-4 control-label">이름*</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" id="user_name" name="user_name" required/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="user_id">아이디*</label>
                  <div class="col-sm-5">
                    <input type="text" class="id_input" id="user_id" name="user_id" required/>
                  </div>
                </div>
                <div>
                  	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
                  </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd">비밀번호*</label>
                  <div class="col-sm-5">
                     <input type="password" minlength="4" class="pw1" id="pwd" name="pwd" placeholder="4자리 이상 입력" maxlength="20" required/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd2">비밀번호 확인*</label>
                  <div class="col-sm-5">
                    <input type="password" class="pw2" id="pwd2" name="pwd2" placeholder="확인 비밀번호 입력" required/>
                  </div>
                  <font id="pwCheck" size="2"></font>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="phone" >연락처*</label>
                  <div class="col-sm-5">
                    <input type="tel" class="form-control" id="phone" name="phone" required/>
                  </div>
                </div>
                
                <div class="mail_wrap">
				<label class="col-sm-4 control-label" for="pwd2" >이메일*</label> 
				<div class="mail_input_box">
					<input class="mail_input" name="email" placeholder="이메일을 입력해주세요" required/>
					<button class="mail_check_button">인증번호 전송</button>
				</div>
				<span class="mail_input_box_warn"></span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input" id="mail_check_input_box_false" disabled="disabled">
					</div>
					
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="address" >주소</label>
                  <div class="col-sm-5">
                  		<input type="button" value="우편번호찾기" onclick="kakaopost()"><br>   
			            <input type="text" id="post_code" name="post_code" placeholder="우편번호" />
			            <input type="text" id="addr" name="addr" /><br>
			         	<input type="text" id="addr2" name="addr2" placeholder="상세주소"><br>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-9 col-sm-offset-4">
                    <button type="submit" class="btn btn-primary" >회원가입</button>
                    <button type="reset" class="btn btn-primary">취소</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
<script>
$(document).ready(function(){
	$('button').click(function(e){
		console.log("버튼 눌리냐????")
		e.preventDefault()
	})
	$('button[type=submit]').click(function(e){
		$('form').submit()
	})
    
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
}) // ready

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
  </body>
</html>
