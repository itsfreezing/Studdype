<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ComunityHome</title>
    <link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<style type="text/css">
.header-area {
	background: #88d3ce;
	background: -moz-linear-gradient(left, #88d3ce 0%, #6e45e2 100%);
	background: -webkit-linear-gradient(left, #88d3ce 0%, #6e45e2 100%);
	background: linear-gradient(to right, #88d3ce 0%, #6e45e2 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#88d3ce', endColorstr='#6e45e2', GradientType=1);
}
.mainmenu li.active:not(:last-child):after,
.mainmenu li:not(:last-child):hover:after { 
	background: #fff;
}

.dropdown-menu.show{
	left: -200px;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
   <div class="feature-page get-start header-area">
      <div class="container">
         <div class="header-top">
            <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            
               <!-- 헤더 좌측 로고 -->
               <a class="navbar-brand" href="studyList.do"><img src="./resources/assets/img/logo_white.png" alt="" class="logo"></a>
			   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  					<span class="navbar-toggler-icon"></span>
			   </button>
               
             	<!-- 헤더 우측 네비 -->
				<div class="collapse navbar-collapse my-2 my-lg-0" id="navbarSupportedContent">
					<div class="mainmenu">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item">
								<a class="nav-link" href="studyList.do">스터띱 홈<span class="sr-only">(current)</span></a>

	                             
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<img id="userImg" src="./resources/assets/img/user3.png">${login.mem_name }
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<div id="down-menu">
										<div id="down-left"><img id="userSquare" src="./resources/assets/img/userSquare.png"></div>
										<div id="down-top"><b>${login.mem_name }</b>님 환영합니다!</div>
										<div id="down-bottom"><input type="button" onclick="location.href='myPage.do'" value="프로필 보기"></div>
									</div>
										<a class="dropdown-item" href="myPage.do"><b>마이페이지</b></a>
										<a class="dropdown-item" id="myApply" href="myPage.do#myApply">스터디 신청 내역</a>
										<a class="dropdown-item" id="applyList" href="myPage.do#applyList">스터디 신청받은 내역</a>
										<a class="dropdown-item" id="myMeet" href="myPage.do#myMeet">모임확인</a>
										<hr id="profileHR">
										<a class="dropdown-item" href="logout.do" onclick="logout_btn();" id="logout">로그아웃</a>
								</div>

							</li>
							<li class="nav-item"></li>
	
						</ul>
					</div>
				</div>
			</nav>
			<!-- 네비 끝 -->
		</div>
		
		<!-- 헤더 텍스트 -->
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="hero-text-wrapper">
						<div class="hero-text-inner">
							<div class="hero-text">
								
								<c:if test="${study.s_name != null }"><h1>${study.s_name }</h1><span style="color:white">${study.s_info }</span></c:if>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 헤더 텍스트 끝 -->
		</div>
	</div>
    <!-- 헤더 끝 -->

</body>
</html>