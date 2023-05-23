<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.input_wrap, .u-s-m-b-30 {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 30px; /* 필요에 따라 조정할 수 있습니다 */
}
.u-s-m-b-25 {
	margin-top:10px;}
</style>
<head>
    <meta charset="UTF-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">aaaa
    <meta name="author" content="">
    <title>밀키트 등록</title>
    <!-- Standard Favicon -->
    <link href="favicon.ico" rel="shortcut icon">
    <!-- Base Google Font for Web-app -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    <!-- Google Fonts for Banners only -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
<!-- Page Introduction Wrapper -->
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>문의 등록</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="home.html">Home</a>
                </li>
                <li class="is-marked">
                    <a href="single-product.html">문의</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- Page Introduction Wrapper /- -->
    <form action="/question/enroll" method="post">
	<div class="input_wrap u-s-m-b-25">
    <label>카테고리</label>
		<select name="category">
			<option value="회원/정보관리">회원/정보관리</option>
			<option value="주문/결제">주문/결제</option>
			<option value="환불/교환">환불/교환</option>
			<option value="기타">기타</option>
		</select>
	</div>
	<div class="input_wrap u-s-m-b-30">
    	<label for="comment-name">제목
    		<span class="astk">*</span>
    	</label>
    	<input type="text" id="title" class="text-field1">
    </div>
    <div class="input_wrap u-s-m-b-30">
    	<label for="content">내용</label>
        	<textarea class="text-area1" id="content"></textarea>
    </div>
	<div class="input_wrap u-s-m-b-30">
    	<label for="writer">작성자
        	<span class="writer">*</span>
    	</label>
   		<input type="text" id="writer" class="text-field1">
	</div>
	<div class="input_wrap u-s-m-b-30">
    	<label for="password">비밀번호</label>
        	<input type="password" id="password" class="text-field1" placeholder="미입력시 열람불가">
	</div>
	<div class="u-s-m-b-30">
    	<button class="button button-outline-secondary w-123">문의등록</button>
	</div>
    </form>
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
<!-- Main -->
<script type="text/javascript" src="/resources/js/app.js"></script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>