<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
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
				<input type="text" id="buyer_name" name="buyer_name" value="${data.buyer_name}"/><br>	
			</div>
			<div>
				<label for="pwd"><b>비밀번호</b></label><br>
				<input type="tel" id="pwd" name="pwd" /><br>
			</div>
			<div>
				<label for="pnum"><b>연락처</b></label><br>
				<input type="tel" id="phone" name="phone" value="${data.phone}" /><br>
			</div>
			<div>
				<label for="post_code"><b>우편번호</b></label><br>
            	<input type="text" id="post_code" name="post_code" placeholder="우편번호" value="${data.post_code}" />
            	<input type="button" value="우편번호찾기" onclick="kakaopost()"><br> 
         	</div>
			<div>
				<label for="addr"><b>주소</b></label><br>
            	<input type="text" id="addr" name="addr" value="${data.addr}" /><br>
         	</div>
			<div>
				<label for="addr2"><b>상세주소</b></label><br>
         		<input type="text" id="addr2" name="addr2" placeholder="상세주소" value="${data.addr2}" ><br>
         	</div>
		</div>
		
		<div class="상품 정보">
			<h2>주문 상품</h2><hr>
			<table>
				<tr>
					<th>상품사진</th>
					<th>상품이름</th>
					<th>상품수량</th>
					<th>상품가격</th>
				</tr>
			<!-- forEach 시작 -->
			
				<tr>
					<%-- <td><img src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\', '/')}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}"/></td> --%>
					<td><input type="text" id="buy_no" name="buy_no" /></td>
					<td><input type="text" id="buy_no" name="buy_no" /></td>
					<td><input type="text" id="buy_no" name="buy_no" /></td>
					<td><input type="text" id="buy_no" name="buy_no" /></td>
				</tr>
				
			
			
			<!-- forEach 종료 -->
			</table>
		</div>
	</div>
        <button type="reset" id ="resetbtn" class="resetbtn">취소</button>
        <button type="submit" id="buybtn" class="buybtn">결제하기</button>
</form>
</body>
</html>