<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>main page</title>
	
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
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
		    var owl = $('.owl-carousel');
		    
		    owl.owlCarousel({
		        items:1,                 // 한번에 보여줄 아이템 수
		        loop:true,               // 반복여부
		        //margin:35,               // 오른쪽 간격
		        autoplay:true,           // 자동재생 여부
		        autoplayTimeout:1800,    // 재생간격
		        autoplayHoverPause:false  //마우스오버시 멈출지 여부
		    });    
		    
		    $('.customNextBtn').click(function() {
		        owl.trigger('next.owl.carousel');
		    })
		    
		    $('.customPrevBtn').click(function() {
		        owl.trigger('prev.owl.carousel', [300]);
		    })
		});
	</script>
	
	<style type="text/css">
		input#search{
			height: 55px;
			margin-top: 15px;
			border-top: none;
			border-right: none;
			border-left: none;
			border-bottom: 1px solid;
			background-color: F9FAFC;
			background-color: transparent;
		}
		
		input#search:focus{
			border-bottom: 3px solid #6610F2;
		}
	</style>
	
</head>

<body>

	<!-- 헤더 시작 -->
	<div class="articles header-area">
		<div class="container">
			<div class="header-top">
				<nav class="navbar navbar-expand-lg navbar-light fixed-top">
				
					<!-- 헤더 좌측 로고 -->
					<a class="navbar-brand" href="studdypehome.do"><img src="./resources/assets/img/logo_purple.png" alt="" class="logo2"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    	<span class="navbar-toggler-icon"></span>
				  	</button>
					
					<!-- 헤더 우측 네비 -->
					<div class="mainmenu">
						<ul class="navbar-nav ml-auto">
							<li class="active nav-item">
							<a class="nav-link" href="studdypehome.do">스터띱 홈</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="studdypeexample.do">스터디 생성</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="searchbycategory.do">카테고리별 검색</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="searchByLocalPage.jsp">지역별 검색</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="loginPage.jsp">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="membershipPage.jsp">회원가입</a>
							</li>
							<!-- 마지막 요소는 hover 시 라인 생성 안되서 일부러 추가해 놓았음!! -->
							<li class="nav-item"></li>
						</ul>
					</div>
				</nav>
				<!-- 네비 끝 -->
			</div>
		</div>
		<!-- 컨테이너 끝 -->
	</div>
	<!-- 헤더 끝 -->
 
	<!-- 메인페이지 슬라이더 영역 -->
	<!-- 속성 검색 시 owl-carousel로 검색하면 찾기 쉬움! -->
	<div class="owl-carousel hero-slider-area" id="mainBanner" style=" box-shadow: 5px 5px 5px;">
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage1.png">
		</div>
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage2.png">
		</div>
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage3.png">
		</div>
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage4.png">
		</div>
	</div>
	<!-- 슬라이더 끝 -->
	
	<!-- 스터디 영역 -->
	<div class="blogpost-area">
		<!-- 검색창 -->
		<form action="/.do" method="get">
			<div class="input-group" style="width: 50%; margin: auto; margin-bottom: 100px;">
				<span><img src="./resources/assets/img/logo_purple.png" class="logo"></span>
				<input type="text" class="form-control" id="search" placeholder="원하는 스터디나 카테고리를 검색하세요.">
				<span><button type="submit" id="search"><img src="./resources/assets/img/icon_search_white.png" style="width:20px;"></button></span>
			</div>
		</form>
		
		<div class="container">
			<div class="row">
				
				<!-- 이미지 크기에 따라 스터디의 길이가 달라질 수 있음 -->
				<!-- div 태그 클릭시 해당 스터디홈으로 이동 -->
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study1.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study2.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study3.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study4.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study5.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study6.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study7.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 blogs-load" onclick="location.href='index.jsp'" style="cursor:pointer">
					<div class="single-blog-post">
						<div class="blog-img">
							<!-- 스터디 이미지 -->
							<img  src="./resources/assets/img/img_study8.png" alt="" class="img-fluid">
						</div>
						<!-- 제목/장소아이콘/장소/카테고리 -->
						<div class="blog-meta">
							<a><h3>title</h3></a><br>
							<span><img src="./resources/assets/img/profile_placeholder.png" style="width: 15px;">location&nbsp;&nbsp;&nbsp;&nbsp;category</span>
						</div>

						<p>#hashTag??</p>
						<!-- 최대인원수/팀장명 -->
						<div class="blog-comments">
							<span><b>User</b><a style="float: right;"><img src="./resources/assets/img/profile_user.png" style="width: 15px;">&nbsp;&nbsp;maximumUser</a></span>
						</div>
					</div>
				</div>
				
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-4 text-center">
					<a href="#" class="btn btn-primary all-blogs">load more</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Control Area
======================================-->
	<div class="blogs control-area control-bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<div class="control-text">
						<h6>SOCAL MARKETING &amp; ANALYTICS</h6>
						<h1>Take control of your data</h1>

						<a href="#" class="btn btn-primary">get started</a>
						<a href="#" class="btn btn-light">EXPLORE FEATURES</a>
					</div>
				</div>
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</div>
	<!--End of control area-->

	<jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
	
	<script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/loadmore.js"></script>
    <script src="./resources/assets/js/prefixfree.min.js"></script>
    <script src="./resources/assets/js/main.js"></script>
</body>

</html>
