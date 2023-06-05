<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.container {
	margin-top: 10px;}
.input_wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 5px 20px;}
.text-field1 {
	border-radius: 5px;}
.table_wrap th,
.table_wrap td {
  padding: 8px;
  border: 1px solid #ddd;}
.table_wrap th {
  background-color: #f2f2f2;}
.table_wrap th label {
  font-weight: bold;}
.input_wrap input {
  border: none;
  background-color: transparent;
  width: 100%;
  box-sizing: border-box;}
.input_wrap input:read-only {
  color: #888;}
label {
  display: block;
  margin: 10px 0;}
input {
  padding: 5px;
  font-size: 17px;}
textarea {
  width: 800px;
  height: 200px;
  font-size: 20px;
  padding: 10px;}
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
  border-radius: 4px;
  color: #fff;}
.btn_wrap {
  padding-left: 80px;
  margin-top: 50px;
  margin-bottom: 30px;
  display: flex;
  justify-content: center;}
</style>

<body>
<div class="page-style-a">
	<div class="container">
		<div class="page-intro">
			<h2>문의사항</h2>
			<ul class="bread-crumb">
				<li class="has-separator">
					<i class="ion ion-md-home"></i>
					<a href="home.html">Home</a>
				</li>
				<li class="is-marked">
					<a href="single-product.html">등록</a>
				</li>
			</ul>
		</div>
	</div>
</div>
 <form action="/question/enroll" method="post">
    <div class="container">
      <div class="table_wrap">
        <table>
          <tr>
            <th><label for="category">문의 종류</label></th>
            <td>
              <div class="input_wrap">
                <select name="category">
                  <option value="회원/정보관리">회원/정보관리</option>
                  <option value="주문/결제">주문/결제</option>
                  <option value="환불/교환">환불/교환</option>
                  <option value="기타">기타</option>
                </select>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="title">제목</label></th>
            <td>
              <div class="input_wrap">
                <input type="text" id="title" class="text-field1" placeholder="제목을 입력하세요" name="title">
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="writer">작성자</label></th>
            <td>
              <div class="input_wrap">
                <input type="text" id="writer" class="text-field1" name="writer" value="${vo.user_name}">
              </div>
              	
            </td>
          </tr>
          <tr>
            <th><label for="content">내용</label></th>
            <td>
              <div class="input_wrap">
                <textarea id="content" style="width: 985px; height: 200px; border-radius: 5px;" name="content"></textarea>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="password">비밀번호</label></th>
            <td>
              <div class="input_wrap">
                <input type="password" id="password" class="text-field1" placeholder="미입력시 열람불가" name="password">
              </div>
            </td>
          </tr>
        </table>
      </div>
      <div style="text-align: center; margin-bottom: 20px;  margin-top:20px;">
        <button type="reset" class="button button-outline-secondary" style="display: inline-block; width: 200px; height: 50px; background-color: gray; color: white; border: gray;">취소</button>
        <button type="submit" class="button button-outline-secondary" style="display: inline-block; width: 200px; height: 50px; background-color: orange; color: white; border: orange;">문의등록</button>
      </div>
    </div>
  </form>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>