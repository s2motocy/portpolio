<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/adminPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}


.container {
  margin: 60px;
  background-color: white;
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

</style>
</head>
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
            str+= "<input type='hidden' name='attachList["+idx+"].image' value='"+jobj.data('type')+"'>"
         })
         console.log(str)
         formObj.append(str).submit()
      })
      
      //p506
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
      }) // button[type='file'] click
    })
</script>


<body>
  <form action="register" method="post" id='frm' role='form'>
     <div class="container">
       <h1>상품 등록</h1>
      	<hr> 
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
           

         <label for="name"><b>상품명</b></label>
         <br>
            <input type="text" id="name" name="name" />
        
        
        <div class="inputArea" id="img">
         <label for="img_url"><b>상품 사진</b></label>
         <br>
            <input type="file" name="uploadFile" >
        </div>
        <div class="uploadResult" id="uploadResult">
         <ul></ul>
      	</div>
        
       
         <label for="price"><b>상품 가격</b></label>
         <br>
            <input type="text" id="price" name="price" />
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
</html>