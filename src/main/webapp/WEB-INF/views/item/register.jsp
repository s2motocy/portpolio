<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
body {
    font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

input[type=text],input[type=file] {
    width: 30%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
    border-radius:5px
}

input[type=text],input[type=file]:focus {
   background-color: #ddd;
   outline: none;
}

select{
   padding: 5px;
   margin: 5px 0 22px 0;
}

.uploadResult ul{
   position: absolute;
   left: 33%;
   top: 47%;
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
   border: 1px solid #f1f1f1;
   margin-bottom: 25px;
}

.resetbtn {
   background-color: #28a745;
   color: white;
   padding: 16px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   width: 15%;
   opacity: 0.9;
   border-radius:10px
}

.resetbtn:hover {
   opacity: 1;
}

.registerbtn {
   background-color: #28a745;
   color: white;
   padding: 16px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   width: 15%;
   opacity: 0.9;
   border-radius:10px
}

.registerbtn:hover {
   opacity: 1;
}

.navi_bar_area #admin1:visited{
    color:black;
    font-weight: bold;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
$(document).ready(function(){
	/* form 태그의 버튼이 눌리면 각 이미지의 정보를 input(hidden)의 value에 담아 전송 */
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
            str+= "<input type='hidden' name='attachList["+idx+"].image' value='"+jobj.data('type')+"'>"
		})
        console.log(str)
        formObj.append(str).submit()
	})
	/* 정규표현식 으로 확장자 와 용량 제한 */
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
	/* input 태그에 파일이 담기면 체크(확장자, 용량) 후 ajax 를 통해 uploadcontroller의 uploadAjaxAction 에 전달되고
	이미지를 c:\upload 폴더에 날짜를 생성하고 uuid를 붙여 저장하고, 이미지면 thumbnail 이미지를 추가 생성하고, AttachFileDTO 에 값을 저장하여 list 로 반환하면
	반환된 list 정보를 태그화 하여 이미지면 thumbnail 이미지를 보여주고, 이미지가 아니면 attach.png 를 보여준다 */
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
               if(obj.image) { 
                  var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName)
                  var originPath = obj.uploadPath+ "/"+obj.uuid+"_"+obj.fileName
                  originPath = originPath.replace(new RegExp(/\\/g), "/")  // "\\" => "/"  로 대체
                  str+= "<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.image+"'"
                  str+= "><div><span>"+obj.fileName+"</span><button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
                  str+= "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
                  str+= "<img src='/display?fileName=" + fileCallPath +"' width='300px'></div></li>"
               } else { 
                  var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+obj.uuid+"_"+obj.fileName)
                  var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/")
                  str+= "<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"'data-type='"+obj.image+"'"
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
				console.log("업로드 성공", result)
				showUploadedFile(result)
            }
		}) // ajax
	}) // button[type='file'] change
}) // ready
</script>
<body>
<form action="register" method="post" id='frm' role='form'>
	<div class="container">
		<label><b>카테고리</b></label>
		<br>
		<select name="category" id="category">
			<option value="한식">한식</option>
			<option value="양식">양식</option>
			<option value="중식">중식</option>
			<option value="야식">야식</option>
			<option value="분식">분식</option>
			<option value="기타">기타</option>
		</select>
		<br>
		<label for="item_name"><b>상품명</b></label>
		<br>
		<input type="text" id="item_name" name="item_name" />
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
		<input type="text" id="item_price" name="item_price" />
		<br>
		
		<label for="item_stock"><b>상품 재고</b></label>
		<br>
		<input type="text" id="item_stock" name="item_stock" />
		<br>

        <label for="description"><b>상품 설명</b></label>
        <br>
		<textarea rows="5" cols="100" id="description" name="description"></textarea>
        <br>
        <button type="reset" id = "resetbtn" class="resetbtn">취소</button>
        <button type="submit" id="registerbtn" class="registerbtn">등록</button>
	</div>
</form>
</body>
<script src="https://www.google-analytics.com/analytics.js" async defer></script>
<!-- Modernizr-JS -->
<script type="text/javascript" src="/resources/js/vendor/modernizr-custom.min.js"></script>
<!-- NProgress -->
<script type="text/javascript" src="/resources/js/nprogress.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<!-- Popper -->
<script type="text/javascript" src="/resources/js/popper.min.js"></script>
<!-- ScrollUp -->
<script type="text/javascript" src="/resources/js/jquery.scrollUp.min.js"></script>
<!-- Elevate Zoom -->
<script type="text/javascript" src="/resources/js/jquery.elevatezoom.min.js"></script>
<!-- jquery-ui-range-slider -->
<script type="text/javascript" src="/resources/js/jquery-ui.range-slider.min.js"></script>
<!-- jQuery Slim-Scroll -->
<script type="text/javascript" src="/resources/js/jquery.slimscroll.min.js"></script>
<!-- jQuery Resize-Select -->
<script type="text/javascript" src="/resources/js/jquery.resize-select.min.js"></script>
<!-- jQuery Custom Mega Menu -->
<script type="text/javascript" src="/resources/js/jquery.custom-megamenu.min.js"></script>
<!-- jQuery Countdown -->
<script type="text/javascript" src="/resources/js/jquery.custom-countdown.min.js"></script>
<!-- Owl Carousel -->
<script type="text/javascript" src="/resources/js/owl.carousel.min.js"></script>
<!-- Main -->
<script type="text/javascript" src="/resources/js/app.js"></script>
</html>
<%@ include file="../include/footer.jsp" %>