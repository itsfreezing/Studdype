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
	margin-top: 5%;
	margin-bottom: 2%;
	margin-left: 33%;
   	text-align: center;
	width: 500px;
	height: 70px;
	color: black;
	background: #EAEAEA;
	border-radius: 10px;
}
#mail_name{
	font-size: 18px;
	font-weight: 600;	
}
</style>

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

 <script type="text/javascript">
 $(function() {
		$(".justify-content-center").show(); 
		$(".justify-content-center").css({"background-image":"url('resources/assets/img/loginBanner2.png')","background-size":"cover"});
		$(".hero-text").html("<h1>비밀번호 찾기</h1><br><span>잊지말고 기억해요.</span>");	
 });
</script>
</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<div class="main_div">
	
   		<div><div id="mail_name">'${member.mem_email }' </div>로 임시 비밀번호를 전송했습니다.</div>
   		
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