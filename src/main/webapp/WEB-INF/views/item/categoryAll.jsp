<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../include/header.jsp" %>

<style>
.container{
	margin-top:10px;}
.facet-filter-by-price {
	padding:2%;
	width:30%;
	margin-top:35px;
	margin-left:1.3%;
	background-color: #f8f9fa;}
.price-bar{
	font-weight:bold;}
.shop-settings {
	padding-left:1.3%;}
</style>

<script>
const attachClickGridAndList = function () {
    $('#list-anchor').on('click',function () {
        $(this).addClass('active');
        $(this).next().removeClass('active');
        $shopProductContainer.removeClass('grid-style');
        $shopProductContainer.addClass('list-style');
    });
    $('#grid-anchor').on('click',function () {
        $(this).addClass('active');
        $(this).prev().removeClass('active');
        $shopProductContainer.removeClass('list-style');
        $shopProductContainer.addClass('grid-style');
    });
};
</script>

<body>
<!-- Page Introduction Wrapper -->
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>전체 상품</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="home.html">Home</a>
                </li>
                <li class="is-marked">
                    <a href="single-product.html">전체</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
	<div class="facet-filter-by-price">  
        <div class="price-bar">
			<a data-toggle="collapse" href="#faq-1">가격 설정</a>
				<div class="collapse show" id="faq-1">
					<p>
					<form class="facet-form" action="#" method="post">
			            <!-- Final-Result -->
			            <div class="amount-result clearfix">
			                <div class="price-from">₩0</div>
			                <div class="price-to">₩30,000</div>
			            </div>
			            <!-- Final-Result /- -->
			            <!-- Range-Slider  -->
			            <div class="price-filter"></div>
			            <!-- Range-Slider /- -->
			            <!-- Range-Manipulator -->
			            <div class="price-slider-range" data-min="0" data-max="5000" data-default-low="0" data-default-high="10000" data-currency="₩"></div>
			            <!-- Range-Manipulator /- -->
			            <button type="submit" class="button button-primary">Filter</button>
			        </form>
					</p>
				</div>
			</div>
	</div>
	<div class="shop-settings">
		<a id="list-anchor" class="active">
	        <i class="fas fa-th-list"></i>
	    </a>
	    <a id="grid-anchor">
	        <i class="fas fa-th"></i>
	    </a>
	</div>
	<div class="row product-container grid-style">
	    <c:forEach var="list" items="${itemList}">
	        <div class="item" class="col">
		        <div class="image-container">
		            <a class="item-img-wrapper-link" href="/item/detail?item_id=${list.item_id}&user_id=${user_id}">
		                <img class="img-fluid" src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\','/')}/${list.attachList[0].uuid}_${list.attachList[0].fileName}" alt="Product" width="225px" height="225px" />
		            </a>
		        </div>
		            <div class="item-content">
		                <div class="what-product-is">
		                    <h6 class="item-title">
		                       <a href="/item/detail?item_id=${list.item_id}&user_id=${user_id}">${list.item_name}</a>
		                    </h6>
		                    <div class="item-stars">
		                        <div class='star' title="0 out of 5 - based on 0 Reviews">
		                            <span style='width:0'></span>
		                        </div>
		                        <span>(10)</span>
		                    </div>
		                </div>
		                <div class="price-template">
	                    <div class="item-new-price">
	                       ${list.item_price}원
	                    </div>
	                </div>
	            </div>
          </div>
       </c:forEach>
    </div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>