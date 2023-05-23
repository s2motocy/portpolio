<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>

<div class="input-group input-daterange">
    <input type="text" class="form-control input1 datepicker" name="startDate" value="${list[0].startDate}"
            readonly>
    <input type="text" class="form-control input2 datepicker" name="endDate" value="${list[0].endDate}"
            readonly>
    <button type="button" id="click-btn">Check</button>
</div>


 <script>
 $( function() {
     $( ".datepicker" ).datepicker({
    	 dateFormat: "yy-mm-dd",
    	 todayHighlight: true
     });
 } );

 </script>
</body>
</html>