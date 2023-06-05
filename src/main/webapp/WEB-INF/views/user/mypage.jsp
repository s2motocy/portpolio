<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
.container{
	margin-top:10px;}
.id{
	font-size:30px;}
.userbtn{
	text-align:right;}
.upbtn{
	color:#708090;}
.rebtn{
	color:#B22222;}
#buy{
	font-size:20px;}
label{
	font-size:20px;
	color:black;}
.buy_status{
	text-align:center;
	font-size:20px;}
</style>
<script>

</script>
<body>
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>마이 페이지</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="home.html">Home</a>
                </li>
                <li class="is-marked">
                    <a href="single-product.html">마이 페이지</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
  <form action="update" method="get">
	<div class="group">
		<label class="id">${vo.user_id} 님:D</label>
			<div class="userbtn">
				<a href="update?user_id=${vo.user_id}" class="userbtn upbtn">수정하기</a>/<a href="remove" class="userbtn rebtn" >탈퇴하기</a>
			</div>	
	</div>
	<hr>
	<div class="group">
		<label>구매/배송조회</label>
		<div class="buy_status">
			결제 완료  >  상품 준비중  >  배송 시작  >  배송 중  >  배송 완료
		</div>
		<div class="buy_status_result">
		
		</div>
	</div>
	<hr>
	<div class="group">
		<label>쿠폰</label>
		<br>
		<span>소유하고 있는 쿠폰이 없습니다.</span>
	</div>
    <hr>
    <div class="group">
    	<a href="/buy/userBuyList?user_id=${vo.user_id}" id="buy">구매 내역 > </a>
    </div>
    </form>
  
</div>
</body>
<%@ include file="../include/footer.jsp" %>
