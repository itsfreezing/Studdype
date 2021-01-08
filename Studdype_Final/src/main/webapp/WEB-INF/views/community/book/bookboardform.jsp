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
<style type="text/css">
#find-section {
	display: block;
	position: relative;
	width: 100%;
	text-align:center;
	margin-top:10%;
	right:5%;
}

#btn-group {
	width:60%;
	display:inline-block;
}

.search-Book {
	position:relative;
	width:48%;
	height:250px;
	background:#dfdfdf;
	border-radius:20px;
	font-size:2.5em;
	font-weight:bolder;
	border:0;
	outline:0;
	color:#868e96;
}

.search-Book:hover {
	cursor:pointer;
	background:#6610f2;
	color:#fff;
	transition: 0.5s ease all;
	transform: translate3D(0,-15%, 0);
}


#registerBookSearch {
	float:left;
	margin-right:1%;
}

#newBookSearch {
	float:right;
	margin-left:1%;
}
</style>
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	<!-- 메인 섹션 시작------------------------------------------------------- -->
	<div class="main-section">
	<!-- a태그 영역 시작--------------------------------------------------------- -->
		<div id="find-section">
			<div id="btn-group">
				<button class="search-Book" id="registerBookSearch" onclick="location.href='searchBook.do'">스터디 도서 검색</button>
				<button class="search-Book" id="newBookSearch" onclick="location.href='registerBook.do'">도서 등록</button>
			</div>
		</div>
	<!-- a태그 영역 종료--------------------------------------------------------- -->
	</div>
	<!-- 메인 섹션 종료------------------------------------------------------- -->
	
	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>

</body>
</html>