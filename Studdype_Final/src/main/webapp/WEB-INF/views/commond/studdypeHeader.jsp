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

   
   location.href="logout.do";
};

$(function() {
   var currentMenu = $("#currentMenu").val();
   // 해당 메뉴 페이지에 메뉴 active Class 추가
   $("#"+currentMenu).addClass("active");
   
   $(".feature-page.header-area").css("height", "70px");
   $(".hero-text-wrapper").css("height", "400px");
   $(".nav-link").css("color", "black");
   
});




    //On Click Event
    $(".dropdown-item").click(function() {

        $(".dropdown-item").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
		
        return true;
    });
    //스터디 팝업 
	function studypopup(multipleFilter) {
		
		const popup = document.querySelector('#studypopup');
	    
		if (multipleFilter) {
	       popup.classList.add('multiple-filter');
	    } else {
	       popup.classList.remove('multiple-filter');
	    }
	    
		popup.classList.remove('hide');
	}

	function closestudypopup() {
		const popup = document.querySelector('#studypopup');
	    popup.classList.add('hide');
	}

</script>



<style type="text/css">
#studypopup .content{
  height:500px;
  width:600px;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}
#studypopup.multiple-fileter{
	backdrop-filter: blur(4px) grayscale(90%);
  -webkit-backdrop-filter: blur(4px) grayscale(90%);
}
#studypopup.hide{
	display:none;
}
#studypopup{
	 display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, .7);
  z-index: 7;
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}
.profileBtn{
   background-color: #eaeaea;
   border-radius: 0.25em;
   border: none;
   padding: 0.5% 1%;
   cursor: pointer;
}
</style>
</head>

<body>
<input type="hidden" id="currentMenu" value="${headerMenu }">
   <!-- 헤더 시작 -->

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
                           <a class="nav-link" href="studycategoryList.do">카테고리별 검색</a>
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

											<div id="down-bottom"><input type="button" onclick="studypopup();" value="나의 스터디"></div>

										</div>
											<a class="dropdown-item" id="create" href="createStuddypeform.do"><b>스터디 생성</b></a>
											<a class="dropdown-item" id="myApply" href="myPage.do#myApply">스터디 신청 내역</a>
											<a class="dropdown-item" id="applyList" href="myPage.do#applyList">스터디 신청받은 내역</a>
											<a class="dropdown-item" id="myMeet" href="myPage.do#myMeet">모임확인</a>
											<hr id="profileHR">
											<a class="dropdown-item"  onclick="logout_btn();" id="logout">로그아웃</a>
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
         <!-- 헤더 텍스트 끝 -->
   <!-- 헤더 끝 -->
   <div id="studypopup" class="hide">
    <div class="content">
    	<p style="font-weight: bold; position: absolute; top: 272px; left: 880px; font-size: 18px; ">내 전체 스터디 목록</p>
    	<p style="position: absolute;top: 302px;left: 760px; color:red; font-size: 16px; font-weight: bold;">*본인이 리더인 스터디의 경우 빨간색으로 표시됩니다</p>
       <div style="height: 300px; width: 28%; position: absolute; top: 34%; left: 36%; overflow:auto;" id="allstudy">
       		<table id="studyall" style="height:500px; width:511px; text-align:center;" class="table table-hover">
       			<thead>
       				<tr>
       					<th>스터디 이름</th>
       					<th>이동하기</th>
       				</tr>
      			</thead>
      			<tbody>
      				<c:forEach var="studylist" items="${studylist }" varStatus="status">
      					<tr>
      						<c:if test="${studylist.leader_no != login.mem_no }"><td>${studylist.s_name }</td></c:if>
      						<c:if test="${studylist.leader_no == login.mem_no }"><td style="color:red;">${studylist.s_name }</td></c:if>
      						<td><button class="btn btn-purple" onclick="location.href='studycommunity.do?s_no=${studylist.s_no }'">이동</button></td>
      					</tr>
      					
      				</c:forEach>
 
      			</tbody>
       		</table>
       
       
       </div>
    <button onclick="closestudypopup()" style="position:absolute; left:60.4%; top:69%;" class="profileBtn cancelBtn">닫기</button>
    </div>
   </div>
</body>

</html>