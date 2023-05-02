<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<h1>상품 등록 페이지</h1>
	<form action="register" method="post">
		<div>
			<div>
				<label for="itemid">상품코드</label>
				<input type="text" id="itemid" name="itemid" placeholder="상품코드를 입력해주세요" />
			</div>
			<div>
				<label for="category">종류</label>
				<select id="category" name="category">
					<option value="#" selected>#</option>
					<option value="한식">한식</option>
					<option value="양식">양식</option>
					<option value="중식">중식</option>
					<option value="일식">일식</option>
					<option value="분식">분식</option>
					<option value="야식">야식</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div>
				<label for="name">상품이름</label>
				<input type="text" id="name" name="name" placeholder="상품명을 입력해주세요" />
			</div>
			<div>
				<label for="price">상품가격</label>
				<input type="text" id="price" name="price" placeholder="상품가격을 입력해주세요" />
			</div>
			<div>
				<label for="description">상세설명</label>
				<textarea id="description" name="description" placeholder="1000자 이내로 입력하세요" maxlength="800" rows="10" cols="100"></textarea>
			</div>
			<div>
				<label for="img_url">상품가격</label>
				<img id="img_url" name="img_url" src="https://cdn-pro-web-134-253.cdn-nhncommerce.com/mychef1_godomall_com/data/goods/23/03/13/1000002474/1000002474_detail_027.jpg" />
			</div>
			<div>
				<label for="update_date">등록일자</label>
				<input type="date" id="update_date" name="update_date" />
			</div>
		</div>
		<input type="submit" value="등록" />
		<input type="reset" value="취소" />
	</form>
</body>
</html>