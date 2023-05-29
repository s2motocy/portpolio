<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<style>
/* 리뷰쓰기 버튼 */
.reply_button_wrap {
	padding: 2px;}
.reply_button_wrap button {
	background-color: #FACC2E;
	color: white;
	font-weight: bold;
	font-size: 15px;
	padding: 5px 12px;
	cursor: pointer;}
.reply_button_wrap button:hover {
	background-color: #FACC2E;}

/* 리뷰 영역 */
.content_bottom {
	width: 80%;
	margin: auto;}
.reply_content_ul {
	list-style: none;}
.comment_wrap {
	position: relative;
	border-bottom: 1px dotted #d4d4d4;
	padding: 14px 0 10px 0;
	font-size: 12px;}

/* 리뷰 머리 부분 */
.reply_top {
	padding-bottom: 10px;}
.id_span {
	padding: 0 15px 0 3px;
	font-weight: bold;}
.date_span {
	padding: 0 15px 0;}
	
/* 리뷰 컨텐트 부분 */
.reply_bottom {
	padding-bottom: 10px;}

/* 리뷰 선 */
.reply_line {
	width: 80%;
	margin: auto;
	border-top: 1px solid #c6c6cf;}

/* 리뷰 제목 */
.reply_subject h2 {
	padding: 15px 0 5px 5px;}

/* pageMaker */
.repy_pageInfo_div {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 40px;}
.pageMaker {
	list-style: none;
	display: inline-block;}
.pageMaker_btn {
	float: left;
	width: 25px;
	height: 25px;
	line-height: 25px;
	margin-left: 20px;
	font-size: 10px;
	cursor: pointer;}
.active {
	border: 2px solid black;
	font-weight: 400;}
.next,
.prev {
	border: 1px solid #ccc;
	padding: 0 10px;}

/* 리뷰 없는 경우 div */
.reply_not_div {
	text-align: center;}
.reply_not_div span {
	display: block;
	margin-top: 30px;
	margin-bottom: 20px;}

/* 리뷰 수정 삭제 버튼 */
.update_reply_btn {
	font-weight: bold;
	background-color: #819FF7;
	display: inline-block;
	width: 40px;
	text-align: center;
	height: 20px;
	line-height: 20px;
	margin: 0 5px 0 30px;
	border-radius: 6px;
	color: white;
	cursor: pointer;}
.delete_reply_btn {
	font-weight: bold;
	background-color: #e7578f;
	display: inline-block;
	width: 40px;
	text-align: center;
	height: 20px;
	line-height: 20px;
	border-radius: 6px;
	color: white;
	cursor: pointer;}
</style>

<script>
$(document).ready(function () {
	const item_id = '${list.item_id}';
	/* "장바구니에 담기" 버튼 클릭시 수량값 실어보내기 */
	$(".gocart").click(function (e) {
		var amount = parseInt($(".quantity-text-field").val())
		$(".quantity-text-field").val(amount)
		$(".post-form").submit()
	})
	$.getJSON("/reply/list", { item_id: item_id }, function (obj) {
		makeReplyContent(obj);
	});
	/* 재고 10개 미만시 - "매진임박", 소진시 - "재고준비중" 표기 및 버튼 비활성화 */
	if (parseInt($(".stockData").val()) == 0) {
		$(".available").text("재고준비중").attr('style', 'color:gray')
		$(".stock").attr('style', 'color:gray')
		$(".gocart").text('재료소진').attr('disabled', true).attr('style', 'color:#d3d3d3;border:none;')
	} else if (parseInt($(".stockData").val()) <= 10) {
		$(".available").text("매진임박").attr('style', 'color:red')
		$(".stock").attr('style', 'color:red')
	}

	/* 수량 적용하기 */
	$("a[class^=plus-a]").click(function (e) {
		var amount = parseInt($(".amountData").val())
		$(".amountData").val(amount)
	})

	$("a[class^=minus-a]").click(function (e) {
		var amount = parseInt($(".amountData").val())
		$(".amountData").val(amount)
	})

	/* 리뷰쓰기 */
	$(".reply_button_wrap").on("click", function (e) {
		e.preventDefault();
		const user_id = '${vo.user_id}';
		const item_id = '${list.item_id}';
		$.ajax({
			data: {
				item_id: item_id,
				user_id: user_id
			},
			url: '/reply/check',
			type: 'POST',
			success: function (result) {
				if (result === '1') {
					alert("이미 등록된 리뷰가 존재 합니다.")
				} else if (result === '0') {
					let popUrl = "/item/replyEnroll/" + user_id + "?item_id=" + item_id;
					console.log(popUrl);
					let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
					window.open(popUrl, "리뷰 쓰기", popOption);
				}
			}
		});
	});
	/* 댓글 페이지 정보 */
	const cri = {
		item_id: '${list.item_id}',
		pageNum: 1,
		amount: 10
	}
	/* 댓글 페이지 이동 버튼 동작 */
	$(document).on('click', '.pageMaker_btn a', function (e) {
		e.preventDefault();
		let page = $(this).attr("href");
		cri.pageNum = page;
		replyListInit();
	});
	/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
	let replyListInit = function () {
		$.getJSON("/reply/list", cri, function (obj) {
			makeReplyContent(obj);
		});
	}
	/* 리뷰 수정 버튼 */
	$(document).on('click', '.update_reply_btn', function (e) {
		e.preventDefault();
		let reply_id = $(this).attr("href");
		let popUrl = "/item/replyUpdate?reply_id=" + reply_id + "&item_id=" + '${list.item_id}' + "&user_id=" + '${vo.user_id}';
		let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"
		window.open(popUrl, "리뷰 수정", popOption);
	});
	/* 리뷰 삭제 버튼 */
	$(document).on('click', '.delete_reply_btn', function (e) {
		e.preventDefault();
		let reply_id = $(this).attr("href");
		$.ajax({
			data: {
				reply_id: reply_id,
				item_id: '${list.item_id}'
			},
			url: '/reply/delete',
			type: 'POST',
			success: function (result) {
				replyListInit();
				alert('삭제가 완료되엇습니다.');
			}
		});
	});
	/* 댓글(리뷰) 동적 생성 메서드 */
	function makeReplyContent(obj) {
		if (obj.list.length === 0) {
			$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
			$(".reply_content_ul").html('');
			$(".pageMaker").html('');
		} else {
			$(".reply_not_div").html('');
			const list = obj.list;
			const pf = obj.pageInfo;
			const uid = '${vo.user_id}';
			/* list */
			let reply_list = '';
			$(list).each(function (i, obj) {
				reply_list += '<li>';
				reply_list += '<div class="comment_wrap">';
				reply_list += '<div class="reply_top">';
				/* 아이디 */
				reply_list += '<span class="id_span">' + obj.user_id + '</span>';
				/* 평점 */
				reply_list += '<span class="rating_span"> 평점 : <span class="rating_value_span">' + obj.rating + '</span>/5 점</span>';
				/* 날짜 */
				reply_list += '<span class="date_span">' + obj.regDate + '</span>';
				if (obj.user_id === uid) {
					reply_list += '<a class="update_reply_btn" href="' + obj.reply_id + '">수정</a><a class="delete_reply_btn" href="' + obj.reply_id + '">삭제</a>';
				}
				reply_list += '</div>';
				reply_list += '<div class="reply_bottom">';
				reply_list += '<div class="reply_bottom_txt">' + obj.content + '</div>';
				reply_list += '</div>';
				reply_list += '</div>';
				reply_list += '</li>';
			});
			$(".reply_content_ul").html(reply_list);
			/* 페이지 버튼 */
			let reply_pageMaker = '';
			/* prev */
			if (pf.prev) {
				let prev_num = pf.pageStart - 1;
				reply_pageMaker += '<li class="pageMaker_btn prev">';
				reply_pageMaker += '<a href="' + prev_num + '">이전</a>';
				reply_pageMaker += '</li>';
			}
			/* numbre btn */
			for (let i = pf.pageStart; i < pf.pageEnd + 1; i++) {
				reply_pageMaker += '<li class="pageMaker_btn ';
				if (pf.cri.pageNum === i) {
					reply_pageMaker += 'active';
				}
				reply_pageMaker += '">';
				reply_pageMaker += '<a href="' + i + '">' + i + '</a>';
				reply_pageMaker += '</li>';
			}
			/* next */
			if (pf.next) {
				let next_num = pf.pageEnd + 1;
				reply_pageMaker += '<li class="pageMaker_btn next">';
				reply_pageMaker += '<a href="' + next_num + '">다음</a>';
				reply_pageMaker += '</li>';
			}
			console.log(reply_pageMaker);
			$(".pageMaker").html(reply_pageMaker);
		}
	}
	
	
})
</script>

<body>
<div id="app">
	<!-- Page Introduction Wrapper -->
	<div class="page-style-a">
		<div class="container">
			<div class="page-intro">
				<h2>상세 정보</h2>
				<ul class="bread-crumb">
					<li class="has-separator">
						<i class="ion ion-md-home"></i>
						<a href="#">Home</a>
					</li>
					<li class="is-marked">
						<a href="#">상세 정보</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Page Introduction Wrapper /- -->
	<!-- Single-Product-Full-Width-Page -->
	<div class="page-detail u-s-p-t-80">
		<div class="container">
			<!-- Product-Detail -->
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12">
					<!-- Product-zoom-area -->
					<div class="zoom-area">
						<img class="img-fluid"
							src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\', '/')}/${list.attachList[0].uuid}_${list.attachList[0].fileName}"
							alt="Zoom Image" width="1600px" height="1600px">
					</div>
					<!-- Product-zoom-area /- -->
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12">
					<!-- Product-details -->
					<div class="all-information-wrapper">
						<div class="section-1-title-breadcrumb-rating">
							<div class="product-title">
								<h1>
									<a href="#">${list.item_name}</a>
								</h1>
							</div>
							<ul class="bread-crumb">
								<li class="has-separator">
									<a href="/">Home</a>
								</li>
								<li class="has-separator">
									<a href="#">전체</a>
								</li>
								<li class="is-marked">
									<a href="#">한식</a>
								</li>
							</ul>
							<div class="product-rating">
								<div class="star">
                                    <span id="your-stars" style='width:0'></span>
                                </div>
                                <span>(23)</span>
                                <input id="your-rating-value" type="hidden" class="input-field" value="${list.item_id}">
							</div>
						</div>
						<div class="section-2-short-description u-s-p-y-14">
							<h6 class="information-heading u-s-m-b-8">상세설명:</h6>
							<p>${list.description}</p>
						</div>
						<div class="section-3-price-original-discount u-s-p-y-14">
							<div class="price">
								<h4>
									<fmt:formatNumber value="${list.item_price}" pattern="###,### 원" />
								</h4>
							</div>
							<div class="original-price">
								<span>단가:</span>
								<span>
									<fmt:formatNumber value="${list.item_price}" pattern="###,### 원" />
								</span>
							</div>
							<div class="discount-price">
								<span>할인:</span>
								<span>0%</span>
								<span><img
										src="https://cdn-pro-web-134-253.cdn-nhncommerce.com/mychef1_godomall_com/data/skin/front/udweb_pc_20200903/img/common/btn/btn_coupon_apply.png" /></span>
							</div>
						</div>
						<div class="section-4-sku-information u-s-p-y-14">
							<h6 class="information-heading u-s-m-b-8">판매 정보:</h6>
							<div class="availability">
								<span>상태:</span>
								<span class="available">구매 가능</span>
							</div>
							<div class="left">
								<span>재고:</span>
								<span class="stock">${list.item_stock} 개 남음</span>
								<input type="hidden" class="stockData" value="${list.item_stock}" />
							</div>
						</div>
						<div class="section-6-social-media-quantity-actions u-s-p-y-14">
							<form action="/cart/register" method="post" class="post-form">
								<div class="quantity-wrapper u-s-m-b-22">
									<span>수량:</span>
									<div class="quantity">
										<input type="text" class="quantity-text-field amountData"
											name="amount" value="1">
										<a class="plus-a" data-max="1000">&#43;</a>
										<a class="minus-a" data-min="1">&#45;</a>
									</div>
								</div>
								<div class="hiddenData">
									<input type="hidden" name="item_id" value="${list.item_id}" />
									<input type="hidden" name="item_name" value="${list.item_name}" />
									<input type="hidden" name="item_price" value="${list.item_price}" />
									<input type="hidden" name="user_id" value="${user_id}" />
								</div>
								<div>
									<button
										class="button button-outline-secondary far fa-heart u-s-m-l-6"></button>
									<button class="button button-outline-secondary gocart"
										type="submit">장바구니에 담기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- Product-details /- -->
				</div>
			</div>
			<!-- Product-Detail /- -->
			<!-- Detail-Tabs -->
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="detail-tabs-wrapper u-s-p-t-80">
						<div class="detail-nav-wrapper u-s-m-b-30">
							<ul class="nav single-product-nav justify-content-center">
								<li class="nav-item">
									<a class="nav-link active" data-toggle="tab"
										href="#description">상세설명</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-toggle="tab" href="#specification">기본</a>
								</li>
							</ul>
							<div class="reply_subject">
								<h2>리뷰</h2>
							</div>
							<c:if test="${vo != null}">
								<div>
									<button class="reply_button_wrap">리뷰 쓰기</button>
								</div>
							</c:if>
							<div class="reply_not_div">
							</div>
							<ul class="reply_content_ul">
							</ul>
							<div class="reply_pageInfo_div">
								<ul class="pageMaker">
								</ul>
							</div>
						</div>
						<div class="tab-content">
							<!-- Description-Tab -->
							<div class="tab-pane fade active show" id="description">
								<div class="description-whole-container">
									<p class="desc-p u-s-m-b-26">${list.description}
									</p>
								</div>
							</div>
							<!-- Description-Tab /- -->
						</div>
					</div>
				</div>
			</div>
			<!-- Detail-Tabs /- -->
		</div>
	</div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>