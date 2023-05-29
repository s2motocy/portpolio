<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="include/header.jsp" %>

<style>
.container {
	margin-top:10px;}
.category a {
	font-size:10px;
	color:#d90429;}
</style>
<body>
<div id="app">
	<div class="default-height ph-item">
	    <div class="slider-main owl-carousel">
	        <div class="bg-image one">
	        <img alt="banner" src="/resources/images/banners/banner4.PNG">
	            <div class="slide-content slide-animation">
	                <h1>월요일</h1>
	                <h2>싫어</h2>
	            </div>
	        </div>
	        <div class="bg-image two">
	        <img alt="banner" src="/resources/images/banners/banner5.PNG">
	            <div class="slide-content-2 slide-animation">
	                <h2 class="slide-2-h2-a">화요일</h2>
	                <h2 class="slide-2-h2-b">싫어</h2>
	            </div>
	        </div>
	        <div class="bg-image three">
	        <img alt="banner" src="/resources/images/banners/mainlogo3.jpeg">
	            <div class="slide-content slide-animation">
	                <h1>수요일
	                    <span style="color:#333">목요일</span>
	                </h1>
	                <h2 style="color:#333">싫어</h2>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="container">
		<div class="row product-container grid-style">
		    <c:forEach var="list" items="${list}">
		        <div class="item" class="col">
			        <div class="image-container">
			            <a class="item-img-wrapper-link" href="item/detail?item_id=${list.item_id}">
			                <img class="img-fluid" src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\','/')}/${list.attachList[0].uuid}_${list.attachList[0].fileName}" alt="Product" width="225px" height="225px" />
			            </a>
			        </div>
			            <div class="item-content">
			                <div class="what-product-is">
			                	<div class="category">
				                	<span><a href="/item/category?category=${list.category}">${list.category}</a></span>
				                </div>
				                    <h6 class="item-title">
				                       <a href="single-product.html">${list.item_name}</a>
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
		                       <fmt:formatNumber value="${list.item_price}" pattern="###,### 원" />
		                    </div>
		                </div>
		            </div>
	          </div>
	       </c:forEach>
	    </div>
	</div>
</div>
</body>
<%@ include file="include/footer.jsp" %> 