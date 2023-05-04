<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>회원가입</h2>
<form method="post" action="join">
<table border="1">

	<tr height="50">
		<td width="150" align="center">이름</td>
		<td width="250"  align="center"><input type="text" name="name"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">id</td>
		<td width="250"  align="center"><input type="text" name="id"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">패스워드</td>
		<td width="250"  align="center"><input type="password" name="pwd"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">패스워드확인</td>
		<td width="250"  align="center"><input type="password" name="pwd2"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">이메일</td>
		<td width="200"  align="center"><input type="email" name="email"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">핸드폰번호</td>
		<td width="250"  align="center"><input type="tel" name="pnum"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">집전화번호</td>
		<td width="250"  align="center"><input type="tel" name="hnum"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">주소</td>
		<td width="250"  align="center"><input type="text" name="address"></td>
	</tr>
	<tr height="50">
		<td width="150" align="center">상세주소</td>
		<td width="250"  align="center"><input type="text" name="deaddress"></td>
	</tr>
		
	<tr height="50">
		<td colspan="2" width="150" align="center">	</td>
	</tr>
	
</table>
<input type="submit" value="회원 가입">	
</form>
</body>
</html>
