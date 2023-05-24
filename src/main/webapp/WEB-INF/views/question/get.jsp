<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <style>
.input_wrap, .u-s-m-b-30 {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.text-field1{
	border-radius:5px;}	
	.table_wrap {
  		width: 100%;
}

.table_wrap table {
  width: 100%;
  border-collapse: collapse;
}

.table_wrap th, .table_wrap td {
  padding: 8px;
  border: 1px solid #ddd;
}

.table_wrap th {
  background-color: #f2f2f2;
}

.table_wrap th label {
  font-weight: bold;
}

.input_wrap input {
  border: none;
  background-color: transparent;
  width: 100%;
  box-sizing: border-box;
}

.input_wrap input:read-only {
  color: #888;
}

.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 20px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
    margin: 0 10px;
    border-radius: 4px;
    color: #fff;
}
#modify_btn {
  background-color: blue;
}

#list_btn {
  background-color: gray;
}

#reply_btn {
  background-color: orange;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
	margin-bottom : 30px;
	display: flex;
	justify-content: center;
}
.container{
	margin-top:10px;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- Page Introduction Wrapper -->
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>문의 조회</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    Home
                </li>
                <li class="is-marked">
                    문의
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
<div class="table_wrap">
  <table>
    <tr>
      <th>
        <label>문의 종류</label>
      </th>
      <td>
        <div class="input_wrap">
          <input name="category" readonly="readonly" value='<c:out value="${pageInfo.category}"/>'>
        </div>
      </td>
    </tr>
    <tr>
      <th>
        <label>문의 작성자</label>
      </th>
      <td>
        <div class="input_wrap">
          <input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>'>
        </div>
      </td>
    </tr>
    <tr>
      <th>
        <label>문의 제목</label>
      </th>
      <td>
        <div class="input_wrap">
          <input name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>'>
        </div>
      </td>
    </tr>
    <tr>
      <th>
        <label>문의 내용</label>
      </th>
      <td>
        <div class="input_wrap">
          <textarea rows="3" name="content" readonly="readonly" style="width : 985px;"><c:out value="${pageInfo.content}"/></textarea>
        </div>
      </td>
    </tr>
    <tr>
      <th>
        <label>답변 내용</label>
      </th>
      <td>
        <div class="input_wrap">
 			<textarea rows="3" name="reply" readonly="readonly" style="width : 985px;"><c:out value="${pageInfo.reply}"/></textarea>	
        </div>
      </td>
    </tr>
<form action="/question/reply"  method="post" id="replyShow">
	<div class="input_wrap" id="reply_input_wrap" style="display: none;">
	  <label>답글 내용</label>
	  <textarea rows="3" id="reply_content" name="reply"></textarea>
	  <button id="submit_reply_btn">답글 제출</button>
	</div>
</form>
</table>
<div class="btn_wrap" id="action_btn_wrap">
  <button class="btn" id="modify_btn">수정하기</button>
  <button class="btn" id="list_btn">문의 페이지</button>
  <button class="btn" id="reply_btn">답글 작성</button>
</div>
<div class="input_wrap" id="reply_output_wrap" style="display: none;">
  <label>답글 내용</label>
  <textarea rows="3" readonly="readonly" id="reply_output"></textarea>
</div>	
</div>
<form id="infoForm" action="/question/modify" method="get">
  <input type="hidden" id="qno" name="qno" value='<c:out value="${pageInfo.qno}"/>'>
  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
  <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
  <input type="hidden" name="keyword" value="${cri.keyword}">
  <input type="hidden" name="type" value="${pageMaker.cri.type}">
</form>
<form id="replyForm" action="/question/reply" method="post">
  <input type="hidden" name="parentQno" value='<c:out value="${pageInfo.qno}"/>'>
  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
  <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
  <input type="hidden" name="keyword" value="${cri.keyword}">
  <input type="hidden" name="type" value="${pageMaker.cri.type}">
</form>
<script>
  let form = $("#infoForm");
  let replyForm = $("#replyForm");
  const isAdmin = true; // 여기에 관리자 여부를 판단하는 로직 추가 해야됨
  $(document).ready(function() {
	  $("#list_btn").on("click", function (e) {
	    form.find("#qno").remove();
	    form.attr("action", "/question/list");
	    form.submit();
	  });
	  $("#modify_btn").on("click", function (e) {
		    form.attr("action", "/question/modify");
		    form.submit();
		  });
	  if (isAdmin) {
		  console.log("관리자")
		  $("#reply_btn").on("click", function (e) {
		    
		      $("#action_btn_wrap").hide();
		      $("#reply_btn_wrap").show();
		      $("#reply_input_wrap").show();
		      $("#reply_output_wrap").hide();
		      $("#submit_reply_btn").click(function(e){
		    	  console.log('답글 눌렸어')
		    	  //e.preventDefault()
		    	  var text = $("#reply_content").val()
	  			  var inputData =$("input[name='qno']").val()
	  			  console.log('sdfaf:',text , inputData)
	  			  var reply={reply:text, qno:inputData}
		    	  //$('form#replyShow').append({reply:text}),submit()
	  			// Ajax를 사용해서 답변 등록 요청을 하라는데 이거 어케함?
	  		     $.ajax({
	  		      type: "POST",
	  		      url: "/question/reply",
	  		      data: JSON.stringify(reply),
	  		      contentType: "application/json",
	  		      success: function (response) {
	  		        console.log(response);
	  		        alert("답변이 등록되었습니다.");
	  		      },
	  		      error: function (xhr, status, error) {
	  		        console.error(error);
	  		        alert("답변 등록에 실패했습니다.");
	  		      }
	  		    });
	  		    $("#reply_output_wrap").show();
	  		    $("#reply_input_wrap").hide();
	  		    $("#action_btn_wrap").show();
	  		    $("#reply_btn_wrap").hide();
	  		     
		      })
		    })
	  }
	  else {
	      alert("관리자만 답글을 작성할 수 있습니다.");
	      e.preventDefault(); // 버튼 클릭 이벤트의 기본 동작을 중지합니다.
	 	}
	  $("#submit_reply_btn").on("click", function (e) {
	    e.preventDefault();
	    let replyContent = $("#reply_content").val().trim();
	    if (replyContent === "") {
	      alert("답글 내용을 입력해주세요.");
	      return;
	    }
	    $("#reply_output").val(replyContent);
	    // 답변 객체 생성
	    let reply = {
	      parentQno: "${pageInfo.qno}",
	      content: replyContent,
	      pageNum: "${cri.pageNum}",
	      amount: "${cri.amount}",
	      keyword: "${cri.keyword}",
	      type: "${pageMaker.cri.type}"
	    }; 
	  });

  // 페이지 로딩 시 관리자 여부를 체크하여 답글 작성 버튼 제어

    if (!isAdmin) {
      $("#reply_btn").hide();
    }
  });
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>