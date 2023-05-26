<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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
                    <form>
                        <div class="row">
							<!-- Checkout -->
                            <div class="col-lg-12">
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
	                                                </td>
	                                                <td>
	                                                	<span class="order-span-quantity">x <c:out value="${dto.amount}" /></span>
	                                                </td>
	                                                <td>
	                                                    <h6 class="order-h6"><fmt:formatNumber value="${dto.buy_price}" pattern="###,### 원" /></h6>
	                                                </td>
	                                            </tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="u-s-m-b-13">
                                        <input type="radio" class="radio-box" name="payment-method" id="cash-on-delivery">
                                        <label class="label-text" for="cash-on-delivery">Cash on Delivery</label>
                                    </div>
                                    <div class="u-s-m-b-13">
                                        <input type="radio" class="radio-box" name="payment-method" id="credit-card-stripe">
                                        <label class="label-text" for="credit-card-stripe">Credit Card (Stripe)</label>
                                    </div>
                                    <div class="u-s-m-b-13">
                                        <input type="radio" class="radio-box" name="payment-method" id="paypal">
                                        <label class="label-text" for="paypal">Paypal</label>
                                    </div>
                                    <div class="u-s-m-b-13">
                                        <input type="checkbox" class="check-box" id="accept">
                                        <label class="label-text no-color" for="accept">I’ve read and accept the
                                            <a href="terms-and-conditions.html" class="u-c-brand">terms & conditions</a>
                                        </label>
                                    </div>
                                    <button type="submit" class="button button-outline-secondary">Place Order</button>
                                </div>
                            </div>
                            <!-- Checkout /- -->
                            <!-- Billing-&-Shipping-Details -->
                            <div class="col-lg-12">
                                <h4 class="section-h4">Billing Details</h4>
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
                                    <input type="tel" id="phone" name="phone" class="text-field" placeholder="전화번호를 입력해주세요 (ex.  01012340000)" required />
                                </div>
                                
                                
                                
                                <div class="u-s-m-b-13">
                                    <label for="select-country">Country
                                        <span class="astk">*</span>
                                    </label>
                                    <div class="select-box-wrapper">
                                        <select class="select-box" id="select-country">
                                            <option selected="selected" value="">Choose your country...</option>
                                            <option value="">United Kingdom (UK)</option>
                                            <option value="">United States (US)</option>
                                            <option value="">United Arab Emirates (UAE)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="street-address u-s-m-b-13">
                                    <label for="req-st-address">Street Address
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="text" id="req-st-address" class="text-field" placeholder="House name and street name">
                                    <label class="sr-only" for="opt-st-address"></label>
                                    <input type="text" id="opt-st-address" class="text-field" placeholder="Apartment, suite unit etc. (optional)">
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="town-city">Town / City
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="text" id="town-city" class="text-field">
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="select-state">State / Country
                                        <span class="astk"> *</span>
                                    </label>
                                    <div class="select-box-wrapper">
                                        <select class="select-box" id="select-state">
                                            <option selected="selected" value="">Choose your state...</option>
                                            <option value="">Alabama</option>
                                            <option value="">Alaska</option>
                                            <option value="">Arizona</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="u-s-m-b-13">
                                    <label for="postcode">Postcode / Zip
                                        <span class="astk">*</span>
                                    </label>
                                    <input type="text" id="postcode" class="text-field">
                                </div>
                                <div class="group-inline u-s-m-b-13">
                                    <div class="group-1 u-s-p-r-16">
                                        <label for="email">Email address
                                            <span class="astk">*</span>
                                        </label>
                                        <input type="text" id="email" class="text-field">
                                    </div>
                                    <div class="group-2">
                                        <label for="phone">Phone
                                            <span class="astk">*</span>
                                        </label>
                                        <input type="text" id="phone" class="text-field">
                                    </div>
                                </div>
                                <div class="u-s-m-b-30">
                                    <input type="checkbox" class="check-box" id="create-account">
                                    <label class="label-text" for="create-account">Create Account</label>
                                </div>
                                <!-- Form-Fields /- -->
                                <h4 class="section-h4">Shipping Details</h4>
                                <div class="u-s-m-b-24">
                                    <input type="checkbox" class="check-box" id="ship-to-different-address" data-toggle="collapse" data-target="#showdifferent">
                                    <label class="label-text" for="ship-to-different-address">Ship to a different address?</label>
                                </div>
                                <div class="collapse" id="showdifferent">
                                    <!-- Form-Fields -->
                                    <div class="group-inline u-s-m-b-13">
                                        <div class="group-1 u-s-p-r-16">
                                            <label for="first-name-extra">First Name
                                                <span class="astk">*</span>
                                            </label>
                                            <input type="text" id="first-name-extra" class="text-field">
                                        </div>
                                        <div class="group-2">
                                            <label for="last-name-extra">Last Name
                                                <span class="astk">*</span>
                                            </label>
                                            <input type="text" id="last-name-extra" class="text-field">
                                        </div>
                                    </div>
                                    <div class="u-s-m-b-13">
                                        <label for="select-country-extra">Country
                                            <span class="astk">*</span>
                                        </label>
                                        <div class="select-box-wrapper">
                                            <select class="select-box" id="select-country-extra">
                                                <option selected="selected" value="">Choose your country...</option>
                                                <option value="">United Kingdom (UK)</option>
                                                <option value="">United States (US)</option>
                                                <option value="">United Arab Emirates (UAE)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="street-address u-s-m-b-13">
                                        <label for="req-st-address-extra">Street Address
                                            <span class="astk">*</span>
                                        </label>
                                        <input type="text" id="req-st-address-extra" class="text-field" placeholder="House name and street name">
                                        <label class="sr-only" for="opt-st-address-extra"></label>
                                        <input type="text" id="opt-st-address-extra" class="text-field" placeholder="Apartment, suite unit etc. (optional)">
                                    </div>
                                    <div class="u-s-m-b-13">
                                        <label for="town-city-extra">Town / City
                                            <span class="astk">*</span>
                                        </label>
                                        <input type="text" id="town-city-extra" class="text-field">
                                    </div>
                                    <div class="u-s-m-b-13">
                                        <label for="select-state-extra">State / Country
                                            <span class="astk"> *</span>
                                        </label>
                                        <div class="select-box-wrapper">
                                            <select class="select-box" id="select-state-extra">
                                                <option selected="selected" value="">Choose your state...</option>
                                                <option value="">Alabama</option>
                                                <option value="">Alaska</option>
                                                <option value="">Arizona</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="u-s-m-b-13">
                                        <label for="postcode-extra">Postcode / Zip
                                            <span class="astk">*</span>
                                        </label>
                                        <input type="text" id="postcode-extra" class="text-field">
                                    </div>
                                    <div class="group-inline u-s-m-b-13">
                                        <div class="group-1 u-s-p-r-16">
                                            <label for="email-extra">Email address
                                                <span class="astk">*</span>
                                            </label>
                                            <input type="text" id="email-extra" class="text-field">
                                        </div>
                                        <div class="group-2">
                                            <label for="phone-extra">Phone
                                                <span class="astk">*</span>
                                            </label>
                                            <input type="text" id="phone-extra" class="text-field">
                                        </div>
                                    </div>
                                    <!-- Form-Fields /- -->
                                </div>
                                <div>
                                    <label for="order-notes">Order Notes</label>
                                    <textarea class="text-area" id="order-notes" placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
                                </div>
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