<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
 <script>
     $(document).ready(function(){ ///// 전체 추가
 		var formObj=$("form[role='form']")
 		$("button[type='submit']").click(function(e){
 			e.preventDefault()
 			console.log("전송버튼이 눌렸어요")
 			var str=""
 			$(".uploadResult ul li").each(function(idx, obj){
 				console.log("obj: ", obj)
 				var jobj =$(obj)
 				console.dir(jobj)
 				str+= "<input type='hidden' name='attachList["+idx+"].fileName' value='"+jobj.data('filename')+"'>"
 				str+= "<input type='hidden' name='attachList["+idx+"].uuid' value='"+jobj.data('uuid')+"'>"
 				str+= "<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+jobj.data('path')+"'>"
 				str+= "<input type='hidden' name='attachList["+idx+"].fileType' value='"+jobj.data('type')+"'>"
 			})
 			console.log(str)
 			formObj.append(str).submit()
 		})
 		
 		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
 		var maxSize = 5242880  //5MB
 		const checkExtension=(fileName, fileSize)=>{
 			if(fileSize >= maxSize) {
 				alert("파일 용량 초과 (제한용량: 5MB)")
 				return false;
 			}
 			if(regex.test(fileName)){
 				alert("해당 종류의 파일은 업로드할 수 없습니다.")
 				return false;
 			}
 			return true;
 		}

 		$("input[type='file']").change(function(e){ 
 			var formData = new FormData()
 			var inputFile = $("input[name='uploadFile']")
 			var files = inputFile[0].files
 			console.log(files)
 			for(var i of files) {
 				if(!checkExtension(i.name, i.size)) return false;
 				formData.append("uploadFile", i)
 			}
 			
 			var uploadResult =$(".uploadResult ul")
 			const showUploadedFile=(uploadResultArr)=>{
 				if(!uploadResultArr || uploadResultArr.length ==0) return
 				var str=""
 				$(uploadResultArr).each(function(idx, obj){ 
 					if(obj.fileType) { 
 						var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName)
 						var originPath = obj.uploadPath+ "/"+obj.uuid+"_"+obj.fileName
 						originPath = originPath.replace(new RegExp(/\\/g), "/")  // "\\" => "/"  로 대체
 						str+= "<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.fileType+"'"
 						str+= "><div><span>"+obj.fileName+"</span><button type='button' data-file=\'"+fileCallPath+"\' data-type='fileType' "
 						str+= "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
 						str+= "<img src='/display?fileName=" + fileCallPath +"'></div></li>"
 					} else { 
 						var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+obj.uuid+"_"+obj.fileName)
 						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/")
 						str+= "<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.fileType+"'"
 						str+= "><div><span>"+obj.fileName+"</span><button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
 						str+= "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button></br>"
 						str+= "<img src='/resources/img/attach.png'></div></li>"
 					}
 				})
 				uploadResult.append(str)
 			}
 			$.ajax({
 				url: '/uploadAjaxAction',
 				processData: false,
 				contentType: false,
 				data: formData,
 				type: 'POST',
 				dataType: 'json',
 				success: (result)=>{
 					alert("업로드 성공")
 					console.log("업로드 성공", result)
 					showUploadedFile(result)
 				}
 			}) // ajax
 		}) // button[type='file'] click
     })
</script>
<style>
body {
    font-family: Arial, Helvetica, sans-serif;

}

#update-input,input[type=file] {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
    border-radius:5px
}

#update-input,input[type=file]:focus {
   background-color: #ddd;
   outline: none;
}

.uploadResult ul{
   position: absolute;
   left: 41%;
   top: 28%;
   width:30px;
   
}

textarea {
   width: 50%;
   height: 200px;
   padding: 5px;
   margin: 5px 0 22px 0;
   box-sizing: border-box;
   border: none;
   font-size: 16px;
   resize: both;
   background: #f1f1f1;
   border-radius:5px
}

hr {
	width: 80%;
	border: 1px solid #ff6b00;
	margin-bottom: 25px;
	opacity: 0.5;
}

.resetbtn {
   background-color: #ff6b00;
   color: white;
   padding: 16px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   width: 15%;
   opacity: 0.8;
   border-radius:10px
}

.updatebtn {
   background-color: #ff6b00;
   color: white;
   padding: 16px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   width: 15%;
   opacity: 0.8;
   border-radius:10px
}

.navi_bar_area #admin1:visited{
    color:black;
    font-weight: bold;
}

</style>
</head>
<body>
<!-- Page Introduction Wrapper -->
<div class="page-style-a">
    <div class="container">
        <div class="page-intro">
            <h2>상품 등록</h2>
            <ul class="bread-crumb">
                <li class="has-separator">
                    <i class="ion ion-md-home"></i>
                    <a href="home.html">Home</a>
                </li>
                <li class="is-marked">
                    <a href="single-product.html">등록</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- Page Introduction Wrapper /- -->
<form action="update" method="post" id="update" role="form">
 	<div class="container">
 	<hr>
         <label><b>카테고리</b></label>
         <br>
	         <select name="category">
				 <option value="한식">한식</option>
				 <option value="양식">양식</option>
				 <option value="중식">중식</option>
				 <option value="야식">야식</option>
				 <option value="분식">분식</option>
				 <option value="기타">기타</option>
				</select> 
				<br>
        
         <label for="name"><b>상품명</b></label>
         <br>
	         <input type="hidden" name='item_id' value='<c:out value="${vo.item_id}"></c:out>'/>
	         <input type="text" id="update-input" name="item_name" value='<c:out value="${vo.item_name}"></c:out>' />

	     <div class="inputArea" id="img">
	     <label for="img_url"><b>상품 사진</b></label>
	     <br>
	     	<input type="file" name="uploadFile" >
	     </div>
	     <div class="uploadResult" id="uploadResult">
	        <ul></ul>
	     </div>
	      
         <label for="item_price"><b>상품 가격</b></label>
         <br>
         	<input type="text" id="update-input" name="item_price" value='<c:out value="${vo.item_price}"></c:out>' />
		 <br>
		
		 <label for="item_price"><b>상품 가격</b></label>
         <br>
         	<input type="text" id="update-input" name="item_price" value='<c:out value="${vo.item_price}"></c:out>' />
		 <br>
		 
		 <label for="item_stock"><b>상품 재고</b></label>
         <br>
         	<input type="text" id="update-input" name="item_stock" value='<c:out value="${vo.item_stock}"></c:out>' />
		 <br>
 
         <label for="description"><b>상품 설명</b></label>
         <br>
         	<textarea rows="5" cols="100" id="description" name="description" value='<c:out value="${vo.description}"></c:out>'></textarea>
		 <br>
        
        <button type="reset" class = "resetbtn">취소</button>
        <button type="submit" class="updatebtn">수정</button>   
        </div>   
    </form>

</body>
</html>
<%@ include file="../include/footer.jsp" %>