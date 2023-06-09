<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="UTF-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>마이 밀키트</title>
<!-- Standard Favicon -->
<link href="/resources/bentobox.ico" rel="shortcut icon">
<!-- Base Google Font for Web-app -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
<!-- Google Fonts for Banners only -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">

<!-- CSS -->
<!-- Bootstrap 4 -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<!-- Font Awesome 5 -->
<link rel="stylesheet" href="/resources/css/fontawesome.min.css">
<!-- Ion-Icons 4 -->
<link rel="stylesheet" href="/resources/css/ionicons.min.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="/resources/css/animate.min.css">
<!-- Owl-Carousel -->
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<!-- Jquery-Ui-Range-Slider -->
<link rel="stylesheet" href="/resources/css/jquery-ui-range-slider.min.css">
<!-- Utility -->
<link rel="stylesheet" href="/resources/css/utility.css">
<!-- Main -->
<link rel="stylesheet" href="/resources/css/bundle.css">
</head>

<!-- Script -->
<script src="https://www.google-analytics.com/analytics.js" async defer></script>
<!-- Modernizr-JS -->
<script type="text/javascript" src="/resources/js/vendor/modernizr-custom.min.js"></script>
<!-- NProgress -->
<script type="text/javascript" src="/resources/js/nprogress.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<!-- Popper -->
<script type="text/javascript" src="/resources/js/popper.min.js"></script>
<!-- ScrollUp -->
<script type="text/javascript" src="/resources/js/jquery.scrollUp.min.js"></script>
<!-- Elevate Zoom -->
<script type="text/javascript" src="/resources/js/jquery.elevatezoom.min.js"></script>
<!-- jquery-ui-range-slider -->
<script type="text/javascript" src="/resources/js/jquery-ui.range-slider.min.js"></script>
<!-- jQuery Slim-Scroll -->
<script type="text/javascript" src="/resources/js/jquery.slimscroll.min.js"></script>
<!-- jQuery Resize-Select -->
<script type="text/javascript" src="/resources/js/jquery.resize-select.min.js"></script>
<!-- jQuery Custom Mega Menu -->
<script type="text/javascript" src="/resources/js/jquery.custom-megamenu.min.js"></script>
<!-- jQuery Countdown -->
<script type="text/javascript" src="/resources/js/jquery.custom-countdown.min.js"></script>
<!-- Owl Carousel -->
<script type="text/javascript" src="/resources/js/owl.carousel.min.js"></script>
<script>
$("#gnb_logout_button").click(function () {
    //alert("버튼 작동");
    $.ajax({
        type: "POST",
        url: "/user/logout.do",
        success: function (data) {
            alert("로그아웃 성공");
            document.location.reload();
        }
    }); // ajax 
});
function searchFunction(event) {
    event.preventDefault();
    const keyword = document.getElementById("search-landscape").value;
    const category = document.getElementById("select-category").value;
    performSearch(keyword, category);
}
function performSearch(keyword, category) {
    console.log("Performing search with keyword:", keyword);
    console.log("Selected category:", category);
}
$(document).ready(function () {
    $("#btn-search").click(function (e) {
        var search = $("#search-landscape").val()
        console.log(search)
    })
})
</script>
<!-- app -->
<div id="app" class="position-relative">
<!-- Header -->
<header>
    <!-- Mid-Header -->
    <div class="full-layer-mid-header">
        <div class="container">
            <div class="row clearfix align-items-center">
                <div class="col-lg-3 col-md-9 col-sm-6">
                    <div class="brand-logo text-lg-center">
                        <a href="/">
                            <img src="/resources/images/main-logo/main-logo.png" alt="Logo"
                                class="app-brand-logo" style="width:280px; height:120px">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 u-d-none-lg">
                    <form class="form-searchbox">
                        <label class="sr-only" for="search-landscape">Search</label>
                        <input id="search-landscape" type="text" class="text-field" name='search'
                            placeholder="검색어를 입력하세요">
                        <button id="btn-search" type="submit"
                            class="button button-primary fas fa-search"></button>
                    </form>
                </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <nav>
                    <ul class="g-nav">
                    <c:choose>
                        <c:when test="${vo == null}">
                            <li>
                                <a href="/user/login" class="g-nav-link">
                                    <i class="far fa-user"></i>
                                    로그인
                                </a>
                            </li>
                            <li>
                                <a href="/user/join" class="g-nav-link">
                                    <i class="fas fa-user-plus"></i>
                                    회원가입
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="/user/mypage" class="g-nav-link">
                                    <i class="far fa-user"></i>
                                    ${vo.user_name}님 환영합니다!
                                </a>
                            </li>
                            <li>
                                <a href="/user/logout.do" class="g-nav-link">
                                    <i class="fas fa-sign-out-alt"></i>
                                    로그아웃
                                </a>
                            </li>
                        </c:otherwise>
                        </c:choose>
                        <li>
                          <a href="/cart/cartList" class="g-nav-link">
                          <i class="fas fa-shopping-cart"></i>
                                    장바구니
                          </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- Mid-Header /- -->
<!-- Responsive-Buttons -->
<div class="fixed-responsive-container">
    <div class="fixed-responsive-wrapper">
        <button type="button" class="button fas fa-search" id="responsive-search"></button>
    </div>
    <div class="fixed-responsive-wrapper">
        <a href="wishlist.html">
            <i class="far fa-heart"></i>
            <span class="fixed-item-counter">4</span>
        </a>
    </div>
</div>
<!-- Responsive-Buttons /- -->
<!-- Mini Cart -->
<div class="mini-cart-wrapper">
    <div class="mini-cart">
        <div class="mini-cart-header">
            장바구니
            <button type="button" class="button ion ion-md-close" id="mini-cart-close"></button>
        </div>
        <ul class="mini-cart-list">
            <!-- forEach 시작 -->
            <!-- <li class="clearfix">
                <a href="single-product.html">
                    <img src="/resources/images/product/product@1x.jpg" alt="Product">
                    <span class="mini-item-name">Casual Hoodie Full Cotton</span>
                    <span class="mini-item-price">50,000 원</span>
                    <span class="mini-item-quantity"> x 2 </span>
                </a>
            </li> -->
            <!-- forEach 종료 -->
        </ul>
        <div class="mini-shop-total clearfix">
            <span class="mini-total-heading float-left">합계:</span>
            <span class="mini-total-price float-right">0 원</span>
        </div>
        <div class="mini-action-anchors">
            <a href="/cart/cartList" class="cart-anchor">장바구니 보기</a>
            <a href="#" class="checkout-anchor">결제하기</a>
        </div>
    </div>
</div>
<!-- Mini Cart /- -->
<!-- Bottom-Header -->
<div class="full-layer-bottom-header">
    <div class="container">
        <div class="row clearfix align-items-center">
            <!-- 관리자 세션 시작 -->
            <c:if test="${admin == 'a'}">
            <div class="col-lg-2">
                <div class="v-menu v-close">
                    <span class="v-title">
                        <i class="ion ion-md-menu"></i>
                        관리자 전용
                        <i class="fas fa-angle-down"></i>
                    </span>
                    <nav>
                        <div class="v-wrapper">
                            <ul class="v-list animated fadeIn">
                                <li>
                                    <a href="/admin/dashboard">대시보드</a>
                                </li>
                                <li>
                                    <a href="#">상품관리
                                        <i class="ion ion-ios-arrow-forward"></i>
                                    </a>
                                    <div class="v-drop-right" style="width: 150px;">
                                        <ul class="v-level-2">
                                            <li>
                                                <a href="/item/register">상품 등록</a>
                                            </li>
                                            <li>
                                                <a href="/item/itemList">재고 관리</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="/buy/buyList">구매관리</a>
                                </li>
                                <li>
                                    <a href="/user/userlist">회원관리</a>
                                </li>
                                <li>
                                    <a href="#">고객응대
                                        <i class="ion ion-ios-arrow-forward"></i>
                                    </a>
                                    <div class="v-drop-right" style="width: 150px;">
                                        <ul class="v-level-2">
                                            <li>
                                                <a href="/notice/list">공지</a>
                                            </li>
                                            <li>
                                                <a href="/question/list">문의</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            </c:if>
            <!-- 관리자 세션 종료 -->
            <div class="col-lg-9">
                <ul class="bottom-nav g-nav u-d-none-lg">
                    <li class="mega-position">
                        <a>카테고리
                            <i class="fas fa-chevron-down u-s-m-l-9"></i>
                        </a>
                        <div class="mega-menu mega-3-colm">
                            <ul>
                                <li class="menu-title"><a href="/item/categoryAll">전체</a></li>
                                <li class="menu-title"><a href="/item/category?category=한식">한식</a></li>
                                <li class="menu-title"><a href="/item/category?category=양식">양식</a></li>
                                <li class="menu-title"><a href="/item/category?category=중식">중식</a></li>
                                <li class="menu-title"><a href="/item/category?category=분식">분식</a></li>
                                <li class="menu-title"><a href="/item/category?category=야식">야식</a></li>
                                <li class="menu-title"><a href="/item/category?category=기타">기타</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="/item/newOrBest?itemType=1">신상품
                            <span class="superscript-label-new">NEW</span>
                        </a>
                    </li>
                    <li>
                        <a href="/item/newOrBest?itemType=2">인기상품
                            <span class="superscript-label-hot">HOT</span>
                        </a>
                    </li>
                    <li>
                        <a href="/notice/list">공지
                        </a>
                    </li>
                    <li>
                        <a href="/question/list">문의
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Bottom-Header /- -->
</header>
<!-- Header /- -->
</div>