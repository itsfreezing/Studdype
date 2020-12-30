<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>my page</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/modal-video.min.css">
	<link rel="stylesheet" href="../css/nice-select.css">
	<link rel="stylesheet" href="../css/animate.css">
	<link rel="stylesheet" href="../css/normalize.css">
	<link rel="stylesheet" href="./style.css">
	<link rel="stylesheet" href="../css/responsive.css">

	<script src="../js/jquery.3.2.1.min.js"></script>

</head>

<body>

	<!-- 헤더 시작 -->
	<div class="feature-page get-start header-area">
		<div class="container">
			<div class="header-top">
				<nav class="navbar navbar-expand-lg navbar-light fixed-top">
				
					<!-- 헤더 좌측 로고 -->
					<a class="navbar-brand" href="mainPage.jsp"><img src="../img/logo_white.png" alt="" class="logo"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    					<span class="navbar-toggler-icon"></span>
 					</button>
					
					<!-- 헤더 우측 네비 -->
					<div class="collapse navbar-collapse my-2 my-lg-0" id="navbarSupportedContent">
						<div class="mainmenu">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item">
								<a class="nav-link" href="mainPage.jsp">Home</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="createStudyPage.jsp">Create Study</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="searchByCategoryPage.jsp">Search by Category</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="searchByLocalPage.jsp">Search by Local</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="">Log Out</a>
								</li>
								<li class="active nav-item">
									<a class="nav-link" href="myPage.jsp">MyPage</a>
								</li>
								<!-- 마지막 요소는 hover 시 라인 생성 안되서 일부러 추가해 놓았음!! -->
								<li class="nav-item"></li>
							</ul>
						</div>
					</div>
				</nav>
				<!-- 네비 끝 -->
			</div>
			
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="hero-text-wrapper">
						<div class="hero-text-inner">
							<div class="hero-text">
								<h1>마이페이지</h1><br><br><br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 헤더 텍스트 끝 -->
		</div>
	</div>
	<!-- 헤더 끝 -->
	<!-- body -->
	<div style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px;
	box-shadow: 1px 1px 2px 6px #e9e9e9;">
		<p style="text-align:center; font-weight:bold; font-size:28px;">My StuDdype Profile</p>
	</div>
	<div style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px;
	box-shadow: 1px 1px 2px 6px #e9e9e9;">
		<p style="text-align:center; font-weight:bold; font-size:28px;">Request Sent</p>
	</div>
	<div style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px;
	box-shadow: 1px 1px 2px 6px #e9e9e9;">
		<p style="text-align:center; font-weight:bold; font-size:28px;">Received Request</p>
	</div>
	<div style="border:1px solid black; width:400px; height:400px; float:left ;margin:37px; border-radius: 15px;
	box-shadow: 1px 1px 2px 6px #e9e9e9;">
		<p style="text-align:center; font-weight:bold; font-size:28px;">Meeting Management</p>
	</div>
	
	



		<!-- footer-bottom -->
		
		<!-- SNS -->
		<div class="container-fluid" >
			<div class="row" style=" width:100%; height:100px; position:absolute; top:100%;  ">
				<div class="col-lg-8 text-left">
					<div class="copyright">
						<p>Copyright © StuDdype Inc. All Rights Reserced.</p>
					</div>
				</div>
				<div class="col-lg-4 text-right">
					<div class="social-icon">
						<a href="#"><i class="fa fa-facebook"></i></a>
						<a href="#"><i class="fa fa-twitter"></i></a>
						<a href="#"><i class="fa fa-google-plus"></i></a>
						<a href="#"><i class="fa fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<!-- SNS 끝 -->
		</div>
		<a href="#" class="back-to-top"><i class="fa fa-long-arrow-up"></i></a>
	</div>
	<!-- footer 끝 -->


	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/modal-video.js"></script>
	<script src="../js/main.js"></script>
</body>

</html>
