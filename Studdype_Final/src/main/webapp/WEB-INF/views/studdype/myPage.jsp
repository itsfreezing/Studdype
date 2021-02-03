<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet"  href="./resources/assets/css/owl.carousel.min2.css">
<link rel="stylesheet"  href="./resources/css/community/myPage.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>
<script src="./resources/assets/js/myPageScript.js"></script>
<script type="text/javascript">
$(document).ready(function() {

    	$(".tab_content").hide(); 
        $("ul.nav-items li:first").addClass("active").show();
        $(".tab_content:first").show(); 
        
        

    
	$("ul.nav-items li").click(function() {

        $("ul.nav-items li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content
		
        $($(this).find("a").attr("href")).fadeIn(); //Find the href attribute value to identify the active tab + content
        return false;
    });
   

});
</script>
</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

<!-- 상단 div_회원정보 -->
<div id="container">
	<div id="myPageBanner"><b>My page</b></div>
	<div id="memberInfo">
		<div id="myPageName"><c:if test="${login != null }">${login.mem_name }</c:if></div>
		<span class="memberInfo">님의</span><br><span class="memberInfo">회원정보 입니다.</span>
		<a class="info-btn-dark" onclick="getout();">회원탈퇴</a>
	</div>
	<div id="myPageBanner-left">
		<div class="myPageBanner-text"><b>아이디</b>&nbsp;${login.mem_id }
			<a class="info-btn-bright" onclick="showPw();">비밀번호 변경</a>
		</div>
		<div class="myPageBanner-text"><c:choose> 
											<c:when test="${login.mem_gender == 'M'}">
												<b>성별</b>&nbsp;남자
											</c:when>
											<c:otherwise>
												<b>성별</b>&nbsp;여자
											</c:otherwise>
										</c:choose>
		</div>
	</div>
	<div id="myPageBanner-right">
		<div class="myPageBanner-text"><b>이메일</b>&nbsp;${login.mem_email}
			<a class="info-btn-bright" onclick="showEmail();">이메일 변경</a>
		</div>
		<div class="myPageBanner-text"><b>전화번호</b>&nbsp;${login.mem_phone }
			<a class="info-btn-bright" onclick="showphone();">전화번호 변경</a>
		</div>
	</div>
</div>
<!-- 상단 div_탭 -->
<div id="nav-container">
	<ul class="nav-items">
	   <li class="my-nav-item" value="test1"><a href="#myApply">신청 내역</a></li>
	   <li class="my-nav-item" value="test2"><a href="#applyList">신청받은 내역</a></li>
	   <li class="my-nav-item" value="test3"><a href="#myMeet">모임확인</a></li>
	</ul>
</div>
<!-- 상단 div 끝 -->

<!-- tab 영역 -->

<!--  스터디 신청 내역 div -->
<div class="tab_content" id="myApply">
	<p class="tab_p">나의 스터디 신청 내역</p>
	
	<br>
	<br>
	<br>
	<c:if test="${fn:length(applylist) != 0 }">
	<table class="table table-striped table-bordered table-hover" style="border:1px solid blac; width:70%; text-align:center; position:absolute; top:47%; left:10%; ">
	<thead>
	<tr>
		<th>내가 신청한 스터디 이름</th>
		<th>나의 신청 상태</th>
		<th>내 신청 삭제</th>
	</tr>
	</thead>
	<tbody>
	


		<c:forEach var="applylist" items="${applylist }" varStatus="status1" >

		
		<c:forEach var="studyApplylist" items="${studyApplylist }" varStatus="status"  >
		<c:if test="${status1.count == status.count }">
	
		<tr>
			<td>${applylist.s_name }</td>
			<c:if test="${studyApplylist.agree =='D' }"><td>진행중</td></c:if>
			<c:if test="${studyApplylist.agree == 'Y' }"><td style="color:green;">수락됨</td></c:if>  
			<c:if test="${studyApplylist.agree == 'N' }"><td style="color:red;">거절됨</td></c:if>
			<td><button id="delete${status.count }" value="${studyApplylist.mem_no }"name="${studyApplylist.s_no }" onclick="receivedelete();">삭제</button></td>                        
		</tr>
		
		</c:if>
		</c:forEach>
		</c:forEach>
	
	
	
	</tbody>
	</table>
	</c:if>
	<c:if test="${fn:length(applylist) == 0 }">
		<img onclick="location.href='studyList.do'" src="resources/img/no_study.png" style="height:300px; margin-left:40%; position:absolute; top:30%;" >
		<a  style="font-weight:bold; font-size: 20px; margin-left:5%; position:absolute; left:33.3%; top:80%; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입 신청한 스터디가없습니다.<br>이미지를 클릭해 새로운 스터디를 가입해보세요!</a><br>
	
	
	</c:if>
	 

</div>
<!-- 스터디 신청내역 끝 -->

<!--  신청 받은 내역 -->
<div class="tab_content" id="applyList">
	<p class="tab_p">내가 받은 스터디 신청</p>
	
	<table class="table table-striped table-bordered table-hover" style=" width:70%; text-align:center; position:absolute; top:30%; left:14%; ">
	<thead>
		<tr>
			<th>스터디 이름</th>
			<th>신청한 사람</th>
			<th>수락/거절</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="receiveapplyname" items="${receiveapplyname }" varStatus="status">
		<c:if test="${Receiveapply[status.index].agree == 'D' }">
			<tr>
				<c:if test="${Receiveapply[status.index].agree == 'D' }"><td id="receive">${receiveapplyname.s_name }</td></c:if>
				<td>${applymember[status.index].mem_name }</td>
				<td>
				<button id="agree${status.count }" value="${Receiveapply[status.index].mem_no }" name="${Receiveapply[status.index].s_no }" onclick="agree();">수락</button>
				<button id="reject${status.count }" value="${Receiveapply[status.index].mem_no }" name="${Receiveapply[status.index].s_no }" onclick="reject();" >거절</button>
				</td>
			
			
			</tr>
		</c:if>
		</c:forEach>
	
	</tbody>
	
	</table>
	
	<c:if test="${fn:length(applylist) == 0 }">
		<p style="font-weight:bold; font-size: 30px; margin-left:42%; margin-top:9%;">받은 신청이 없습니다!</p>
	</c:if>
</div>

<!-- 신청 받은 내역 끝 -->
<!--  모임 이동 -->
<div class="tab_content" id="myMeet">
   <p class="tab_p">스터디 모임으로 이동</p>
   <table class="table table-striped table-bordered table-hover" style=" width:70%; text-align:center; position:absolute; top:30%; left:14%; ">
   <thead>
      <tr>
         <th>스터디 이름</th>
         <th>확인하기</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var = "studylist" items="${studylist }" end="4">
      <tr>
         <td>${studylist.s_name }</td>
         <td><button onclick="location.href='meetlist.do?s_no=${studylist.s_no}'">확인하기</button></td>
      </tr>
      </c:forEach>
   
   </tbody>
   
   </table>





</div>
<!-- 모임 이동 끝 -->









<!--  내가 가입한 스터디 리스트     -->
   <c:if test="${fn:length(studylist) != 0 }">
   <p id="mystudyl" style="font-size:20px; font-weight:bold; position:absolute; top:100%; left:10%;">내가 가입한 스터디</p>
   <div id="studylistdiv" class="owl-carousel hero-slider-area" style="height:50px;  position:absolute; top:950px; ">
     <c:forEach var="studylist" items="${studylist }" varStatus="status">
        <div class="hero-slider-info">
        <div style="height:130px; width:400px; border:1px solid black; background-color:black; margin-left:130px; cursor:pointer;" onclick="location.href='studycommunity.do?s_no=${studylist.s_no }'">
        <p style="color:white !important;  margin-left:20px;font-size:10px; font-weight:bold; display:inline;">
        <c:if test="${studylist.si_no == 1 }">서울</c:if>
        <c:if test="${studylist.si_no == 2 }">부산</c:if>
        <c:if test="${studylist.si_no == 3 }">인천</c:if>
        <c:if test="${studylist.si_no == 4 }">대구</c:if>
        <c:if test="${studylist.si_no == 5 }">광주</c:if>
        <c:if test="${studylist.si_no == 6 }">대전</c:if>
        <c:if test="${studylist.si_no == 7 }">울산</c:if>
        <c:if test="${studylist.si_no == 8 }">경기</c:if>
        <c:if test="${studylist.si_no == 9 }">강원도</c:if>
        <c:if test="${studylist.si_no == 10 }">충북</c:if>
        <c:if test="${studylist.si_no == 11 }">충남</c:if>
        <c:if test="${studylist.si_no == 12 }">경북</c:if>
        <c:if test="${studylist.si_no == 13 }">경남</c:if>
        <c:if test="${studylist.si_no == 14 }">전북</c:if>
        <c:if test="${studylist.si_no == 15 }">전남</c:if>
        <c:if test="${studylist.si_no == 16 }">제주</c:if>
        </p>
        <p style="color:white !important; margin-left:10px;font-size:10px; font-weight:bold; display:inline;" >
        <c:if test="${studylist.cate_no == 1 }">IT</c:if>
        <c:if test="${studylist.cate_no == 2 }">자격증</c:if>
        <c:if test="${studylist.cate_no == 3 }">공무원</c:if>
        <c:if test="${studylist.cate_no == 4 }">뷰티</c:if>
        <c:if test="${studylist.cate_no == 5 }">대입/수능</c:if>
        <c:if test="${studylist.cate_no == 6 }">어학/회화</c:if>
        <c:if test="${studylist.cate_no == 7 }">취업스터디</c:if>
        <c:if test="${studylist.cate_no == 8 }">기타</c:if>
        </p>
        <a style="color:white; font-weight:bold; margin-left:20px; font-size:20px;  display:block;">${studylist.s_name }</a>
        <c:forEach var="allMember" items="${allMember }">
        <c:if test="${studylist.leader_no == allMember.mem_no }">
        <p style="color:white !important; margin-left:20px; font-size:10px; font-weight:bold; display:inline;">팀장: ${allMember.mem_name }</p>
        </c:if>
        </c:forEach>
        <p style="color:white !important; font-size:10px; font-weight:bold;display:inline; margin-left:70px;">최대 :${studylist.s_maxcnt }명</p>
        </div>
        </div>
     
     </c:forEach>
 
   </div>
   </c:if>
   <c:if test="${fn:length(studylist) == 0 }">
      <p id="mystudyl" style="font-size:20px; font-weight:bold; position:absolute; top:94%; left:45.5%;">가입한 스터디가 없습니다!</p>
   
   </c:if>
<!--  내가 가입한 스터디 리스트 끝 -->
<!--  비밀번호 변경    -->
<div id="popup" class="hide">
  <div class="content">
    <p style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:38.7%; left:41%;" >새 비밀번호:</p><input style="position:absolute; top:39%; left:48%;" id="pwd1" type='password'><br>
    <a style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:46%; left:41%;">비밀번호 확인:</a><input style="display:inline; position:absolute;top:46%; left:48%;" id="pwd2" name="pwd2"type='password'>
    <div class="alert alert-success" id="alert-success" style="position:absolute; top: 51%; left: 44%;">비밀번호가 일치합니다.</div> <div style="position:absolute; top: 51%; left: 42%;" class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>


    <button onclick="changepw()"  class="profileBtn submitBtnPW" >변경</button>
    <button onclick="pwclosePopup()"  class="profileBtn cancelBtnPW" >취소</button>
  </div>
   

</div>
<!--  비밀 번호 변경 끝 -->
<!--  이메일 변경 -->
   <div id="emailpopup" class="hide">
    <div class="content">
    <p>새 이메일:</p>
    <input class="popupInput" id="newemail" name="newemail" placeholder="000000@00000.com"><br>
   


    <button onclick="changeemail()" class="profileBtn submitBtn" >변경</button>
    <button onclick="closeemailPopup()" class="profileBtn cancelBtn" >취소</button>
    </div>
   </div>
<!-- 이메일 변경 끝 -->
<!-- 전화 번호 변경  -->
    <div id="phonepopup" class="hide">
    <div class="content">
    	<p>새 전화번호:</p>
    	<input style="" class="popupInput" id="newphone" name="newphone" placeholder="000-0000-0000"><br>
   


    <button onclick="changephone()" class="profileBtn submitBtn" >변경</button>
    <button onclick="closephonePopup()" class="profileBtn cancelBtn" >취소</button>
    </div>
   </div>
<!-- 전화 번호 변경 끝 -->
</body>
<footer style="position:absolute; top:1300px; left:42%;">
      <jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>