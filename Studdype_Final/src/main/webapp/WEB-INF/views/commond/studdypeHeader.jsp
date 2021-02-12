<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
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

$(function() {
   var currentMenu = $("#currentMenu").val();
   
   // 해당 메뉴 페이지에 메뉴 active Class 추가
   $("#"+currentMenu).addClass("active");
   
   $(".feature-page.header-area").css("height", "70px");
   $(".hero-text-wrapper").css("height", "400px");
   $(".nav-link").css("color", "black");
   
});

</script>

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
                        <li class="nav-item" id="category">
                           <a class="nav-link" href="searchbycategory.do">카테고리별 검색</a>
                        </li>
                        <li class="nav-item" id="location">
                           <a class="nav-link" href="studyListLocation.do">지역별 검색</a>
                        </li>
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
		                        <li class="nav_item" id="myPage">
		                           <a class="nav-link" href="myPage.do" >마이 페이지</a>
		                        </li>
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
											<a class="dropdown-item" id="create" href="createStuddypeform.do"><b>스터디 생성</b></a>
											<a class="dropdown-item" id="myApply" href="myPage.do#myApply">스터디 신청 내역</a>
											<a class="dropdown-item" id="applyList" href="myPage.do#applyList">스터디 신청받은 내역</a>
											<a class="dropdown-item" id="myMeet" href="myPage.do#myMeet">모임확인</a>
											<hr id="profileHR">
											<a class="dropdown-item" href="logout.do" onclick="logout_btn();" id="logout">로그아웃</a>
									</div>
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
            <c:if test="${studylist == null }">
            
            
         <div class="row justify-content-center">
            <div class="col-lg-6 text-center">
               <div class="hero-text-wrapper">
                  <div class="hero-text-inner">
                     <div class="hero-text">


                     </div>
                  </div>
               </div>
            </div>
         </div>
         </c:if>
         <!-- 헤더 텍스트 끝 -->
   <!-- 헤더 끝 -->
</body>

</html>