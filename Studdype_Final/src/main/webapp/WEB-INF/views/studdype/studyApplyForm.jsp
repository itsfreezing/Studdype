<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디띱 스터디</title>

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
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/applyForm.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script>
	function chkInfo(){
		var form = $("#applyForm");
		var info = $("#selfInfoText").val();
		
		if ( info.trim() == "" || info == null ){
			$("#selfInfoText").css('border','7px ridge red');
			alert("자기소개를 작성 해주세요.");
		} else if ( info.trim().length > 500 ){
			$("#selfInfoText").css('border','7px ridge red');
			alert("500자 이내로 작성 해주세요.\n(공백, 띄어쓰기 제외)");
		} else {
			form.submit();
		}
		
	}
</script>
</head>
<body>
	
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<div id="main-section">
		<img src="./resources/assets/img/applyForm.png">
		<div id="title">스터디 가입 신청서</div>
		<div id="member"><p>작성자</p>${ login.mem_name }(${ login.mem_id })</div>
		<div id="studyTitle"><p>스터디 명</p>${ study.s_name }</div>
		<div id="studyCate"><p>카테고리</p>${ category }</div>
		<div id="selfInfo"><p>자기소개</p></div>
		<form id="applyForm" action="studyMemberInsert.do" method="post">
			<input type="hidden" name="s_no" value="${ study.s_no }">
			<input type="hidden" name="mem_no" value="${ login.mem_no }">
			<textarea id="selfInfoText" name="info" placeholder="자기소개를 작성 해주세요."></textarea>
			<div id="chkBtn">
				<input type="button" class="submitBtn" onclick="chkInfo();" value="신청하기">
			</div>
		</form>
	</div>
	
<jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>

<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>
</body>
</html>