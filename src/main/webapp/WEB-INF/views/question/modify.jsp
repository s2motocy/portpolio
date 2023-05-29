<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<script src="https://code.jquery.com/jquery-3.4.1.js"
					integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
				<style>
					.input_wrap,
					.u-s-m-b-30 {
						display: flex;
						flex-direction: column;
						align-items: center;
						justify-content: center;
					}

					.text-field1 {
						border-radius: 5px;
					}

					.table_wrap {
						width: 100%;
					}

					.table_wrap table {
						width: 100%;
						border-collapse: collapse;
					}

					.table_wrap th,
					.table_wrap td {
						padding: 8px;
						border: 1px solid #ddd;
					}

					.table_wrap th {
						background-color: #f2f2f2;
					}

					.table_wrap th label {
						font-weight: bold;
					}

					.input_wrap input {
						border: none;
						background-color: transparent;
						width: 100%;
						box-sizing: border-box;
					}

					.input_wrap input:read-only {
						color: #888;
					}

					.input_wrap {
						padding: 5px 20px;
					}

					label {
						display: block;
						margin: 10px 0;
					}

					input {
						padding: 5px;
						font-size: 17px;
					}

					textarea {
						width: 800px;
						height: 200px;
						font-size: 20px;
						padding: 10px;
					}

					.btn {
						display: inline-block;
						font-size: 22px;
						padding: 6px 12px;
						background-color: #fff;
						border: 1px solid #ddd;
						font-weight: 600;
						width: 140px;
						height: 41px;
						line-height: 39px;
						text-align: center;
						margin-left: 30px;
						cursor: pointer;
						margin: 0 10px;
						border-radius: 4px;
						color: #fff;
					}

					.btn_wrap {
						padding-left: 80px;
						margin-top: 50px;
						margin-bottom: 30px;
						display: flex;
						justify-content: center;
					}

					#modify_btn {
						background-color: blue;
						color: #fff;
					}

					#cancel_btn {
						background-color: purple;
						color: #fff;
					}

					#list_btn {
						background-color: gray;
						color: #fff;
					}

					#delete_btn {
						background-color: red;
						color: #fff;
					}

					.container {
						margin-top: 10px;
					}
				</style>
			</head>
			<%@ include file="/WEB-INF/views/include/header.jsp" %>

				<body>
					<div class="page-style-a">
						<div class="container">
							<div class="page-intro">
								<h2>문의 조회</h2>
								<ul class="bread-crumb">
									<li class="has-separator">
										<i class="ion ion-md-home"></i>
										Home
									</li>
									<li class="is-marked">
										문의
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="container">
						<form id="modifyForm" action="/question/modify" method="post">
							<div class="table_wrap">
								<table>
									<tr>
										<th>
											<label for="category">문의 종류</label>
										</th>
										<td>
											<div class="input_wrap">
												<input name="category" readonly="readonly"
													value='<c:out value="${pageInfo.category}"/>'>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<label for="category">문의 번호</label>
										</th>
										<td>
											<div class="input_wrap">
												<input name="qno" readonly="readonly"
													value='<c:out value="${pageInfo.qno}"/>'>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<label>문의 작성자</label>
										</th>
										<td>
											<div class="input_wrap">
												<input name="writer" value='<c:out value="${pageInfo.writer}"/>'>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<label>문의 제목</label>
										</th>
										<td>
											<div class="input_wrap">
												<input name="title" value='<c:out value="${pageInfo.title}"/>'>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<label>문의 내용</label>
										</th>
										<td>
											<div class="input_wrap">
												<textarea rows="3" name="content"
													style="width : 985px;"><c:out value="${pageInfo.content}"/></textarea>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="btn_wrap">
								<a class="btn" id="list_btn">목록 페이지</a>
								<a class="btn" id="modify_btn">수정 완료</a>
								<a class="btn" id="delete_btn">삭제</a>
								<a class="btn" id="cancel_btn">수정 취소</a>
							</div>
						</form>
					</div>
					<form id="infoForm" action="/question/modify" method="get">
						<input type="hidden" id="qno" name="qno" value='<c:out value="${pageInfo.qno}"/>'>
						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
						<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
						<input type="hidden" name="type" value="${cri.type }">
						<input type="hidden" name="keyword" value="${cri.keyword }">
					</form>
					<script>

						let form = $("#infoForm");
						let mForm = $("#modifyForm");

						/* 목록 페이지 이동 버튼 */
						$("#list_btn").on("click", function (e) {
							form.find("#qno").remove();
							form.attr("action", "/question/list");
							form.submit();
						});

						/* 수정 하기 버튼 */
						$("#modify_btn").on("click", function (e) {
							e.preventDefault();
							mForm.submit();
						});

						/* 취소 버튼 */
						$("#cancel_btn").on("click", function (e) {
							form.attr("action", "/question/get");
							form.submit();
						});

						/* 삭제 버튼 */
						$("#delete_btn").on("click", function (e) {
							form.attr("action", "/question/delete");
							form.attr("method", "post");
							form.submit();
						});

					</script>
				</body>
				<%@ include file="/WEB-INF/views/include/footer.jsp" %>

			</html>