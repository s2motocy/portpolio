<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
<!-- app -->
<div id="app">
    <!-- Page Introduction Wrapper -->
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>결제 완료</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="#">결제완료</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Page Introduction Wrapper /- -->

    <!-- Checkout-Confirmation-Page -->
    <div class="page-checkout-confirm">
        <div class="vertical-middle">
            <div class="text-center u-s-m-t-50 u-s-m-b-50">
                <h1>결제가 성공적으로 완료되었습니다</h1>
                <div class="u-s-m-t-30">
                	<a href="/item/categoryAll" class="thank-you-back" id="continue">쇼핑 계속하기</a>
                </div>
                <div>
                	<a href="/" class="thank-you-back">홈으로 가기</a>
                </div>
                <div>
                	<a href="/buy/buyList" class="thank-you-back" id="search">결제내역 조회하기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout-Confirmation-Page /- -->
</div>

</body>
<%@ include file="../include/footer.jsp" %>
