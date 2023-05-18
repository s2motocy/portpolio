<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        .box {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 200px;
            height: 200px;
            background-color: #ffffff;
            border: 1px solid #000000;
            padding: 3px;
        }

        .button {
            display: block;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #000000;
            color: #ffffff;
            text-decoration: none;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="/index"><img src="/resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="/index">메인</a></li>
                <li><a href="/item/itemList">상품</a></li>
                <li><a href="/board/list">문의</a></li>
                <li><a href="/notice/list">공지사항</a></li>
                <li><a href="#">정보</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="/user/login">로그인</a></li>
                        <li><a href="/user/join">회원가입</a></li>
                        <li><a href="/user/mypage">마이페이지</a></li>
                        <li><a href="/cart/cartList">장바구니</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/index"><img src="/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="/index">메인</a></li>
                            <li><a href="/item/itemList">상품</a></li>
							<li><a href="/board/list">문의</a></li>
                            <li><a href="/notice/list">공지사항</a></li>
                            <li><a href="#">정보</a>
                            <ul class="header__menu__dropdown">
		                        <li><a href="/user/login">로그인</a></li>
		                        <li><a href="/user/join">회원가입</a></li>
		                        <li><a href="/user/mypage">마이페이지</a></li>
	                            <li><a href="/cart/cartList">장바구니</a></li>
		               		</ul>
                        	</li> 
                    	</ul>
                	</nav>
            	</div>               
				 <div class="col-lg-3">
	                <div class="header__cart">
	                    <div class="box">
	                        <a href="/user/login" class="button">로그인</a>
	                        <a href="/user/join" class="button">회원가입</a>
	                        <a href="/user/mypage" class="button">마이페이지</a>
	                        <a href="/cart/cartList" class="button">장바구니</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="humberger__open">
	            <i class="fa fa-bars"></i>
	        </div>
	    </div>
	</header>
	<div class="col-lg-9">
	    <div class="hero__search">
	        <div class="hero__search__form">
	            <form action="#">
	                <input type="text" placeholder="검색어를 입력하세요">
	                <button type="submit" class="site-btn">검색</button>
	            </form>
	        </div>
	    </div>
	</div>
</body>
</html>	                        