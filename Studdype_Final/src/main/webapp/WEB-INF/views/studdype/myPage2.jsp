<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
   href="./resources/assets/css/font-awesome.min.css">

<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min2.css">
 
    
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
<!--  헤더끝 -->

<!-- 상단 정보 회원정보div -->
<div style="width:100%; height:300px; background-color:black;">
	<h3 style="color:white; font-weight:bold; font-size:20px; position:absolute; top:11%; left:4%; ">My page</h3>
	<h3 style="color:white; font-weight:bold; font-size:30px; position:absolute; top:15%; left:4%;"><c:if test="${login != null }">${login.mem_name }</c:if></h3>
	
	<a style="color:grey; font-size:14px; position:absolute; top:16.5%; left:12%;" href="UpdateMember.do" >회원정보변경</a>
	<p style="color:white;font-size:30px; font-weight:bold; position:absolute; top:20%; left:20%;">회원 정보</p>
	<p style="color:white;font-size:30px; font-weight:bold; position:absolute; top:14%; left:30%;">아이디 : </p><p style="color:white;font-size:30px; font-weight:bold; position:absolute; top:14%; left:36%;">${login.mem_id }</p>
	<p style="color:white; font-size:30px; font-weight:bold; position:absolute; top:28%; left:30%;">이메일 :</p><p style="color:white;font-size:30px; font-weight:bold; position:absolute; top:28%; left:36%">${login.mem_email}</p>
	<p style="color:white; font-size:30px; font-weight:bold; position:absolute; top:14%; left:60%;">성별 : </p><p style="color:white;font-size:30px; font-weight:bold; position:absolute; top:14%; left:65%">${login.mem_gender }</p>
	<p style="color:white; font-size:30px; font-weight:bold; position:absolute; top:28%; left:60%;">이메일 :</p><p style="color:white; font-size:30px; font-weight:bold; position:absolute; top:28%; left:66%">${login.mem_phone }</p>
</div>




</body>
<footer>
		<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>