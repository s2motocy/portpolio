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

<script>
$(document).ready(function () {
    const ratingStarsControl = function () {
      $('.item').each(function (index) {
        const $ratingField = $(this).find('.your-rating-value');
        const $starWidth = $(this).find('.your-stars');
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
				<c:forEach var="item" items="${list}" varStatus="stat">
					<div class="item" class="col">
						<div>
							<a class="item-img-wrapper-link" href="item/detail?item_id=${item.item_id}">
								<img src="/display?fileName=/${item.attachList[0].uploadPath.replace('\\', '/')}/${item.attachList[0].uuid}_${item.attachList[0].fileName}" width="254px" height="254px" />
							</a>
						</div>
						<div class="item-content">
							<div class="what-product-is">
								<div class="category">
				                	<span><a href="/item/category?category=${item.category}">${item.category}</a></span>
				                </div>
								<h6 class="item-title">
									<a href="item/detail?item_id=${item.item_id}">${item.item_name}</a>
								</h6>
								<div class="star">
                                    <span class="your-stars" style='width:0'></span>
                                </div>
                                <span>(${item.replyCnt})</span>
                                <input class="your-rating-value" type="hidden" class="text-field" value="${item.ratingAvg}">
                                
							</div>
							<div class="price-template">
								<div class="item-new-price">
									<fmt:formatNumber value="${item.item_price}" pattern="###,### 원" />
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