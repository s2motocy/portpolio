<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	
	const ratingStarsControl = function () {
	      $('.item').each(function (idx) {
	        const $ratingField = $(this).find('.your-rating-value'+idx);
	        const $starWidth = $(this).find('.your-stars'+idx);
	        const $starComment = $(this).find('.star-comment');

	        let r = $ratingField.val();
	        console.log(r);
	        setTimeout(() => {
	          console.log('여기 호출은?');
	          $ratingField.val(Number(r) + Number(0.0));
	          $ratingField.trigger('keyup');
	        }, 1);

	        let oneStarWidth = 15; // 15 * 5 = 75
	        let newStarWidth;
	        let ratingthresholdNumber = 5;
	        let comment;
	        let currentVal;

	        $ratingField.on('keyup', function () {
	          $starWidth.css('width', 0);
	          $starComment.text('');

	          if ($.isNumeric($ratingField.val())) {
	            currentVal = parseFloat($ratingField.val());
	          } else {
	            currentVal = NaN;
	          }

	          if (!currentVal || currentVal === '' || currentVal === 'NaN' || currentVal === 0) {
	            currentVal = 0;
	            $starWidth.css('width', 0);
	            $starComment.text('');
	          } else {
	            if (currentVal >= 1 && currentVal <= ratingthresholdNumber) {
	              if (currentVal === 1) {
	                comment = 'I hate it.';
	              } else if (currentVal === 2) {
	                comment = "I don't like it.";
	              } else if (currentVal === 3) {
	                comment = "It's OK.";
	              } else if (currentVal === 4) {
	                comment = "I like it.";
	              } else if (currentVal === 5) {
	                comment = "It's Perfect.";
	              }

	              currentVal = currentVal.toFixed(1);
	              newStarWidth = oneStarWidth * currentVal;
	              newStarWidth = Math.floor(newStarWidth);

	              $starWidth.css('width', newStarWidth);
	              $starComment.text(comment);
	            }
	          }
	        });
	      });
	    };

	    ratingStarsControl();
});
</script>

<body>
<!-- Page Introduction Wrapper -->
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
        	<c:choose>
        		<c:when test="${itemType == 1}">
            		<h2>신상품</h2>
            	</c:when>
            	<c:otherwise>
            		<h2>인기상품</h2>
            	</c:otherwise>
            </c:choose>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="/">Home</a>
                </li>
                <li class="is-marked">
                	<c:choose>
		        		<c:when test="${itemType == 1}">
		            		<a href="/item/newOrBest?itemType=1">신상품</a>
		            	</c:when>
		            	<c:otherwise>
		            		<a href="/item/newOrBest?itemType=2">인기상품</a>
		            	</c:otherwise>
		            </c:choose>
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
	    <c:forEach var="newitem" items="${newItemList}" varStatus="stat">
	        <div class="item" class="col">
		        <div class="image-container">
		            <a class="item-img-wrapper-link" href="/item/detail?item_id=${newitem.item_id}">
		                <img class="img-fluid" src="/display?fileName=/${newitem.attachList[0].uploadPath.replace('\\','/')}/${newitem.attachList[0].uuid}_${newitem.attachList[0].fileName}" alt="Product" width="225px" height="225px" />
		            </a>
		        </div>
	            <div class="item-content">
	                <div class="what-product-is">
	                	<div class="category">
		                	<span><a href="/item/category?category=${newitem.category}">${newitem.category}</a></span>
		                </div>
		                    <h6 class="item-title">
		                       <a href="/item/detail?item_id=${newitem.item_id}">${newitem.item_name}</a>
		                    </h6>
		                    <div class="item-stars">
		                        <div class="star">
                                    <span class="your-stars${stat.index}" style='width:0'></span>
                                </div>
                                <span>(${newitem.replyCnt})</span>
                                <input class="your-rating-value${stat.index}" type="hidden" value="${newitem.ratingAvg}">
		                    </div>
	                </div>
	                <div class="price-template">
	                    <div class="item-new-price">
	                       <fmt:formatNumber value="${newitem.item_price}" pattern="###,### 원" />
	                    </div>
                	</div>
	            </div>
          </div>
       </c:forEach>
    </div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>