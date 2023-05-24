<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!doctype html>
<style>
.container {
	margin-top:10px;}
</style>
<html lang="en">
<body>
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
	<div class="row">
	    <c:forEach var="list" items="${list}">
	        <div class="item" class="col">
	            <div>
	                <a class="item-img-wrapper-link" href="item/detail?item_id=${list.item_id}">
	                   <img class="img-fluid" src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\','/')}/${list.attachList[0].uuid}_${list.attachList[0].fileName}" alt="Product" />
	                </a>
	            </div>
	            <div class="item-content">
	                <div class="what-product-is">
	                    <h6 class="item-title">
	                       <a href="item/detail?item_id=${list.item_id}">${list.item_name}</a>
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

    <!-- Banner-Layer -->
    <div class="banner-layer">       
    <!-- Banner-Layer /- -->
    

	 <!-- Dummy Selectbox -->
    <div class="select-dummy-wrapper">
        <select id="compute-select">
            <option id="compute-option">All</option>
        </select>
    </div>
    <!-- Dummy Selectbox /- -->
    <!-- Responsive-Search -->
<div class="responsive-search-wrapper">
        <button type="button" class="button ion ion-md-close" id="responsive-search-close-button"></button>
        <div class="responsive-search-container">
            <div class="container">
                <p>Start typing and press Enter to search</p>
                <form class="responsive-search-form">
                    <label class="sr-only" for="search-text">Search</label>
                    <input id="search-text" type="text" class="responsive-search-field" placeholder="PLEASE SEARCH">
                    <i class="fas fa-search"></i>
                </form>
            </div>
        </div>
    </div>
    <!-- Responsive-Search /- -->
    </div>
<!-- Google Analytics: change UA-XXXXX-Y to be your site's ID. -->
<script>
window.ga = function() {
    ga.q.push(arguments)
};
ga.q = [];
ga.l = +new Date;
ga('create', 'UA-XXXXX-Y', 'auto');
ga('send', 'pageview')
</script>
</body>

<%@ include file="include/footer.jsp" %> 