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
	background:#ebebeb;
	font-family:Noto Sans;
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
	height:350px;
	border-bottom:1px solid gray;
}

#mainPhoto {
	width:100%;
	height:100%;
}

/* 스터디 소개 영역 */
#study-content-section {
	position:relative;
	width:100%;
	height:700px;
	padding:4%;
}

/* 스터디 신청영역 */
#fixed-apply-seciton {
	position:fixed;
	top:12%;
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
	padding:5%;
}

/* 신청 영역(하단) */
#apply-bottom-section {
	width:100%;
	height:20%;
	padding:5%;
}

.apply-section {
	position:relative;
	display:inline-block;
	width:100%;
	font-size:15pt;
	font-weight:bolder;
}

#study-name {
	height:60%;
	border-bottom:1px solid gray; 
}

#study-cnt {
	padding-top:10%;
	height:40%;
	text-align:center;
}

#apply-button {
	width:100%;
	height:100%;
	background:rgba(0, 57, 255, 0.3);
	cursor:pointer;
	font-weight:bolder;
	border:none;
}

</style>

<script type="text/javascript">
	$(function() {
		$(".justify-content-center").hide(); 
		
		// 대표사진 불러오기 함수
		imageSetting();
		
		
	});
	
	// 대표사진 src 형식에 맞추기 함수
	function imageSetting() {
		var imgPath = $("#img_url").val();
		var imgRealPath = imgPath.split("Studdype_Final");
		
		$("#mainPhoto").attr("src", "."+imgRealPath[1]);
	}
</script>
</head>
<body>
	
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	
	<div id="main-section">
		<div id="main-content-section">
			<div id="study-photo-section">
				<input type="hidden" id="img_url" value="${study.getPhoto() }">
				 <img id="mainPhoto" src="">
			</div>
			<div id="study-content-section">
				<div id="content-title">
					<p>${study.getS_info() }</p><!-- 스터디 지역 -->
					<!-- 스터디 이름 -->
					<!-- 스터디 한줄 소개 -->
				</div>
				
				<div id="content-detail">
					<!-- 스터디 한 줄 소개 -->
				</div>
				<div id="content-book">
					<!-- 도서 정보 -->
				</div>
			</div>
		</div>
		<div id="fixed-apply-seciton">
			<div id="apply-top-section">
				<div class="apply-section" id="study-name">
					<span>${study.getS_name() }</span>
				</div>
				<div class="apply-section" id="study-cnt">
					<label>현재 인원/최대인원</label><br><span>${study.getS_currentcnt() }/${study.getS_maxcnt() }</span>
				</div>
			</div>
			<div id="apply-bottom-section">
				<button id="apply-button" onclick="">스터디 신청</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
	
</body>
</html>