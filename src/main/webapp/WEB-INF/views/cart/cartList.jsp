<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<body>

<div id="app">
    <!-- Page Introduction Wrapper -->
    <div class="page-style-a">
        <div class="container">
            <div class="page-intro">
                <h2>장바구니</h2>
                <ul class="bread-crumb">
                    <li class="has-separator">
                        <i class="ion ion-md-home"></i>
                        <a href="/">Home</a>
                    </li>
                    <li class="is-marked">
                        <a href="/cart/cartList">장바구니</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Page Introduction Wrapper /- -->
    <!-- Cart-Page -->
    <div class="page-cart u-s-p-t-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <form id="frm">
                        <!-- Products-List-Wrapper -->
                        <div class="table-wrapper u-s-m-b-60">
                            <table>
                                <thead>
                                    <tr>
                                        <th>상품</th>
                                        <th>단가</th>
                                        <th>수량</th>
                                        <th>합계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="list" items="${dtoList}" varStatus="stat">
	                                    <tr>
	                                        <td>
	                                            <div class="cart-anchor-image">
	                                                <a href="#">
	                                                    <img src="/display?fileName=/${list.attachList[0].uploadPath.replace('\\', '/')}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}" width="50px" height="50px" />
	                                                    <h6> ${list.item_name} </h6>
	                                                    <input type="hidden" name="buy_list[${stat.index}].item_name" value="${list.item_name}" />
	                                                </a>
	                                            </div>
	                                        </td>
	                                        <td>
	                                            <div class="cart-price">
	                                                <fmt:formatNumber value="${list.item_price}" pattern="###,### 원" />
	                                                <input type="hidden" name="buy_list[${stat.index}].buy_price" value="${list.item_price}" />
	                                            </div>
	                                        </td>
	                                        <td>
	                                            <div class="cart-quantity">
	                                                <div class="quantity">
	                                                    <input type="text" class="quantity-text-field" name="buy_list[${stat.index}].amount" value="1">
	                                                    <a class="plus-a" data-max="1000">&#43;</a>
	                                                    <a class="minus-a" data-min="1">&#45;</a>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td>
	                                            <div class="action-wrapper">
	                                                <button class="button button-outline-secondary fas fa-sync" id="apply${stat.index}"></button>
	                                                <button class="button button-outline-secondary fas fa-trash" id="remove${stat.index}" data-cart_id="${list.cart_id}"></button>
	                                            </div>
	                                            <input type="hidden" id="userData${stat.index}" value="${list.user_id}" />
	                                            <input type="hidden" id="itemData${stat.index}" name="buy_list[${stat.index}].item_id" value="${list.item_id}" />
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Products-List-Wrapper /- -->
                        
                        <div class="coupon-continue-checkout u-s-m-b-60">
                            <div class="button-area">
                                <a href="/cart/cartList" class="continue">계속 쇼핑하기</a>
                                <a href="#" class="checkout">구매 로 이동</a>
                            </div>
                        </div>
                    </form>
                    <!-- Billing -->
                    <div class="calculation u-s-m-b-60">
                        <div class="table-wrapper-2">
                            <table>
                                <thead>
                                    <tr>
                                        <th colspan="2">결제예정 금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <h3 class="calc-h3 u-s-m-b-0">상품 금액</h3>
                                        </td>
                                        <td>
                                            <span class="calc-text">$222.00</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h3 class="calc-h3 u-s-m-b-0">할인</h3>
                                        </td>
                                        <td>
                                            <span class="calc-text">$20.00</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h3 class="calc-h3 u-s-m-b-0">배송비</h3>
                                            <span><font size="1">10,000원 이상시 무료배송</font></span>
                                        </td>
                                        <td>
                                            <span class="calc-text">$0.00</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h3 class="calc-h3 u-s-m-b-0">총 합계</h3>
                                        </td>
                                        <td>
                                            <span class="calc-text">$220.00</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- Billing /- -->
                </div>
            </div>
        </div>
    </div>
    <!-- Cart-Page /- -->

</div>

</body>

<%@ include file="../include/footer.jsp" %>
