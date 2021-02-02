<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">
.mainmenu li.active:not(:last-child):after,
.mainmenu li:not(:last-child):hover:after { 
	background: #fff;
}

.header-area {
	background: #88d3ce;
	background: -moz-linear-gradient(left, #88d3ce 0%, #6e45e2 100%);
	background: -webkit-linear-gradient(left, #88d3ce 0%, #6e45e2 100%);
	background: linear-gradient(to right, #88d3ce 0%, #6e45e2 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#88d3ce', endColorstr='#6e45e2', GradientType=1);
}


</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function logout_btn(){
	var form = $("#logoutForm");
	var logout = $("#logout");
	
	if ( logout.val() == null || logout.val().trim() == ''){
		alert("로그아웃 되었습니다.");
	}else {
		form.submit();
	}
};

/* $(function() {
	var currentMenu = $("#currentMenu").val();
	
	// 해당 메뉴 페이지에 메뉴 active Class 추가
	$("#"+currentMenu).addClass("active");
	
	$(".feature-page.header-area").css("height", "80px");
	$(".hero-text-wrapper").css("height", "500px");
	$(".nav-link").css("color", "black");
	
}); */

$(function() {
	$("b").click(function(){
		$(this).next().slideToggle().end().parent().siblings().find("ul").slideUp();
	});
});



</script>
<style>

</style>
</head>

<body>
<input type="hidden" id="currentMenu" value="${headerMenu }">
	<!-- 헤더 시작 -->
	<form id="logoutForm" action="logout.do" method="POST">
	<div class="feature-page get-start header-area">
		<div class="container">
			<div class="header-top">
				<nav class="navbar navbar-expand-lg navbar-light fixed-top">
				
					<!-- 헤더 좌측 로고 -->
					<a class="navbar-brand" href="studyList.do"><img src="./resources/assets/img/logo_black.png" alt="" class="logo"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    					<span class="navbar-toggler-icon"></span>
 					</button>
					
					<!-- 헤더 우측 네비 -->
					<div class="collapse navbar-collapse my-2 my-lg-0" id="navbarSupportedContent">
						<div class="mainmenu">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item" id="home">
								<a class="nav-link" href="studyList.do">스터띱 홈</a>
								</li>
								<li class="nav-item" id="create">
									<a class="nav-link" href="createStuddypeform.do">스터디 생성</a>
								</li>
								<li class="nav-item" id="category">
									<a class="nav-link" href="searchbycategory.do">카테고리별 검색</a>
								</li>
								<li class="nav-item" id="location">
									<a class="nav-link" href="searchByLocalPage.jsp">지역별 검색</a>
								</li>
							</ul>
							<ul>
								<b><a href=""><img src="./resources/assets/img/user3.png"></a></b>
								<c:choose>
								<c:when test="${login == null }">
								<li class="nav-item"  id="loginMenu">
									<a class="nav-link" href="loginform.do">로그인</a>
								</li>
								<li class="nav-item" id="signUpMenu">
									<a class="nav-link" href="signform.do">회원가입</a>
								</li>
								</c:when>
								<c:otherwise>
						<!-- 	<li class="nav-item">
									<a class="nav-lick" href="#">${login.mem_id }님 </a>
								</li>
						-->		<li class="nav_item" id="myPage">
									<a class="nav-link" href="myPage.do" >마이 페이지</a>
								</li>
								<li class="nav-item" id="logout">
									<a class="nav-link" href="logout.do" type="submit" onclick="logout_btn();" id="logout" style="border:0">로그아웃</a>
								</li>
								</c:otherwise>
								</c:choose>
								<!-- 마지막 요소는 hover 시 라인 생성 안되서 일부러 추가해 놓았음!! -->
								<li class="nav-item"></li>
							</ul>
							</div>
							</div>
							</nav>
							</div>
						</div>

					</div>
					</form>
			
				<!-- 네비 끝 -->
				<div class="row justify-content-center">
				<!-- <div class="col-lg-6 text-center"><img src="./resources/assets/img/loginBanner.png">
					
				</div> -->
			</div>
			<!-- 헤더 텍스트 끝 -->
	<!-- 헤더 끝 -->
</body>

</html>
