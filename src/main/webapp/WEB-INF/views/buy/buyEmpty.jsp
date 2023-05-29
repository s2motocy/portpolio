<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<body>

<!-- app -->
<div id="app">
    <!-- Page Introduction Wrapper -->
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>마이페이지</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="/buy/userBuyList">구매내역</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Page Introduction Wrapper /- -->
    
    <!-- Cart-Page -->
    <div class="page-cart u-s-p-t-80 u-s-p-b-40">
        <div class="vertical-middle">
            <div class="text-center">
                <h5>구매내역이 비었어요.</h5>
                <div class="redirect-link-wrapper u-s-p-t-25">
                    <a class="redirect-link" href="/item/categoryAll">
                        <span>돌아가기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart-Page /- -->
</div>

</body>
<%@ include file="../include/footer.jsp"%>