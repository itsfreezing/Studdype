<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



  
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote.min.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="./resources/summernote/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="./resources/summernote/summernote-ko-KR.js"></script>
 <script type="text/javascript" >
 $(document).ready(function() {
 $('#summernote').summernote({
		height: 300,
		width : 1000,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: "ko-KR",
		callbacks: {
			onImageUpload : function(files){
				sendFile(files[0],this);
			}
		}
			
	});
		
	function sendFile(file, editor){
		var data = new FormData();
		data.append("file", file);
		console.log(file);
		$.ajax({
			data : data,
			type : "POST",
			url : "SummerNoteImageFile",
			contentType : false,
			processData : false,
			success : function(data){
				console.log(data);
				console.log(editor);
				$(editor).summernote("insertImage",data.url);
			}
		});
	}
 });
 function test(){
	 $('#testText').html( $('#summernote').val());
 };
 
</script>
</head>
<body>

 	<textarea id="summernote" rows="5" name="explanation" style="width:100%; height:250px;"></textarea>
       
	<button id="testBtn" onclick="test();">테스트</button>
	
	
	<div  id="testText"></div>


</body>

</html>


