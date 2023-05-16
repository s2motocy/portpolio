<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원구매 로그인</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
$(document).ready(function(){
	$("input[type=submit]").click(function(e){
		// login 실행 이후 성공하면 submit 실패하면 return
	})
})
</script>
</head>
<body>
    <form action="/buy/buyPage">
    	<div class="로그인 정보">
		     아이디<input type="text" name="user_id" value="test1" ><br/>
		     암호<input type="password" name="pwd"><br/>
		     <input type="submit" value="로그인"><br/>
	     </div>
	     <div class="히든">
	     	<c:forEach var="vo" items="${test.buy_list}" varStatus="stat">
	     		<input type="text" name="buy_list[${stat.index}].item_id" value="${vo.item_id}" />
	     		<input type="text" name="buy_list[${stat.index}].item_name" value="${vo.item_name}" />
	     		<input type="text" name="buy_list[${stat.index}].amount" value="${vo.amount}" />
	     	</c:forEach>
	     </div>
    </form>
</body>
</html>