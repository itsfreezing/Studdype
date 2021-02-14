<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
   
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet" href="./resources/css/studdype/findpw.css">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<style type="text/css">
h1{
	margin-top: 3%;
	font-weight:600;
	font-size: 30px;
	line-height: 20px;
	text-align: center;
}
span{
	color:white;
	font-size: 20px;
}
.main_div{
	margin-top: -1%;
	margin-bottom: 1%;
	margin-left: auto;
	margin-right: auto;
   	text-align: center;
	width: 500px;
	height: 140px;
	color: black;
	background: white;
	border-radius: 5px;
	opacity: 85%;
}
#mail_name{
	font-size: 18px;
	font-weight: 600;	
}
.footer_btn{
	margin-top: 3%;
	font-weight: 800;
}
#home_btn{
	display: inline-block;
   width:50%;
   float: left;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
      height:50px;
	background-color: white;
	border: 1px solid #A6A6A6;
	font-size: 15px;
	border-radius: 0 0 0 5px;
	color: black;
	padding: 1%;
	box-shadow: none;
}
#home_btn:hover{
	background-color: white;
	border: 2px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;
}
#login{
	display: inline-block;
   width:50%;
   float: right;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
      height:50px;
	background-color: white;
	border: 1px solid #A6A6A6;
	font-size: 15px;
	border-radius: 0 0 5px 0;
	color: black;
	padding: 1%;
	box-shadow: none;
}
#login:hover{
	background-color: white;
	border: 2px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;
}
.footer-text{
	margin-top: 20px;
}
</style>

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

 <script type="text/javascript">
 $(function() {
		$(".background").show(); 
		$(".background").css({"background-image":"url('resources/assets/img/main3.png')","background-size":"cover"});
		$(".background").css("height", "750px");
		$(".hero-text").html("<h1>비밀번호 찾기</h1><br><span>임시 비밀번호를 변경해 주세요.</span>");	
		$(".footer-text").css("margin-top", "40px");
 });
</script>
</head>
<body>
<div class="background">
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<div class="main_div">
   	<span id="span_name" style="color:black"><div id="mail_name">'${member.mem_email }' </div>로 임시 비밀번호를 전송했습니다.</apan>
   
   
   <div class="footer_btn">
		<button type="submit" id="home_btn"><a href="studyList.do">HOME</a></button>
		<button type="submit" id="login"><a href="loginform.do" onclick="loginpage/loginform">로그인</a></button>
	</div>
</div>
</div>


   
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
	<!-- 스크립트 -->
	<script src="./resources/assets/js/popper.min.js"></script>
	<script src="./resources/assets/js/bootstrap.min.js"></script>
	<script src="./resources/assets/js/owl.carousel.min.js"></script>
	<script src="./resources/assets/js/modal-video.js"></script>
	<script src="./resources/assets/js/loadmore.js"></script>
	<script src="./resources/assets/js/prefixfree.min.js"></script>
	<script src="./resources/assets/js/main.js"></script>

</body>
</html>