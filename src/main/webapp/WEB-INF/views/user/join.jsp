<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
.btn-primary {
  background-color: #ff6b00;
  border-color: #ffb600;
  color: #ffffff; /* 버튼 텍스트 색상을 밝은 색상으로 설정 */}
#check {
  background-color: #ff6b00;}
</style>
<script type="text/javascript" >
    $(document).ready(function () {
        function checkId(){
              var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
              console.log(id)
              $.ajax({
                  url:'/user/idCheck?user_id='+id, //Controller에서 요청 받을 주소
                  type:'get', //get 방식으로 전달
                  success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                      console.log(cnt)
                      if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                          alert("사용가능한 아이디 입니다");
                      } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                          alert("아이디를 다시 입력해주세요");
                          $('#id').val('');
                          //$('#id').val(id)
                      }
                  },
                  error:function(){
                      alert("에러입니다");
                  }
              });
              };
        $("#check").click(function(){
             checkId()
            var result = $('#id').val()
            console.log('result:',result)
            if(result==" "){
                console.log("사랑")
            }
        })
        var code;
$(".mail_check_button").click(function(){
	
    	var email = $(".mail_input").val()			// 입력한 이메일
    	var checkBox = $(".mail_check_input")		// 인증번호 입력란
    	var boxWrap = $("input[id^=mail_check_input]")	// 인증번호 입력란 박스
    	var warnMsg = $(".mail_check_input_box")	// 이메일 입력 경고글   
    	console.log("눌렸어", email , checkBox ,boxWrap , warnMsg )
    	/* 이메일 형식 유효성 검사 */
    	if(mailFormCheck(email)){
    		console.log("여기 1")
    		warnMsg.html("인증번호를확인해주세요")
    		warnMsg.css("display", "inline-block")
    	} else {
    		console.log("여기 2")
    		warnMsg.html("올바르지 못한 이메일 형식입니다.")
    		warnMsg.css("display", "inline-block")
    		return false;
    	}
    	$.ajax({	
    		type:"GET",
    		url:"mailCheck?email=" + email,
    		success:function(data){
    			console.log("data : " + data);
    			checkBox.val(data);
    			code = data
    			setTimeout(() => {
    				console.log("눌렷어")
    				checkBox.trigger('blur');
    				$(".correct").css("color","green")
    				$(".incorrect").css("color","red")
				}, 100);
    			//$("#mail_check_input_box_false").text(data)
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
    		checkResult.html("인증번호가 일치합니다.");	
    		checkResult.attr("class", "correct");		
    		mailnumCheck = true;
    	} else {											// 일치하지 않을 경우
    		checkResult.html("인증번호를 다시 확인해주세요.");
    		checkResult.attr("class", "incorrect");
    		mailnumCheck = false;
    	}	
    	
    });
  
  function mailFormCheck(email){//이메일 형식 함수
	  console.log('form check , ' ,email)
      var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
      return form.test(email);
  }
}) // ready

   $(function(){
        $(".phone-number-check").on('keydown', function(e){
        // 숫자만 입력받기
            var trans_num = $(this).val().replace(/-/gi,'');
        var k = e.keyCode;
                    
        if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
        {
            e.preventDefault();
        }
        }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
            if($(this).val() == '') return;

            // 기존 번호에서 - 를 삭제합니다.
            var trans_num = $(this).val().replace(/-/gi,'');
        
            // 입력값이 있을때만 실행합니다.
            if(trans_num != null && trans_num != '')
            {
                // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
                if(trans_num.length==11 || trans_num.length==10) 
                {   
                    // 유효성 체크
                    var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                    if(regExp_ctn.test(trans_num))
                    {
                        // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                        trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                        $(this).val(trans_num);
                    }
                    else
                    {
                        alert("유효하지 않은 전화번호 입니다.");
                        $(this).val("");
                        $(this).focus();
                    }
                }
                else 
                {
                    alert("유효하지 않은 전화번호 입니다.");
                    $(this).val("");
                    $(this).focus();
                }
        }
        });  
        });

        function displayAlert() {
          alert("회원가입 되었습니다");
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
<body>
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>회원가입</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="join">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Page Introduction Wrapper /- -->
    <!-- Account-Page -->
    <div class="page-account u-s-p-t-80">
        <div class="container">
            <div class="row">
                <!-- Register -->
                <div class="col-lg-12">
                    <div class="reg-wrapper">
                        <h2 class="account-h2 u-s-m-b-20">회원가입</h2>
                        <form id="signupForm" method="post" class="form-horizontal" action="/user/join">
                            <div class="u-s-m-b-30">
                                <label for="user_name">사용자이름<span class="astk">*</span></label>
                                <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름 입력" minlength="1" />
                            </div>
                            <div class="u-s-m-b-30">
                                <label for="user_id">아이디<span class="astk">*</span></label>
                                <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력" />
                            </div>
                            <input type="button" value="중복 체크" id="check" class="btn btn-default"/>

                            <div class="u-s-m-b-30">
                                <label for="pwd">비밀번호<span class="astk">*</span></label>
                               <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호 입력" />
                            </div>
                            <div class="u-s-m-b-30">
                                <label for="pwd2">비밀번호 확인<span class="astk">*</span></label>
                                <div class="col-sm-13">
                                    <input type="password" class="pw2" id="pwd2" name="pwd2" placeholder="확인 비밀번호 입력"/>
                                </div>
                            </div>
                            <font id="pwCheck" size="2"></font>
                            <div class="mail_wrap">
                                <div class="mail_name">이메일</div> 
                                <div class="mail_input_box">
                                    <input class="mail_input" name="email" id="email">
                                    <input type="button"  class='mail_check_button' value="인증번호전송" id="check" class="btn btn-secondary"/>
                                </div>
                                <div class="mail_check_wrap">
                                       <input class="mail_check_input" />
                                    <div class="mail_check_button">
										<span id="mail_check_input_box_warn"></span>
                                  	</div>
                             </div>
                            </div>
                            <div class="u-s-m-b-30">
                                <label for="phone">전화번호<span class="astk">*</span></label>
                                <input type="tel" class="phone-number-check" id="phone" name="phone" placeholder="000-0000-0000" />
                            </div>
                            <div class="u-s-m-b-30">
                                <label class="col-sm-4 control-label" for="address" >주소</label>
                                <div class="col-sm-13">
                                  <input type="button" value="우편번호찾기" onclick="kakaopost()" class="btn btn-default"><br>   
                                  <input type="text" id="post_code" name="post_code" placeholder="우편번호" class="form-control" />
                                  <input type="text" id="addr" name="addr" class="form-control" /><br>
                                  <input type="text" id="addr2" name="addr2" placeholder="상세주소" class="form-control" /><br>
                                </div>
                              </div>
                            <div class="u-s-m-b-45">
                                <button type="submit" class="btn btn-primary" value="회원가입" onclick="displayAlert()" > 회원가입</button>
                                &nbsp;
                                <button type="reset" class="btn btn-primary">
                                    회원가입취소
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file="../include/footer.jsp" %>