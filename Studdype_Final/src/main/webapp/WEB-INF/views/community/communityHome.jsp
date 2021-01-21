<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CommunityHome</title>

	<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
	<link rel="stylesheet" href="./resources/assets/css/animate.css">
	<link rel="stylesheet" href="./resources/assets/css/normalize.css">
	<link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/assets/css/responsive.css">
    <link rel="stylesheet" href="./resources/css/community/header&footer.css">
    <link rel="stylesheet" href="./resources/css/community/leftnavi.css">
    <link rel="stylesheet" href="./resources/css/community/mainsection.css">
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>

</head>
<body>
<jsp:include page="../commond/communityHeader.jsp"></jsp:include>
<jsp:include page="../commond/communityLeftNavi.jsp"></jsp:include>
	
	<!--main conternt 섹션-->
	<div class="main-section">
			<c:choose>
				<c:when test="${ study.getPhoto() == null }">
					<div><img src="./resources/assets/img/meetTime.png"></div>					
				</c:when>
				<c:otherwise>						
					<div>${study.getPhoto() }</div>
				</c:otherwise> 
			</c:choose>
	</div>
    
<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</body>
</html>