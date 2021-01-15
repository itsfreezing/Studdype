<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CommunityHome</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">


<!--  freeboard mainsection css -->
<link rel="stylesheet" href="./resources/css/community/freeboard/mainsection.css">

<!-- freeboard css -->
<link rel="stylesheet" href="./resources/css/community/freeboard/freeboard.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>




<!-- summernote css / js -->
<link rel="stylesheet" href="./resources/summernote/summernote.min.css">
<script src="./resources/summernote/summernote.min.js"></script>
<script src="./resources/summernote/summernote-ko-KR.js"></script>


<script type="text/javascript" >
 $(document).ready(function() {
 $('#summernote').summernote({
		height: 450,
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
 function chkForm(){
	var form = $("#writeForm");
	var title = $("#boardtitale");
	var content = $("#summernote");
	
	if( title.val() == null || title.val().trim() == ''){
		alert("제목을 작성해주세요")
	}else if( title.val().length  > 50  ){
		alert("제목을 50글자 이하로 작성해주세요!!");
	}else if( content.val() == null || content.val().trim() == ''){
		alert("글 내용을 작성해주세요.")
	}else{
		form.submit();
	}
	
 };
 

 
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


 	<div class="main-section2">
	<form action="freewrite.do" method="post" id="writeForm" >
 		<table class="maintable">
		<tr>
			<td><h1>자유게시판 글 쓰기</h1></td>
		</tr>
		<tr>
			<td><input type="text" id="boardtitle" name="b_title" placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td>파일 첨부<input type="file" class="uploadFile"></td>
			
		</tr>
		<tr>
			<td><div>공간</div></td>
		</tr>
		<tr>
			<td><textarea id="summernote" rows="5" name="b_content" style="width:100%; height:250px;"></textarea></td>
		</tr>
		<tr>
			<td ><input type="button" onclick="chkForm();" value="완료" class="free_Btn"><input type="button" onclick="location.href='freeboard.do'" value="취소" class="free_Btn"></td>			
		</tr>
	</table>
	</form>
 	</div>

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>