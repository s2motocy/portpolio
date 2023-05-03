<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
<script>
$(document).ready(function(){

	$(".uploadResult ul").each(function(idx, obj){ //p525
		var str=""
		if(obj.image) { // 이미지가 맞으면 아래 실행
			console.log("이미지 ")
			var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName)
			var originPath = obj.uploadPath+ "/"+obj.uuid+"_"+obj.fileName
			originPath = originPath.replace(new RegExp(/\\/g), "/")  // "\\" => "/"  로 대체한다 (global)
			str+= "<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.image+"'"
			str+= "><div><span>"+obj.fileName+"</span><button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
			str+= "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
			str+= "<img src='/display?fileName=" + fileCallPath +"'></div></li>"
		} else { // 이미지가 아니면 아래 실행
			var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+obj.uuid+"_"+obj.fileName)
			var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/")
			str+= "<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.image+"'"
			str+= "><div><span>"+obj.fileName+"</span><button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
			str+= "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button></br>"
			str+= "<img src='/resources/img/attach.png'></div></li>"
		}
		$(".uploadResult ul").append(str)
	})
 })
 </script>
<body>
<table>
	<tr>
		<th>상품 이름</th>
		<th>상품 가격</th>
		<th>상품 사진</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.name}</td>
			<td>${list.price}</td>
			<td><div class="uploadResult"><ul></ul></div></td>
			<td><input type="button" value="수정" class="btn btn-primary" id="update"/></td>
			<td><input type="button" value="삭제" class="btn btn-warning" id="delete"/></td>
		</tr>
		
	</c:forEach>
</table>
</body>
</html>
