<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원수정페이지</title>
</head>
<body>
    <h1>member update</h1>
    <form method="get" action="update">
        <p>
            <label for="name"><input type="text" name="name" value="${vo.name}"></label>
        </p>
        <p>
            <label for="id"><input type="text" name="id" value="${vo.id}"></label>
        </p>
        <p>
            <label for="pwd"><input type="text" name="pwd" value="${vo.pwd}"></label>
        </p>
        <p>
            <label for="eamil"><input type="email" name="email" value="${vo.email}"></label>
        </p>
        <p>
            <label for="pnum"><input type="tel" name="pnum" value="${vo.pnum}"></label>
        </p>
        <p>
            <label for="hnum"><input type="tel" name="hnum" value="${vo.hnum}"></label>
        </p>
        <p>
            <label for="address"><input type="text" name="address" value="${vo.address}"></label>
        </p>
        <p>
            <label for="moreaddress"><input type="text" name="address" value="${vo.moreaddress}"></label>
        </p>
        <button type="submit">회원수정</button>
        <a href="home">홈으로가기</a>
        <a href="remove">탈퇴하러가기</a>
    </form>
</body>
</html>