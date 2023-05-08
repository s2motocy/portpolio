<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.inputArea { margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='gdsDes'] { display:block; }
	input { width:150px; }
	textarea#gdsDes { width:400px; height:180px; }
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
					alert("업로드 성공")
					console.log("업로드 성공", result)
					showUploadedFile(result)
				}
			}) // ajax
		}) // button[type='file'] click
    })
</script>


<body>
<h1>상품 등록</h1>

    <form action="/item/register" method="post" id='frm' role='form'>

        <div class="inputArea"> 
         <label>카테고리</label>
         <select name="category">
			 <option value="한식">한식</option>
			 <option value="양식">양식</option>
			 <option value="중식">중식</option>
			 <option value="야식">야식</option>
			 <option value="분식">분식</option>
			 <option value="기타">기타</option>
			</select> <br>
        </div>
        
        <div class="inputArea">
         <label for="name">상품명</label>
         <input type="text" id="name" name="name" />
        </div>
        
        <div class="inputArea" id='test'>
         <label for="img_url">상품 사진</label>
         <input type="file" name="uploadFile">
        </div>
        <div class="uploadResult">
			<ul></ul>
		</div>
        
        <div class="inputArea">
         <label for="price">상품 가격</label>
         <input type="text" id="price" name="price" />
        </div>

        <div class="inputArea">
         <label for="description">상품 설명</label>
         <textarea rows="5" cols="100" id="description" name="description"></textarea>
        </div>
        
        <input type="reset" value="취소">
        <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>

        </form>
</body>
</html>