<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/header.jsp" %>

<style>
.container {
	margin-top:10px;}
.category a {
	font-size:10px;
	color:#d90429;}
.slide-content a{
	padding-left:300px;
	color:#fff;
	font-weight:bold;
	text-decoration: underline;}
</style>

<body>
<div id="app">
	<div class="default-height ph-item">
		<div class="slider-main owl-carousel">
			<div class="bg-image one">
				<img alt="banner" src="/resources/images/banners/banner5.PNG">
				<div class="slide-content slide-animation">					
					<h1 style="color: #0e4cb3">신상 밀키트</h1>
					<h2><a href="/item/newOrBest?itemType=1">더보기→</a></h2>
					
				</div>
			</div>
			<div class="bg-image two">
				<img alt="banner" src="/resources/images/banners/banner4.PNG">
				<div class="slide-content-2 slide-animation">
					<h2 class="slide-2-h2-a">신선한</h2>
					<h3 class="slide-2-h2-b">밀키트 가득</h3>
				</div>
			</div>
			<div class="bg-image three">
				
				<img alt="banner" src="/resources/images/banners/mainlogo3.jpeg">
				<div class="slide-content slide-animation">
					<h1>간편한
						<span style="color:#fff">맛집</span>
					</h1>
					<h2><a href="/item/newOrBest?itemType=2">인기상품 더보기→</a></h2>
				</div>
			</div>
		</div>
	</div>
	<section>
		<div class="container">
			<div class="row">
				<c:forEach var="list" items="${list}" varStatus="stat">
					<div class="item" class="col">
						<div>
							<a class="item-img-wrapper-link" href="item/detail?item_id=${list.item_id}">
								<img src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\', '/')}/${list.attachList[0].uuid}_${list.attachList[0].fileName}" width="254px" height="254px" />
							</a>
						</div>
						<div class="item-content">
							<div class="what-product-is">
								<div class="category">
				                	<span><a href="/item/category?category=${list.category}">${list.category}</a></span>
				                </div>
								<h6 class="item-title">
									<a href="item/detail?item_id=${list.item_id}">${list.item_name}</a>
								</h6>
								<div class="star">
                                    <span id="your-stars" style='width:0'></span>
                                </div>
                                <span>(10)</span>
                                <input id="your-rating-value" type="hidden" class="input-field${stat.index}" value="${list.item_id}">
                                
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
	</section>
</div>
</body>
<%@ include file="include/footer.jsp" %>