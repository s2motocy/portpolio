<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<form action="guestOrder" method="post">
		<div class="container">
       <h1>비회원 구매페이지</h1>
       이렇게 만드는거 맞나 의미있나
      <hr> 
        
        <label for="name"><b>이름</b></label>
         <br>
            <input type="text" id="name" name="name" />
        <br>
        
        <label for="tel"><b>핸드폰번호</b></label>
         <br>
            <input type="tel" id="pnum" name="pnum" />
        <br>
        
        <label for="pwd"><b>비밀번호</b></label>
         <br>
            <input type="password" id="pwd" name="pwd" />
        <br>
        
        <label for="name"><b>주소</b></label>
         <br>
            <input type="text" id="address_kakao" name="address" readonly />
         <br>
        
        <label for="deaddress"><b>상세주소</b></label>
         <br>
            <input type="text" id="deaddress" name="deaddress" />
        <br>
		
		<label for="itemid"><b>주문하는 상품</b></label>
         <br>
            <input type="text" id="itemid" name="itemid" />
        <br>
		        
        <button type="reset" id = "resetbtn" class="resetbtn">취소</button>
        <button type="submit" id="buybtn" class="buybtn">구매하기</button>
   </div>
	
	</form>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>