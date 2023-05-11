<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 밀키트</title>
<link rel="stylesheet" href="../resources/css/header.css">
</head>
<body>
	<!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                            <div class="header__top__right__social">
            					<a href="#"><i class="fa fa-facebook"></i></a>
           						<a href="#"><i class="fa fa-twitter"></i></a>
            					<a href="#"><i class="fa fa-instagram"></i></a>
        					</div>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__language">
                                <img src="https://www.printableworldflags.com/icon-flags/24/South%20Korea.png" alt="">
                                <div>Korean</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Korean</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                           <div class="header__top__right__auth">
							  <a href=""><i class="fa fa-sign-in"> 로그인</i></a>　
							  <a href="#"><i class="fa fa-user"> 회원가입</i></a>
							  <a href="#"><i class="fa fa-user-circle-o"> 마이페이지</i></a>　
							   <a href="#"><i class="fa fa-cart-arrow-down"> 장바구니</i></a>
						  </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3" id="a">
                    <div class="header__logo">
                        <a href="./index.jsp"><img src="/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.jsp">신상품</a></li>
                            <li><a href="./shop-grid.jsp">특가</a></li>
                            <li><a href="#">베스트셀러</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.jsp">Shop Details</a></li>
                                    <li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
                                    <li><a href="./checkout.jsp">Check Out</a></li>
                                </ul>
                            </li>
                            <li><a href="./contact.jsp">이벤트</a></li>
                            <li><a href="#">고객센터</a>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

</body>
</html>