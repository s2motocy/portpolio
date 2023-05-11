<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>JQuery-validation demo | Bootstrap</title>

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    />

    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.11.3.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.min.js"
    ></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
          <div class="page-header">
            <div class="alert alert-info" role="alert">
              <h4>
                This demo shows how to integrate JQuery-validation and the
                Bootstrap framework.
              </h4>
              <ul>
                <li>
                  <a href="http://getbootstrap.com/" class="alert-link"
                    >Bootstrap home project</a
                  >.
                </li>
              </ul>
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Simple Form</h3>
            </div>
            <div class="panel-body">
              <form
                id="signupForm"
                method="post"
                class="form-horizontal"
                action="/members/join"
              >
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="name">이름</label>
                  <div class="col-sm-5">
                    <input
                      type="text"
                      class="form-control"
                      id="name"
                      name="name"
                      placeholder="이름 입력"
                    />
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-4 control-label" for="id">아이디</label>
                  <div class="col-sm-5">
                    <input
                      type="text"
                      class="form-control"
                      id="id"
                      name="id"
                      placeholder="아이디 입력"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd"
                    >비밀번호</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="password"
                      class="form-control"
                      id="pwd"
                      name="pwd"
                      placeholder="임호 입력"
                    />
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pwd2"
                    >비밀번호 확인</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="password"
                      class="form-control"
                      id="pwd2"
                      name="pwd2"
                      placeholder="확인 비밀번호 입력"
                    />
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-4 control-label" for="email"
                    >이메일</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="text"
                      class="form-control"
                      id="email"
                      name="email"
                      placeholder="이메일 입력"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="pnum"
                    >핸드폰 번호
                  </label>
                  <div class="col-sm-5">
                    <input
                      type="tel"
                      class="form-control"
                      id="pnum"
                      name="pnum"
                      placeholder="핸드폰 번호 입력"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="hnum"
                    >집 전화번호</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="tel"
                      class="form-control"
                      id="hnum"
                      name="hnum"
                      placeholder="집 전화번호 입력"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="address"
                    >집 주소</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="tel"
                      class="form-control"
                      id="address"
                      name="address"
                      placeholder="집 주소 입력"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label" for="moreaddress"
                    >상세 주소</label
                  >
                  <div class="col-sm-5">
                    <input
                      type="tel"
                      class="form-control"
                      id="moreaddress"
                      name="moreaddress"
                      placeholder="상세  주소 입력"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-9 col-sm-offset-4">
                    <button
                      type="submit"
                      class="btn btn-primary"
                      value="회원가입"
                    >
                      회원가입
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      $.validator.setDefaults({
        submitHandler: function () {
          // alert("submitted!");
          $("button").submit();
        },
      });

      $(document).ready(function () {
        $("#signupForm").validate({
          rules: {
            name: "required",
            id: "required",
            address:"required",
            moreaddress:"required",
            hnum:"required",
            pnum:"required",
            pwd: {
              required: true,
              minlength: 4,
            },
            pwd2: {
              required: true,
              minlength: 4,
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
        });
      });
    </script>
  </body>
</html>
