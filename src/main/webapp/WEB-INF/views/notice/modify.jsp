<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ include file="../include/header.jsp" %>

                <body>
                    <style>
                        .btn_wrap {
                            margin-top: 20px;
                            text-align: center;
                        }

                        .btn {
                            display: inline-block;
                            padding: 10px 20px;
                            border: none;
                            border-radius: 4px;
                            cursor: pointer;
                            margin-right: 10px;
                        }

                        .btn-primary {
                            background-color: #ff6b00;
                            color: #fff;
                        }

                        .btn-secondary {
                            background-color: #ff6b00;
                            color: #fff;
                        }

                        .btn-danger {
                            background-color: #ff6b00;
                            color: #fff;
                        }

                        .btn-success {
                            background-color: #ff6b00;
                            color: #fff;
                        }

                        #modifyForm .form-group {
                            width: 50%;
                            /* 다른 스타일 옵션들 */
                        }

                        #modifyForm {
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            justify-content: center;
                            height: 100vh;
                            /* 다른 스타일 옵션들 */
                        }
                    </style>
                    <div class="page-style-a">
                        <div class="container">
                            <div class="page-intro">
                                <h2>공지사항 수정</h2>
                                <ul class="bread-crumb">
                                    <li class="has-separator">
                                        <i class="ion ion-md-home"></i>
                                        <a href="/">Home</a>
                                    </li>
                                    <li class="is-marked">
                                        <a href="modify">공지사항 수정</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <form id="modifyForm" action="/notice/modify" method="post">
                            <div class="form-group">
                                <label>게시판 번호</label>
                                <input class="form-control" name="bno" readonly="readonly"
                                    value='<c:out value="${pageInfo.bno}"/>'>
                            </div>
                            <div class="form-group">
                                <label>게시판 제목</label>
                                <input class="form-control" name="title" value='<c:out value="${pageInfo.title}"/>'>
                            </div>
                            <div class="form-group">
                                <label>게시판 내용</label>
                                <textarea class="form-control" rows="3"
                                    name="content"><c:out value="${pageInfo.content}"/></textarea>
                            </div>
                            <div class="form-group">
                                <label>게시판 작성자</label>
                                <input class="form-control" name="id" readonly="readonly"
                                    value='<c:out value="${pageInfo.writer}"/>'>
                            </div>
                            <div class="btn_wrap">
                                <a class="btn btn-primary" id="list_btn">목록 페이지</a>
                                <a class="btn btn-secondary" id="cancel_btn">수정 취소</a>
                                <a class="btn btn-danger" id="delete_btn">삭제</a>
                                <input type='submit' class="btn btn-success" value='수정 완료' />
                            </div>
                        </form>
                        <form id="infoForm" action="/notice/modify" method="get">
                            <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
                        </form>
                    </div>
                    <script>
                        let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
                        let mForm = $("#modifyForm");    // 페이지 데이터 수정 from

                        /* 목록 페이지 이동 버튼 */
                        $("#list_btn").on("click", function (e) {
                            form.find("#bno").remove();
                            form.attr("action", "/notice/list");
                            form.submit();
                        });

                        /* 수정 하기 버튼 */
                        $("#modify_btn").on("click", function (e) {
                            mForm.submit();
                        });

                        /* 취소 버튼 */
                        $("#cancel_btn").on("click", function (e) {
                            form.attr("action", "/notice/get");
                            form.submit();
                        });
                        /* 삭제 버튼 */
                        $("#delete_btn").on("click", function (e) {
                            form.attr("action", "/notice/delete");
                            form.attr("method", "post");
                            form.submit();
                        });
                    </script>
                </body>

                </html>
                <%@ include file="../include/footer.jsp" %>