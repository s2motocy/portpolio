<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<body>
<!-- Page Introduction Wrapper -->
  <div class="page-style-a">
      <div class="container">
          <div class="page-intro">
              <h2>주문조회</h2>
              <ul class="bread-crumb">
                  <li class="has-separator">
                      <i class="ion ion-md-home"></i>
                      <a href="home.html">Home</a>
                  </li>
                  <li class="is-marked">
                      <a href="single-product.html">주문내역</a>
                  </li>
              </ul>
          </div>
      </div>
  </div>
<!-- Page Introduction Wrapper /- -->
<div id="app">
	<div class="container">
		<table class="table table-striped">
		<tr>
			<th>주문번호</th>
			<th>결제일</th>
			<th>상품</th>
			<th>수량</th>
			<th>가격</th>
			<th>주문 상태</th>
		</tr>
		<c:forEach var="ublist" items="${userBuyList}">
			<tr>
				<td>${ublist.buy_no}</td>
				<td><fmt:formatDate value="${ublist.buy_date}" pattern="yyyy-MM-dd" /></td>
				<td><c:forEach var="add" items="${userBuyItemList}" varStatus="stat">
					${add.item_name}<br>
				</c:forEach></td>
				<td><c:forEach var="add" items="${userBuyItemList}" varStatus="stat">
					${add.amount}<br>
				</c:forEach></td>
				<td><c:forEach var="add" items="${userBuyItemList}" varStatus="stat">
					${add.buy_price}<br>
				</c:forEach></td>
				<td>${ublist.buy_status}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>