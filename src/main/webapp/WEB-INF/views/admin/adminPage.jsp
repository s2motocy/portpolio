<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
    <title>Insert title here</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
</head>
<body>
    <div class="wrapper">
        <div class="wrap">
            <div class="navi_bar_area">
           		<a href="/item/register" id="admin1">상품 등록</a>
           		<a href="/item/itemList" id="admin2">상품 관리</a>
           		<a href="/member/memberList" id="admin3">회원 관리</a>
           		<a href="/buy/buyList" id="admin4">주문 내역 관리</a>
           		<a href="/item/buyList" id="admin4">QnA 관리</a>
           		<a href="/item/buyList" id="admin4">공지사항 관리</a>
            </div>
        </div>
    </div>
</body>
</html>
<!-- 대시보드 / 상품 관리 / 구매 관리 / 회원 관리 / 고객 문의(Q&A, 공지) / 결제 관리 / 재고 관리 / 통계 / 설정 -->