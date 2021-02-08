<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/mainstyle.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">

<link rel="stylesheet" href="./resources/css/community/freeboard/freeboard.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<!-- summernote css / js -->
<link rel="stylesheet" href="./resources/summernote/summernote.min.css">
<script src="./resources/summernote/summernote.min.js"></script>
<script src="./resources/summernote/lang/summernote-ko-KR.js"></script>

<style type="text/css">


.hideFile {
	display:none;
}
</style>

<script type="text/javascript">
$(function() {
	// 서머노트 양식
	 $('#summernote').summernote({
		 toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			height: 450,
			width : 1000,
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: "ko-KR",
			disableResizeEditor: true,
			callbacks: {
				onImageUpload : function(files){
					sendFile(files[0],this);
				}
			}
				
		});
	
	$(".original").click(function() {
		const result = confirm('파일이 완전히 삭제됩니다.\n삭제하시겠습니까?');
		 
	 	if(result) {
	 		$(this).parent().removeClass("showFile");
	 		$(this).parent().addClass("hideDiv");
	 	}
	});
	
});

// 서머노트 파일 저장
function sendFile(file, editor){
	var data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "summernoteImgUpload.do",
		enctype: 'multipart/form-data',
		contentType : false,
		processData : false,
		success : function(data){
			var url = decodeURIComponent(data);
			console.log(data);
			console.log(url);
			$(editor).summernote('editor.insertImage',url);
		},
		error: function(){
			alert("서머노트 이미지 업로드 실패");
		}
	});
}

// 폼 태그 유효성 검사
 function chkForm(){
		var form = $("#updateForm");
		var title = $("#boardtitle");
		var content = $("#summernote");
		var attach = $(".upload_file");
		var hideFile = $(".hideDiv");
		
		//만약 전파일이 업로드안됬으면 지워버리기
	 	var chkFalse = $(".upload_file_box");

	 	if( chkFalse.last().children("input").val() == null || chkFalse.last().children("input").val().trim()=="" ){
	 		chkFalse.last().remove();
	 	}
		
		if( title.val() == null || title.val().trim() == ''){
			alert("제목을 작성해주세요")
		}else if( title.val().length  > 50  ){
			alert("제목을 50글자 이하로 작성해주세요!!");
		}else if( content.val() == null || content.val().trim() == ''){
			alert("글 내용을 작성해주세요.")
		}else if($(".upload_file").length == 0 && $(".showFile").length == 0) {
			alert("학습 자료실에서는 파일 첨부가 필수사항입니다.")
		}else if($(".upload_file").length) {
			if(($(".upload_file").val() == null || $(".upload_file").val() == "") && $(".showFile").length == 0) {
				alert("학습 자료실에서는 파일 첨부가 필수사항입니다.");
			}else {
				if(hideFile.length) {
					for(var i = 0; i < hideFile.length; i++) {
						deleteFile($(".hideDiv").eq(i));
					}
				}
				form.submit();
			}
		}else{
			if(hideFile.length) {
				for(var i = 0; i < hideFile.length; i++) {
					var f_no = hideFile.children().eq(2);
					deleteFile($(".hideDiv").eq(i));
				}
			}
			form.submit();
		}
		
}

 //파일첨부 함수
 function attachFile(){
 	var html = "<div class='upload_file_box new_file_box'><input type='file' class='upload_file' id='new_file' name='file' onchange='create_file_info(this);'></input></div>";
 	
 	
 	//만약 전파일이 업로드안됬으면 지워버리기
 	var chkFalse = $(".new_file_box");

 	
	 	if( chkFalse.last().children("#new_file").val() == null || chkFalse.last().children("#new_file").val().trim()=="" ){
 			chkFalse.last().remove();
 		}
 	
 
 	
 	//업로드 전체박스		
 	var div = $(".upload_box");
 	div.append(html);
 	
 	//업로드 파일 박스
 	var upload_div = $(".upload_file_box");
 	
 	var file = upload_div.children(".upload_file");
 	file[(file.length)-1].click();
 	
 	
 	
 }

 //파일첨부시 파일정보 div추가 함수
 function create_file_info(file){ 
 	//업로드 파일 박스
 	var upload_div = $(".upload_file_box");
 	var fileSize = $(file)[0].files[0].size; //파일사이즈
 	var fileName = $(file)[0].files[0].name; //파일이름
 	var fileNameList = fileName.split(".");
 	var fileFormat = fileNameList[(fileNameList.length)-1];
 	
 	
 	fileSize /= 1024 ; //KB로 변환
 	fileSize = fileSize.toFixed(2); //반올림
 	
 	if(fileSize >= 10000){ //10MB초과
		alert("파일최대크기 10MB를 초과합니다!!");
		upload_div.last().remove();
		return false;
	}
 	
 	fileFormat = fileFormat.trim(); // 공백 제거
 	fileFormat = fileFormat.toLowerCase(); //소문자로
 	//파일 포멧검사
 	if( fileFormat != "apk" && fileFormat != "app" && fileFormat != "avi" && fileFormat != "csv" && fileFormat != "elf" && fileFormat != "html" && fileFormat != "jpg" &&
 			 fileFormat != "js" && fileFormat != "mp3" && fileFormat != "mpa" && fileFormat != "obj" && fileFormat != "pdf" && fileFormat != "png" && fileFormat != "ppt" &&
 			 fileFormat != "py" && fileFormat != "sql" && fileFormat != "wav" && fileFormat != "wma" && fileFormat != "xls" && fileFormat != "xlsx" && fileFormat != "xml" &&
 			 fileFormat != "zip" && fileFormat != "css" ){
 		fileFormat = "nomal";
 	}
 	
 	 upload_div.last().append("<img class='file_format_img' src='./resources/img/fileFormat/"+fileFormat+".png'><span class='file_name' >"+
 			 	fileName+
 			 	"</span><input type='button' class='remove_file_btn'  onclick='clickFileBtn(this);'><span class='file_size'>"
 			 	+fileSize+
 			 	"KB</span>");
 	 
 }
 
 //파일삭제 함수
 function clickFileBtn(fileName){
 	
 	fileName.className += ' change_file';  //update_btn 클래스 추가
 	var upload_file_box = $(".change_file").parent();
 	
 	upload_file_box.remove();
 	
 	fileName.className = 'upload_file'; //추가한 클래스 원상복구
 } 
 
 function deleteCheck() {
	 
 }
 
 //파일삭제 db랑 로컬도 AJAX
 function deleteFile(hideFile){
	 	var f_no = hideFile.children().first().val();
		 	
		 var fileVal = {
				"f_no" : f_no //파일번호
		};

		//댓글 답글 쓰기
		$.ajax({
			type:"post",
			url:"dataFileDelete.do",
			data:JSON.stringify(fileVal),
			contentType:"application/json",
			dataType:"json",
			success:function(res){
				if(res > 0){
				 	hideFile.remove();
				}else{
					alert("첨부파일 삭제 실패\n관리자에게 문의 해주세요.");
				}
			},
			error:function(){
				alert("파일 삭제 ajax 실패 ㅠ..");
			}
			
			
		});	
	 	
 }
</script>

</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	<div class="main-section" style="width:60%; margin-right:8%;">
		<form action="dataBoardUpdate.do" method="post" id="updateForm" enctype="multipart/form-data" >
		<input type="hidden" name="b_no" value="${dataDto.b_no }">
 		<table class="maintable">
		<tr>
			<td><h1>학습자료실 글 수정</h1><span style="color:red">* 파일첨부는 필수 사항입니다.</span></td>
		</tr>
		<!-- 제목 부분 -->
		<tr>
			<td><input type="text" id="boardtitle" name="b_title" placeholder="제목을 입력해주세요" value="${dataDto.b_title }" autocomplete="off"></td>
		</tr>
		
		<!-- 글 content부분 -->
		<tr>
			<td><textarea id="summernote" rows="5" name="b_content" style="width:100%; height:250px;">${dataDto.b_content }</textarea></td>
		</tr>
		
		<!-- 파일첨부 부분 -->
		<tr>
			<td>		
				<div class="upload_box">
					<div class="upload_btn_box">
						<input type="button" onclick="attachFile();" class="uploadFile" value="파일 첨부..." >
					</div>
					
						<c:if test="${fileList.size() != 0 }"> <!-- 0개가 아니면 -->
							<c:forEach var = "fileList" items="${fileList }">
							<div class='upload_file_box showFile'>
								<input type="hidden" value="${fileList.f_no}">
									<img class='file_format_img' src='./resources/img/fileFormat/${fileFormatMap.get(fileList.f_no) }.png' onError="this.src='./resources/img/fileFormat/nomal.png'">
									<span class='file_name' >${fileList.f_name }</span>
									<input type='button' class='remove_file_btn original'>
									<span class='file_size'>${fileList.f_size }KB</span>
							</div>
							</c:forEach>		
						</c:if>
					
				</div>
			</td>
		</tr>
		
		<!-- 버튼 부분 -->
		<tr>
			<td ><input type="button" onclick="chkForm();" value="완료" class="free_Btn"><input type="button" onclick="location.href='dataBoard.do'" value="취소" class="free_Btn"></td>			
		</tr>
	</table>
	</form>
 	</div>
	
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>

</body>
</html>