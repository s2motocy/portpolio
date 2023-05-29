<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#post_code").value = data.zonecode;
           document.querySelector("#addr").value =  data.address;
        }
    }).open();
}

$(document).ready(function(){
	/* 상품별 '가격'x'수량' 을 '합계'에 입력 */
	const priced=()=>{
		$("td[class^=h-class]").each(function(idx, data){
			var price = parseInt($(data).find(".item_price"+idx).val())
			var amount = parseInt($(data).find(".amount"+idx).val())
			$(".totalData"+idx).text(price*amount)
		})
	}
	priced()
	
	/* '상품별 합계' 를 '결제예정금액' 에 입력 */
	const pricing=()=>{
		var total=0
		$("td[class^=h-class]").each(function(idx, data){
			total += parseInt($(".totalData"+idx).text())
		})
		$(".final-totals").text(total) // item 의 price 를 더해 total 에 전달
	}
	pricing() // 함수 호출
	
	/* 결제 API 활용 */
	$("#").click(function(e){ // #buybtn
		e.preventDefault()
		var buy_no = $("#buy_no").val()
		var item_name = $("#item_name0").val()+" 외"
		var sum_price = 0;
		$("input[id^=buy_price]").each(function(idx, data){ sum_price += parseInt($(this).val()) })
				
		requestPay(buy_no,item_name,sum_price)
	})
	  const IMP = window.IMP; // 생략 가능
	  IMP.init("imp86273375");
	  function requestPay(buy_no,item_name,sum_price) {
	    IMP.request_pay({
	      pg: "INIBillTst",
	      pay_method: "card",
	      merchant_uid: buy_no,   // 주문번호
	      name: item_name, // 이름
	      amount: sum_price // 숫자 타입
	    }, function (rsp) { // callback
	      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
			if(rsp.success){
				$('form').submit()
			} else {
				alert("결제에 실패하였습니다. ${rsp.error_msg}")
			}
	    });
	  }
})
</script>

<body>
<!-- app -->
<div id="app">
    <!-- Page Introduction Wrapper -->
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>비회원: 주문/결제하기</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="#">주문/결제</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Page Introduction Wrapper /- -->
    <!-- Checkout-Page -->
    <div class="page-checkout u-s-p-t-20">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <form action="register" method="post">
                        <div class="row">
							<!-- Checkout -->
                            <div class="col-lg-12 u-s-m-t-20">
                                <h4 class="section-h4">주문 상품</h4>
                                <div class="order-table">
                                    <table class="u-s-m-b-13">
                                        <thead>
                                            <tr>
                                                <th>상품</th>
                                                <th>수량</th>
                                                <th>합계</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="dto" items="${dlist}" varStatus="stat">
	                                            <tr>
	                                                <td>
	                                                	<img src="/display?fileName=/${vlist[stat.index].attachList[0].uploadPath.replace('\\', '/')}/${vlist[stat.index].attachList[0].uuid}_${vlist[stat.index].attachList[0].fileName}" width="100px" height="100px" />
	                                                    <h6 class="order-h6">${dto.item_name}</h6>
	                                                    <input type="hidden" name="buy_list[${stat.index}].item_name" value="${dto.item_name}" />
	                                                </td>
	                                                <td>
	                                                	<span class="order-span-quantity">x <c:out value="${dto.amount}" /></span>
	                                                	<input type="hidden" name="buy_list[${stat.index}].amount" value="${dto.amount }" />
	                                                </td>
	                                                <td class="h-class${stat.index}">
	                                                	<span class="totalData${stat.index}"></span>원
	                                                    <input type="hidden" class="totalprice${stat.index}" name="buy_list[${stat.index}].buy_price" value="${dto.buy_price}" />
	                                                    <input type="hidden" class="item_price${stat.index}" value="${dto.buy_price}" />
	                                                    <input type="hidden" name="buy_list[${stat.index}].buy_no" value="${dto.buy_no}" />
														<input type="hidden" name="buy_list[${stat.index}].item_id" value="${dto.item_id}" />
														<input type="hidden" class="amount${stat.index}" value="${dto.amount }" />
	                                                </td>
	                                            </tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="text-right">
                                    	<label for="calc-text">총합: </label>
	                                	<span class="calc-text final-totals">0</span>원
	                                </div>
                                </div>
                            </div>
                            <!-- Checkout /- -->
                            <!-- Billing-&-Shipping-Details -->
                            <div class="col-lg-6 u-s-m-t-20">
                                <h4 class="section-h4">구매자 정보</h4>
                                <!-- Form-Fields -->
                                <div class="u-s-m-b-13">
                                    <label for="buyer_name">구매자 이름
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="text" id="buyer_name" name="buyer_name" class="text-field" placeholder="아이디를 입력해주세요" required />
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="pwd">비밀번호
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="password" id="pwd" name="pwd" class="text-field" placeholder="비밀번호를 입력해주세요 (4자 이상)" required />
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="phone">연락처
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="tel" id="phone" name="phone" class="text-field" placeholder="전화번호를 입력해주세요 ( - 하이픈 없이)" required />
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="post_code">우편번호
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="text" id="post_code" name="post_code" class="text-field" placeholder="우편번호 찾기를 이용하세요" required />
                                    <input type="button" value="우편번호찾기" onclick="kakaopost()" />
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="addr">주소
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="text" id="addr" name="addr" class="text-field" required />
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="addr2">상세주소
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="text" id="addr2" name="addr2" class="text-field" placeholder="상세주소를 입력해주세요" required />
                                    <input type="hidden" id="buy_no" name="buy_no" value="${data.buy_no}" />
                                </div>
							</div>
							    <!-- Form-Fields /- -->
							<div class="col-lg-6 u-s-m-t-20">
                                
                                <h4 class="section-h4">배송 정보</h4>
                                <div class="u-s-m-b-24">
                                    <input type="radio" id="ship-to-different-address" checked />
                                    <label class="label-text" for="ship-to-different-address">입력된 구매자정보 활용</label>
                                </div>
                                <div>
                                    <label for="order-notes">배송시 요청사항</label>
                                    <textarea class="text-area" id="buy_note" name="buy_note" placeholder="배송시 요청사항을 입력해주세요"></textarea>
                                </div>
                                <button type="submit" class="button button-outline-secondary u-s-m-t-10">주문하기</button>
                            </div>
                            <!-- Billing-&-Shipping-Details /- -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout-Page /- -->
</div>
</body>
<%@ include file="../include/footer.jsp" %>