<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="mypage" method="get"><h1>My Page</h1>
        <table>
            <tr>
                <th>이름</th>
                <th>항목</th>
            </tr>
            <tr>
                <td>name</td>
                <td><input name="name"  value="${vo.name}"/></td>
            </tr>
            <tr>
                <td>ID</td>
                <td><input name="id" value="${vo.id}"/></td>
            </tr>
            <tr>
                <td>password</td>
                  <td><input name="pwd" value="${vo.pwd}"/> </td>
                
            </tr>
            <tr>
                <td>email</td>
                  <td><input name="email" value="${vo.email}">/</td>
            </tr>
            <tr>
                <td>pnum</td>
                  <td><input name="pnum" value="${vo.pnum}"/></td>
            </tr>
            <tr>
                <td>hnum</td>
                  <td><input name="hnum" value="${vo.hnum}"/></td>
            </tr>
            <tr>
                <td>address</td>
                  <td><input name="address" value="${vo.address}"/></td>
            </tr>
            <tr>
                <td>address</td>
                  <td><input name="moreaddress" value="${vo.moreaddress}"/></td>
            </tr>
        </table>
    </form>
    <a href="update">수정하러가기</a>
    <a href="home">홈으로</a>
    <form action="logout" method="post">
        <button type="submit">로그아웃</button>
    </form>
</body>
</html>