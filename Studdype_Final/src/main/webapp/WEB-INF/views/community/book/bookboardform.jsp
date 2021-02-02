<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터띱 도서게시판</title>

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

<link rel="stylesheet" href="./resources/css/community/book/bookboardform.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	<!-- 메인 섹션 시작------------------------------------------------------- -->
	<div class="main-section">
	<!-- a태그 영역 시작--------------------------------------------------------- -->
		<div id="find-section">
			<div id="btn-group">
				<button class="search-Book" id="registerBookSearch" onclick="location.href='searchBook.do'">스터디 도서목록</button>
				<button class="search-Book" id="newBookSearch" onclick="location.href='registerBook.do'">도서 등록</button>
			</div>
		</div>
	<!-- a태그 영역 종료--------------------------------------------------------- -->
	</div>
	<!-- 메인 섹션 종료------------------------------------------------------- -->
	
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>

</body>
</html>