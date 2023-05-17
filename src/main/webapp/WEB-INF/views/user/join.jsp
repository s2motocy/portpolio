<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>회원가입</title>
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
		        <label for="user_name"  class="id_inputl">이름*</label>
                  <div class="col-sm-5">
                    <input type="text" class="user_input" id="user_name" name="user_name"/>
                  </div>
                </div>
                <span class="final_name_ck">이름을 입력해주세요.</span>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="user_id">아이디*</label>
                  <div class="col-sm-5">
                    <input type="text" class="id_input" id="user_id" name="user_id" />
                  </div>
                  <span class="final_id_ck">아이디를 입력해주세요.</span>
                  <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
                </div>
                <div>                	
                  </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd">비밀번호*</label>
                  <div class="col-sm-5">
                     <input type="password" class="pw1" id="pwd" name="pwd" placeholder="4자리 이상 입력" maxlength="20" />               
                  </div>
                  <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd2">비밀번호 확인*</label>
                  <div class="col-sm-5">
                    <input type="password" class="pw2" id="pwd2" name="pwd2" placeholder="확인 비밀번호 입력" />
                  </div>
                  <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
                  <font id="pwCheck" size="2"></font>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="phone" >연락처*</label>
                  <div class="col-sm-5">
                    <input type="tel" class="form-control" id="phone" name="phone" />
                    <span></span>
                  </div>
                </div>
                
                <div class="mail_wrap">
				<label class="col-sm-4 control-label" for="pwd2" >이메일*</label> 
				<div class="mail_input_box">
					<input class="mail_input" name="email" placeholder="이메일을 입력해주세요" />
					<button class="mail_check_button">인증번호 전송</button>
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<span class="mail_input_box_warn"></span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input" id="mail_check_input_box_false" disabled="disabled" />
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
                  <span class="final_addr_ck">주소를 입력해주세요.</span>
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
 </body>
<script>
$(document).ready(function(){
	$("button[type=submit]").click(function(e){
		e.preventDefault()
		console.log("막았다")
		$("#signupForm").validate({
			 console.log("들어왔다")
	         rules: {
	           user_name: {required: true},
	           user_id: "required",
	           addr:"required",
	           addr2:"required",
	           phone:"required",
	           post_code:"required",
	           pwd: {
	             required: true,
	             minlength: 6,
	           },
	           pwd2: {
	             required: true,
	             minlength: 6,
	             equalTo: "#pwd",
	           },
	           email: {
	             required: true,
	             email: true,
	           },
	         },
	         messages: {
	           name: "이름을 입력해주세요",
	           id: "아이디를 입력해주세요 ",
	           pwd: {
	             required: "비밀 번호를 입력하세요 ",
	             minlength: "적어도 4글자 입력하세요 ",
	           },
	           pwd2: {
	             required: "비밀 번호를 입력하세요 ",
	             minlength: "적어도 4글자 입력하세요 ",
	             equalTo: "비밀번호가 일지하지 않습니다",
	           },
	           email: "유효한 이메일을 입력하세요 ",
	         },
	         errorElement: "em",
	         errorPlacement: function (error, element) {
	           // Add the `help-block` class to the error element
	           error.addClass("help-block");
	         },
	         highlight: function (element, errorClass, validClass) {
	           $(element)
	             .parents(".col-sm-5")
	             .addClass("has-error")
	             .removeClass("has-success");
	         },
	         unhighlight: function (element, errorClass, validClass) {
	           $(element)
	             .parents(".col-sm-5")
	             .addClass("has-success")
	             .removeClass("has-error");
	         },
	      /*    submitHandler: function () {
	             $("button").submit();
	         } */
		 });
	})
	 
	 
     function checkId(){
         var user_id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
         $.ajax({
             url:'/user/idCheck?user_id='+user_id, //Controller에서 요청 받을 주소
             type:'get', //POST 방식으로 전달
             success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
             	console.log("여기에 성공하면 담긴다: ", cnt)
                 if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                     alert("사용가능한 아이디 입니다");
                 } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                     alert("아이디를 다시 입력해주세요");
                     $('#user_id').val('');
                     //$('#id').val(id)
                 }
             },
             error:function(){
                 alert("에러입니다");
             }
         });
     };
         

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
