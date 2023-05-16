<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 구매 페이지</title>
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
</head>
<body>
<form action="register" method="post">
	<h1>주문/결제하기</h1>
	<div class="container">
		<div class="구매자 정보">
			<h2>배송 정보</h2><hr>
			<div>
				<label for="name"><b>이름</b></label><br>
				<input type="text" id="name" name="name" /><br>	
			</div>
			<div>
				<label for="pwd"><b>비밀번호</b></label><br>
				<input type="tel" id="pnum" name="pnum" /><br>
			</div>
			<div>
				<label for="pnum"><b>연락처</b></label><br>
				<input type="tel" id="pnum" name="pnum" /><br>
			</div>
			<div>
				<label for="post_code"><b>우편번호</b></label><br>
            	<input type="text" id="post_code" name="post_code" placeholder="우편번호" />
            	<input type="button" value="우편번호찾기" onclick="kakaopost()"><br> 
         	</div>
			<div>
				<label for="addr"><b>주소</b></label><br>
            	<input type="text" id="addr" name="addr" /><br>
         	</div>
			<div>
				<label for="addr2"><b>상세주소</b></label><br>
         		<input type="text" id="addr2" name="addr2" placeholder="상세주소"><br>
         	</div>
		</div>
		
		<div class="상품 정보">
			<h2>주문 상품</h2><hr>

			<!-- forEach 시작 -->
			
			<div>
				<label for="buy_no"><b>상품</b></label>
				<input type="text" id="buy_no" name="buy_no" /><br>
			</div>
			
			<!-- forEach 종료 -->
		</div>
	</div>
        <button type="reset" id ="resetbtn" class="resetbtn">취소</button>
        <button type="submit" id="buybtn" class="buybtn">결제하기</button>
</form>
</body>
</html>