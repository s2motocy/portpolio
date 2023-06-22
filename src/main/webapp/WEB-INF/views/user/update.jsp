<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
  .btn-primary {
  background-color: #ff6b00;
  border-color: #ffb600;}
.btn-secondary {
  background-color: #ff6b00;
  border-color: #ffb600;}
.btn-danger {
  background-color: #ff6b00;
  border-color: #ff6b00;}
.container2 {
  width: 30%;
  margin-left: auto;
  margin-right: auto;}
</style>


<script> 
$(document).ready(function(){
	
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
		
	 $(".move").click(function(e){
    	e.preventDefault();
    	if($("#pwd").val() != $("#pwd2").val()){
    		alert("비밀번호를 확인해 주세요.")
    	}else{
    		$("#userUpdate").submit()
    	}
    })
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
            <h2>회원수정</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="/">Home</a>
                </li>
                <li class="is-marked">
                    <a href="update">회원수정</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
	  <div class="update_content">
	    <div>
	    	<form action="update" method="post" id="userUpdate">
	    		<div class="update_cul">
					<label for="name">이름*</label>
	            	<input type="text" name="user_name" value="${vo.user_name}" />
		        </div>
            	<input type="hidden" name="user_id" value="${vo.user_id}" readonly />
		        <div class="update_cul">
				<label for="pwd">기존 비밀번호*</label> 
		            	<input type="password" name="pwd" value="${vo.pwd}" />
		        </div>
		        <div class="update_cul">
		        	<label for="pwd">새로운 비밀번호*</label>
	            	<input type="password" name="pwd" id="pwd" value="${vo.pwd}" /><br>
		            <label class="col-sm-4 control-label" for="pwd2">비밀번호 확인*</label>
                	<input type="password" class="pw2" id="pwd2" name="pwd2" placeholder="확인 비밀번호 입력" required/><br>
	                <font id="pwCheck" size="2"></font>
		        </div>
		        <div class="update_cul">
		        	<label for="phone">연락처*</label>
		            	<input type="tel" name="phone" value="${vo.phone}" />
		        </div>
		        <div class="update_cul">
		        	<label for="email">이메일*</label>
		            	<input type="email" name="email" value="${vo.email}" />
		        </div>		        
                <div class="update_cul">
		        	<label for="address">주소</label><br>
			            <input type="button" value="우편번호찾기" onclick="kakaopost()"><br>
			            <input type="text" id="post_code" name="post_code" value="${vo.post_code}" />
			            <input type="text" id="addr" name="addr" value="${vo.addr}" /><br>
			         	<input type="text" id="addr2" name="addr2" value="${vo.addr2}"><br>
			    </div>		    
			    <div class="btn">
                	<button type="reset" id="rebtn">취소</button>
                	<button class="move" id="upbtn">수정</button>
                </div>
	  		</form>
	      </div>
	    </div>
	 </div>
</body>  
<%@ include file="../include/footer.jsp" %>