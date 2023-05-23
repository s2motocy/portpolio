<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>Insert title here</title>
<style>

* {
   margin: 3px;
   padding: 0;
 }

 .admin {
   overflow: hidden;
   background-color: white;
   outline: 3px solid #ff6b00;
   border-radius: 10px;
   text-align: center;
   padding: 2% 2% 2% 2%;
   margin: 2%;
 }

a {
   color: black;
   font-weight: bold;
   text-decoration: none;
   padding-left: 60px;
   padding-right: 60px;
   
 }
 
hr {
  background-color: #ff6b00;
  width : 100%;
  height : 3px;
}

 #admin {
   font-size: 15px;
 }

 .dropdown {
   padding: 10px;
   display: inline-block;
 }

 .dropdown-content {
   width:180px;
   display: none;
   background-color: #FFCB9C;
   position: absolute;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
 }

.dropdown-content a {
   font-size: 12px;
   padding: 5px;
   display: block;
 }
 
 .dropdown-content a:hover {
   background-color: #EA9A56;
   
 }

 .dropdown:hover .dropdown-content {
   display: block;
   opacity: 0.9;
 }


/* .dropdown:hover .dropbtn {
	outline : 3px solid #ff6b00;
	 border-radius : 10px;	
} */

</style>
</head>
<body>
<div class="container">
<div class="admin">
<a href="dashboard" id="admin">대시보드</a>
	<div class="dropdown" >
     	<a href="#" class="dropbtn" id="admin">상품 관리</a>
          <div class="dropdown-content">
             <a href="/item/register">상품 등록</a>
             <a href="/item/itemList">상품 리스트</a>
             <a href="/item/itemUpdate">재고 관리</a>
          </div>
     </div>
     <a href="/user/userList" id="admin">회원 관리</a>
     <a href="/buy/buyList" id="admin">구매 관리</a>
     <div class="dropdown">
     	<a href="#" class="dropbtn" id="admin">회원 문의</a>
          <div class="dropdown-content">
             <a href="/board/list">Q&A</a>
	         <a href="/notie/list">공지</a>
          </div>
     </div>
     <a href="/user/userList" id="admin">통계</a>
     <a href="/user/userList" id="admin">설정</a>
</div>
<hr>
</div>
</body>
</html>                              
