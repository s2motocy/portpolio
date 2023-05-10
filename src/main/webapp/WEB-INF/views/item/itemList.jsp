<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/admin/adminPage.jsp" %>	
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  
	<meta charset="UTF-8">
	<title>상품 목록 페이지</title>
</head>
<style>

tr{
	text-align: center;
	border:1px solid ;
}
table{
	width:100%;
	border:1px solid ;
}
#container {
	margin:40px;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
<script>
	$(document).ready(function () {
		$("img").each(function (idx, data) {
			var r = $(this).attr('src')
			u = r.replaceAll('\\', '/')
			$(this).attr('src', u)
		})
		$("button#deletebtn").each(function (idx, data) {
			$(this).click(function (e) {
				var confirmation = confirm("정말로 삭제하시겠습니까?");
				if (confirmation) {
					// 확인 버튼 클릭 시 동작
					alert("동작을 시작합니다.");
				} else {
					// 취소 버튼 클릭 시 동작
					e.preventDefault();
					alert("동작을 취소했습니다.");
				}
			})
		})

	})
</script>

<body>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<div id="container">
<h1>상품 관리</h1>
	<table  class="table">
		<tr class="table-danger">
		  <th scope="col">상품 번호</th>
		  <th scope="col">상품 사진</th>
		  <th scope="col">상품 분류</th>
		  <th scope="col">상품 이름</th>
		  <th scope="col">상품 가격</th>
		  <th scope="col">수정 여부</th>
		  <th scope="col">삭제 여부</th>
		</tr>
				
		<c:forEach var="list" items="${list}">
			<tr class="table-light">
				<td>${list.itemid}</td>	
		
				<td data-label=""><img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}" /></td>
				
				<td>${list.category}</td>
				
				<td><a href="detail?itemid=${list.itemid}">${list.name}</a></td>
				
				<td>${list.price}</td>
				
				<td><a href="update?itemid=${list.itemid}"><button id="updatebtn" type="button" class="btn btn-primary">수정</button></a></td>
				
				<td><a href="delete?itemid=${list.itemid}" id="delete"><button id="deletebtn" type="button" class="btn btn-danger">삭제</button></a></td>
			</tr>
		</c:forEach>	
	</table>
</div>
</body>
</html>