<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallery writing</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CommunityHome</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/mainstyle.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<link rel="stylesheet" href="./resources/css/gallery/gallerywrite.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<script type="text/javascript">
//파일첨부 함수
function attachFile(){
	var html = "<div class='upload_file_box'><input type='file' class='upload_file' name='file' onchange='create_file_info(this);'></input></div>";
	
	
	//만약 전파일이 업로드안됬으면 지워버리기
	var chkFalse = $(".upload_file_box");

	if( chkFalse.last().children("input").val() == null || chkFalse.last().children("input").val().trim()=="" ){
		chkFalse.last().remove();
	}
	//업로드 전체박스		
	var div = $(".upload_box");
	div.append(html);
	
	//업로드 파일 박스
	var upload_div = $(".upload_file_box");
	
	var file = upload_div.children(".upload_file");
	file[(file.length)-1].click();
	
};

function chkForm(){
	var form = $("#updateForm");
	var title = $("#title");
	var content = $("#content");
	if( title.val() == null || title.val().trim() == ''){
		alert("제목을 작성해주세요")
	}else if( title.val().length  > 50  ){
		alert("제목을 50글자 이하로 수정해주세요!!");
	}else if( content.val() == null || content.val().trim() == ''){
		alert("글 내용을 작성해주세요.")
	}else{
		form.submit();
	}
 };
 
 //파일첨부시 파일정보 div추가 함수
function create_file_info(file){
	//업로드 파일 박스
	var upload_div = $(".upload_file_box");
	var fileSize = $(file)[0].files[0].size; //파일사이즈
	var fileName = $(file)[0].files[0].name; //파일이름
	var fileNameList = fileName.split(".");
	var fileFormat = fileNameList[(fileNameList.length)-1];
		
	fileSize /= 1024 ; //KB로 만듬
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
	
}

//파일삭제 db랑 로컬도 AJAX
function deleteFile(fileName){
	 
	 	const result = confirm('파일이 완전히 삭제됩니다.\n삭제하시겠습니까?');
	 
	 	if(result){
	 		var f_no = fileName.title;
		 	
		 	var fileVal = {
					"f_no" : f_no //파일번호
			};

			//댓글 답글 쓰기
			$.ajax({
				type:"post",
				url:"galleryFileDelete.do",
				data:JSON.stringify(fileVal),
				contentType:"application/json",
				dataType:"json",
				success:function(res){
					if(res > 0){
						fileName.className += ' change_file';  //update_btn 클래스 추가
					 	var upload_file_box = $(".change_file").parent();
					 	
					 	upload_file_box.remove();
					}else{
						alert("첨부파일 삭제 실패\n관리자에게 문의 해주세요.");
					}
				},
				error:function(){
					alert("파일 삭제 ajax 실패 ㅠ..");
				}
				
				
			});	
	 	}
	 	
};
</script>
<style type="text/css">
.gallery_Btn{
	float: right;
	margin-top : 15px;
	background-color: #EFF0F2;
	border: 1px solid #EFF0F2;
	width: 8%;
	height: 50px;
	font-size: 15px;
	padding: 1%;
	
	border-radius: 10px 10px;
	color: black;
	font-weight: bold;
	margin-left: 1%;
}
.gallery_Btn:hover{
	background-color: white;
	border: 1px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;

}
</style>


</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<br> <br> <br> <br> <br>
		<form action="galleryupdate.do" method="post" id="updateForm" enctype="multipart/form-data">
		<input type="hidden" name="b_no" value="${dto.b_no }">
			<div class="container" role="main">
				<h2>gallery update</h2>
				<div class="mb-3">
					<label for="title">제목:</label> <input type="text" class="form-control" name="b_title" id="title" placeholder="제목을 입력해 주세요" value="${dto.b_title }" autocomplete="off">
				</div>
				<br>
					<div class="upload_box">
						<div class="upload_btn_box">
							<input type="button" onclick="attachFile();" class="uploadFile" value="파일 첨부..." >
						</div>
						<c:if test="${fileList.size() != 0 }"> <!-- 0개가 아니면 -->
							<c:forEach var = "fileList" items="${fileList }">
							<div class='upload_file_box'>
									<img class='file_format_img' src='./resources/img/fileFormat/${fileFormatMap.get(fileList.f_no) }.png' onError="this.src='./resources/img/fileFormat/nomal.png'">
									<span class='file_name' >${fileList.f_name }</span>
									<input type='button' class='remove_file_btn'  onclick='deleteFile(this);' title='${fileList.f_no}'>
									<span class='file_size'>${fileList.f_size }KB</span>
							</div>
							</c:forEach>		
						</c:if>
					</div>
				<br>
				<div class="mb-3">
					<label for="content">내용:</label>
					<textarea class="form-control" rows="10" cols="5" name="b_content" id="content" placeholder="내용을 입력해 주세요">${dto.b_content }</textarea>
				</div>

				<!-- </form> -->
				<input type="button" class="gallery_Btn" onclick="chkForm();" value="수정"/>
				<input type="button" class="gallery_Btn" onclick="location.href='gallery.do'" value="취소" />
			</div>
		</form>
		<br> <br> <br> <br>
	</div>

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>