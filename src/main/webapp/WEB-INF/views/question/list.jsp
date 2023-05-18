<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I마이 밀키트</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 50px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  .table_wrap{
  	margin : 50px 0 0 50px;
  }
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
  }
  .pageInfo{
  	list-style : none;
  	display: inline-block;
    margin: 50px 0 0 100px;  	
  }
  .pageInfo li{
  	float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
  .active{
  	background-color: #cdd5ec;
  }
  .search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
  .search_area input{
  	height: 30px;
    width: 250px;
  }
  .search_area button{
 	width: 100px;
    height: 36px;
  } 
  .search_area select{
  	height: 35px;
  }
  .access_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
}
   
  </style>
</head>
<body>
<h1>문의페이지입니다.</h1>
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
        	<form id="frm">
        		<div>
        			암호 입력 <input type="password"  id="password"/>
        			<button id="a">확인</button>
        		</div>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="table_wrap">
	<a href="/question/enroll" class="top_btn">문의 등록</a>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="qno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="list">
			<tr> 
                <td><c:out value="${list.qno}"/></td>
                <td><a class="a_move" href="${list.qno}">${list.title}</a></td>
                <td><c:out value="${list.writer}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.writedate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
            </tr>
        </c:forEach>
	</table>
	    <div class="search_wrap">
        <div class="search_area">
            <select name="type">
                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            </select>    
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button>Search</button>
        </div>
    </div>   
<div class="pageInfo_wrap" >
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">이전</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? 'active':'' }"><a href="${num}">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">다음</a></li>
				</c:if>	
			</ul>
		</div>
	</div>
	<form id="moveForm" method="get">  
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
    	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> 
    	<input type="hidden" name="type" value="${pageMaker.cri.type }">
    </form>
</div>
<script>
$(document).ready(function(){
	let result = '<c:out value="${result}"/>';
	checkAlert(result);
	function checkAlert(result){
		if(result === ''){
			return;
		}
		if(result === "enrol success"){
			alert("등록이 완료되었습니다.");
		}
		 if(result === "modify success"){
	        alert("수정이 완료되었습니다.");
	    }
		 if(result === "delete success"){
	        alert("삭제가 완료되었습니다.");
	    }
	}
	let a_move= $(".a_move");
	let moveForm = $("#moveForm");
	a_move.each(function(idx ,data){
		$(this).click(function(e){
			e.preventDefault();
			if(${user.auth=='a'}){
				moveForm.append("<input type='hidden' name='qno' value='"+ $(this).attr("href") + "'>"); 
				moveForm.attr("action", "/question/get");
				moveForm.submit();
				} else {
						$('#myModal').modal('show');
						$("#a").click(function(){
							var inp = $("#password").val();
							var qno = $(a_move).eq(idx).attr("href");
							var formData = {qno,password:inp};
							$.ajax({
								url: '/question/checkPw',
								type: 'POST',
								data: formData,
								success: function(result){ 
									console.log(result)
									if(result=="1"){
										moveForm.append("<input type='hidden' name='qno' value='"+ $(a_move).eq(idx).attr("href") + "'>");  
					    				moveForm.attr("action", "/question/get");
					    				moveForm.submit();
									}
									else{
										 alert('비밀번호가 올바르지 않습니다');
									}	
								}
							});		
						});
					} 
				});
			});
			$(".pageInfo_btn a").on("click", function(e){
       			e.preventDefault();
		        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		        moveForm.attr("action", "/question/list");
		        moveForm.submit();      
    		});
			function search({type ,keyword ,pageNum }){
				console.log("호출 ",  type, keyword, pageNum)
				$.ajax({
				    url: "/search/1", 
				    method: "GET",   
				    success:function(result){
				    	console.log(result)
				    },
	    			error:function(e){
	    				console.log("error")
	    			}
    			}) 
			}
			$(".search_area button").on("click", function(e){
			    e.preventDefault();  
			    let type = $(".search_area select").val();
			    let keyword = $(".search_area input[name='keyword']").val();
			    if(!type){
			        alert("검색 종류를 선택하세요.");
			        return false;
			    }
			    if(!keyword){
			        alert("키워드를 입력하세요.");
			        return false;
			    }        
			    moveForm.find("input[name='type']").val(type);
			    moveForm.find("input[name='keyword']").val(keyword);
			    moveForm.find("input[name='pageNum']").val(1);
			    moveForm.submit();
			});
		});
		</script>
	</body>
</html>