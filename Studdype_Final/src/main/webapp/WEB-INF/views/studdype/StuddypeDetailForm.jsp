<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

<style type="text/css">
#main-section {
	position:relative;
	width:100%;
	height:1000px;
	background:rgba(114, 116, 115, 0.14);
}

/* 스터디 소개 전체 영역 */
#main-content-section {
	position:relative;
	width:40%;
	height:100%;
	left:25%;
	margin:1%;
	background:#fff;
}

/* 스터디 대표사진 영역 */
#study-photo-section {
	position:relative;
	width:100%;
	height:300px;
	border-bottom:1px solid gray;
}

/* 스터디 소개 영역 */
#study-content-section {
	position:relative;
	width:100%;
	height:700px;
	padding:2%;
}

/* 스터디 신청영역 */
#fixed-apply-seciton {
	position:fixed;
	top:13%;
	left:70%;
	width:13%;
	height:300px;
	border-radius:5px;
	background:#fff;
}

/* 신청 정보 영역(상단) */
#apply-top-section {
	width:100%;
	height:80%;
	border-bottom:1px solid gray;
	padding:5%;
}

/* 신청 영역(하단) */
#apply-bottom-section {
	width:100%;
	height:20%;
	padding:5%;
}

#apply-button {
	width:100%;
	height:100%;
	background:rgba(0, 57, 255, 0.3);
}

</style>

<script type="text/javascript">
	$(function() {
		$(".justify-content-center").hide(); 
	});
</script>
</head>
<body>
	
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	
	<div id="main-section">
		<div id="main-content-section">
			<div id="study-photo-section">
				 <img src="${study.getPhoto() }">
			</div>
			<div id="study-content-section">
				
			</div>
		</div>
		<div id="fixed-apply-seciton">
			<div id="apply-top-section">
				스터디 이름
				현재 인원/최대인원
			</div>
			<div id="apply-bottom-section">
				<button id="apply-button" onclick="">신청버튼</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
	
</body>
</html>