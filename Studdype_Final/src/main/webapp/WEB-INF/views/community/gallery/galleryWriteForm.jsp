<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallery writing </title>
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
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<script type="text/javascript">
document.querySelector("html").classList.add('js');
 
var fileInput  = document.querySelector( ".input-file" ),  
    button     = document.querySelector( ".input-file-trigger" ),
    the_return = document.querySelector(".file-return");
 
button.addEventListener( "keydown", function( event ) {
    if ( event.keyCode == 13 || event.keyCode == 32 ) {
        fileInput.focus();
    }
});
 
button.addEventListener( "click", function( event ) {
   fileInput.focus();
   return false;
});
 
fileInput.addEventListener( "change", function( event ) {  
    //the_return.innerHTML = this.value;
    $('#labelFU').text("Choosen file : " + this.value);
});

function test(){

	var html ="<input type='file' id='testBtn'><button>x</button>";
	
	var div = $("#testDiv");
	div.append(html);
	var input = div.children("div")
	for(var i = 0 ; i < input.length ; i++){
		if ( i == input.length-1){
			alert("qwe");
			input[i].click();
		}
	}
	
}
</script>


<style type="text/css">
.js .input-file-container {
  position: relative;
  width: 565px;
  text-align: center;
}
.js .input-file-trigger {
  display: block;
  padding: 14px 45px;
  background: #8A94BE;
  color: white;
  font-size: 1em;
  transition: all .4s;
  cursor: pointer;
  border-radius: 10px;
}
.js .input-file {
  position: absolute;
  top: 0; left: 0;
  width: 225px;
  padding: 14px 0;
  opacity: 0;
  cursor: pointer;
}
 
.js .input-file:hover + .input-file-trigger,
.js .input-file:focus + .input-file-trigger,
.js .input-file-trigger:hover,
.js .input-file-trigger:focus {
  background: #962399;
  text-decoration:none !important;
}
 
.file-return {
  margin: 0;
}
.file-return:not(:empty) {
  margin: 1em 0;
}
.js .file-return {
  font-style: italic;
  font-size: .9em;
  font-weight: bold;
}

.credit
{
  border: 1px solid #ddd;
  padding : 2px;
  width: 410px;
  background: #eee;
  border-radius: 5px;
  position: absolute;
  bottom: 0;
}
</style>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<br> <br> <br> <br> <br>

		<div class="container" role="main">
			<h2>gallery write</h2>
			<!-- <form name="form" id="form" role="form" method="post" action="upload" enctype="multipart/form-data"> -->
				<div class="mb-3">
					<label for="title">제목:</label> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력해 주세요">
				</div>
				<br>
				<div id='divHabilitSelectors' class="input-file-container">
					<input class="input-file" id="fileupload" name="files" type="file"	multiple>
					 <label for="fileupload" class="input-file-trigger" id='labelFU' tabindex="0">사진을 업로드 해주세요</label>
					 <button onclick="test();"></button>
						<div id="testDiv"></div>
						
				</div>
				<br>
				<div class="mb-3">
					<label for="content">내용:</label>
					<textarea class="form-control" rows="10" cols="5" name="content"
						id="content" placeholder="내용을 입력해 주세요"></textarea>
				</div>



			<!-- </form> -->
			<div>
				<button type="button">저장</button>
				<button type="button">목록</button>
			</div>
		</div>





















		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>