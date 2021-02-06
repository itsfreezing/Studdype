<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script type="text/javascript">

$(function(){
	// 헤더 메뉴 선택 시 h1태그 이름 변경
	$(".hero-text").html("<h1>이용약관</h1>");
	
	// 스터디 생성에 맞는 이미지 가져오기
	$(".justify-content-center").css({"background-image":"url('resources/img/createStudy.png')"
								,"background-size":"cover"});
	
});
</script>

</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	<h1>hello</h1>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/loadmore.js"></script>
<script src="./resources/assets/js/prefixfree.min.js"></script>
<script src="./resources/assets/js/main.js"></script>
</body>
</html>