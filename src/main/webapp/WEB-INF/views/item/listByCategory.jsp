<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
.category a {
	font-size:10px;
	color:#d90429;}
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
$(document).ready(function(e){
	$(".button.button-primary").click(function(e){
		var from  = $(".price-from")
		var to  = $(".price-to")
		from.text(from.text())
		to.text(to.text())
		
		var from_after  = from.text()
		var to_after = to.text()
		console.log("눌렸어요",from_after +"원", to_after)

		$.ajax({
		    url: "/item/between?start=" + from_after + "&end=" + to_after,
		    type: "GET",
			contentType: "application/json",
			dataType:"json",
			success: function(result) {
				console.log("사랑",result)
				$(".grid-style").empty()
				productContainer=$(".grid-style")
				var itemHtml =''
				$.each(result,function(idx,data){
					console.log(data.attachList[0])
					var imageurl = '/display?fileName=/'+ encodeURIComponent(data.attachList[0].uploadPath.replace('\\','/') +"\\"+data.attachList[0].uuid + '_'+ data.attachList[0].fileName)
					console.log(imageurl)
					itemHtml += '<div class="item"><div class="image-container"><a class="item-img-wrapper-link" href="single-product.html">' 
				  				+'<img class="img-fluid" src=' +  imageurl +' /> </a> </div>'
				  				+'<div class="item-content"><div class="what-product-is"><h6 class="item-title"><a href="single-product.html">'+ data.item_name + '</a></h6>'
		                     	+'<div class="item-stars"> <div class="star" title="0 out of 5 - based on 0 Reviews"> <span style="width:0"></span> </div> <span>(10)</span> </div> </div>'
		                     	+'<div class="price-template"> <div class="item-new-price">' +  data.item_price + ' 원 </div> </div> </div> </div>'
	                        
	                });
				 productContainer.append(itemHtml); 
	            },
	            error: function() {
	            	alert("맞는 상품이 없습니다");
	            }
	        });
	    });
	});
</script>

<body>
<!-- Page Introduction Wrapper -->
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>${category}</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="/">Home</a>
                </li>
                <li class="is-marked">
                    <a href="/item/category?category=${category}">${category}</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
	<div class="facet-filter-by-price">  
        <div class="price-bar">
			<a data-toggle="collapse" href="#faq-1">가격 설정</a>
				<div class="collapse" id="faq-1">
		            <div class="amount-result clearfix">
		                <div class="price-from"></div>
		                <div class="price-to"></div>
		            </div>
		            <div class="price-filter"></div>
		            <div class="price-slider-range" data-min="0" data-max="30000" data-default-low="0" data-default-high="10000" data-currency=""></div>
			            <button type="submit" class="button button-primary">Filter</button>
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
	    <c:forEach var="category" items="${categoryList}">
	        <div class="item" class="col">
		        <div class="image-container">
		            <a class="item-img-wrapper-link" href="/item/detail?item_id=${category.item_id}">
		                <img class="img-fluid" src="/display?fileName=/${category.attachList[0].uploadPath.replace('\\','/')}/${category.attachList[0].uuid}_${category.attachList[0].fileName}" alt="Product" width="225px" height="225px" />
		            </a>
		        </div>
	            <div class="item-content">
	                <div class="what-product-is">
	                	<div class="category">
		                	<span><a href="/item/category?category=${category.category}">${category.category}</a></span>
		                </div>
		                    <h6 class="item-title">
		                       <a href="/item/detail?item_id=${category.item_id}">${category.item_name}</a>
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
                       <fmt:formatNumber value="${category.item_price}" pattern="###,###원" />
                    </div>
                </div>
            </div>
          </div>
       </c:forEach>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>