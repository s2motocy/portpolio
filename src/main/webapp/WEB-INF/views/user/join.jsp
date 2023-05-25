<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
    .btn-primary {
  background-color: #ff6b00;
  border-color: #ff6b00;
  color: #ffffff; /* 버튼 텍스트 색상을 밝은 색상으로 설정 */
}
#check {
  background-color: #ff6b00;
}
</style>
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
                        <h6 class="account-h6 u-s-m-b-30">Registering for this site allows you to access your order status and history.</h6>
                        <form 
                        id="signupForm"
                        method="post"
                        class="form-horizontal"
                        action="/user/join"
                        >
                            <div class="u-s-m-b-30">
                                <label for="user_name">사용자이름
                                    <span class="astk">*</span>
                                    </label>
                                <input
                                type="text"
                                class="form-control"
                                id="user_name"
                                name="user_name"
                                placeholder="이름 입력"
                                minlength="5"
                              />
                            </div>
                            <div class="u-s-m-b-30">
                                <label for="user_id">아이디
                                    <span class="astk">*</span>
                                    </label>
                                <input
                                type="text"
                                class="form-control"
                                id="user_id"
                                name="user_id"
                                placeholder="아이디 입력"
                                />
                            </div>
                            <input type="button" value="중복 체크" id="check" class="btn btn-default"/>

                            <div class="u-s-m-b-30">
                                <label for="pwd">비밀번호
                                    <span class="astk">*</span>
                                </label>
                               <input
                                type="password"
                                class="form-control"
                                id="pwd"
                                name="pwd"
                                placeholder="비밀번호 입력"
                                />
                            </div>
                            <div class="u-s-m-b-30">
                                <label for="pwd2">비밀번호 확인
                                    <span class="astk">*</span>
                                </label>
                                <div class="col-sm-13">
                                    <input
                                      type="password"
                                      class="form-control"
                                      id="pwd2"
                                      name="pwd2"
                                      placeholder="확인 비밀번호 입력"
                                    />
                                </div>
                            </div>
                        <div class="form-group email-form">
                            <label for="email">이메일</label>
                        <div class="input-group">
                          <input type="text" class="form-control" name="email" id="email" placeholder="이메일" >
                          <select class="form-control" name="userEmail2" id="userEmail2" >
                            <option>@naver.com</option>
                            <option>@daum.net</option>
                            <option>@gmail.com</option>
                            <option>@hanmail.com</option>
                            <option>@yahoo.co.kr</option>
                          </select>
                        </div>
                          <span class="mail_input_box_warn"></span>
                          <div class="mail_check_wrap">
                            <div class="clearfix"></div>
                            <span id="mail_check_input_box_warn"></span>
                          </div>
                          <div class="input-group-addon">
                            <button type="button" class="btn btn-primary" id="mail-Check-Btn">인증번호 전송</button>
                          </div>
                            <div class="mail-check-box">
                          <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
                          </div>
                        <span id="mail-check-warn"></span>
                        </div>
                            <div class="u-s-m-b-30">
                                <label for="phone">전화번호
                                    <span class="astk">*</span>
                                </label>
                                <input
                                type="tel"
                                class="form-control"
                                id="phone"
                                name="phone"
                                placeholder="핸드폰 번호 입력"
                                />
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
                                <button
                                    type="submit"
                                    class="btn btn-primary"
                                    value="회원가입"
                                    >
                                    회원가입
                                    </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script type="text/javascript" >
    $(document).ready(function () {
        function checkId(){
              var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
              console.log(id)
              $.ajax({
                  url:'/user/idCheck?user_id='+id, //Controller에서 요청 받을 주소
                  type:'get', //POST 방식으로 전달
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
$('#mail-Check-Btn').click(function() {
      const email = $('#email').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
      console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
      const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
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
          type : 'get',
          url : '/user/mailCheck?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
          success : function (data) {
              console.log("data : " +  data);
              checkInput.attr('disabled',false);
              code =data;
              alert('인증번호가 전송되었습니다.')
          }			
      }); // end ajax
  }); // end send eamil
  
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
<%@ include file="../include/footer.jsp" %>