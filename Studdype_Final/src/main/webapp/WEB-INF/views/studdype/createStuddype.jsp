<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ComunityHome</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"href="./resources/css/studdype/createStuddype.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

</head>
<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<!--main conternt 섹션-->
	<div class="main-section">

		<form>
			<div class="form-group">
				<label for="exampleInputFile">대표사진 업로드
				<input type="file" id="exampleInputFile"></label> 
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">이메일 주소</label> <input type="email"
					class="form-control" id="exampleInputEmail1"
					placeholder="이메일을 입력하세요">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">암호</label> <input type="password"
					class="form-control" id="exampleInputPassword1" placeholder="암호">
			</div>
			
			
			<textarea class="form-control" rows="3"></textarea>
		
			<button type="submit" class="btn btn-default">제출</button>
		</form>

	</div>

	<jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
</body>


</html>