<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
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
<script src="./resources/assets/js/myPageScript.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	// 헤더 빈영역 가려주기 (2021.02.11 [박기민] 추가)
	$(".justify-content-center").hide();
	
	// Header의 프로필 메뉴에 하위 메뉴들은 href에 #를 가지고 있다.
	// ex) myPage.do#hashTag
	// command 뒤에 붙는 #의 값을 strHash변수에 넣어준다.
	var strHash = document.location.hash;
	
	// 프로필의 하위 메뉴 (dropdown-item 클래스를 가진 a태그)를 클릭했을 때
	$("a.dropdown-item").click(function(){
		var id = $(this).attr("id"); // 클릭 된 a태그의 아이디값을 가지고 온다.
		
		if ( id == "create" ){ // 스터디 생성을 클릭했을때
			return "location.href='createStuddypeform.do'"
			
		} else { // 마이페이지 tab 메뉴가 아닌 프로필의 하위메뉴를 클릭했을 때
			$("ul.nav-items li").removeClass("active"); 
		    $("ul.nav-items li#"+id).addClass("active");
		    $(".tab_content").hide();
			
		    $("div#"+id).fadeIn();
		    
		    return false;
		}
		
	});
	
	// 마이페이지의 tab메뉴를 클릭했을 때
 $("ul.nav-items li").click(function() {
	    $("ul.nav-items li").removeClass("active"); 
	    $(this).addClass("active"); 
	    $(".tab_content").hide();
		
	    $("div"+$(this).find("a").attr("href")).fadeIn(); 
	    
	    return false;
	});
	
	// 프로필의 마이페이지 하위 메뉴가 아닌 Header의 마이페이지 메뉴로 페이지를 로드했을(#값이 없을) 때
 if ( strHash == "" || strHash == null ) {
 	$(".tab_content").hide(); 
     $("ul.nav-items li:first").addClass("active");

     $(".tab_content:first").show(); 
     
     
 // 프로필의 마이페이지 하위 메뉴로 페이지를 로드했을 때     
 } else {
 	$(".tab_content").hide(); 
     $("ul.nav-items li"+strHash).addClass("active");
     $("div"+strHash).show();
     
     return false;
 }
 


 var owl = $('.owl-carousel');

	owl.owlCarousel({
		items : 1, // 한번에 보여줄 아이템 수
		loop : false, // 반복여부
	});

	$('.customNextBtn').click(function() {
		owl.trigger('next.owl.carousel');
	})

	$('.customPrevBtn').click(function() {
		owl.trigger('prev.owl.carousel', [ 300 ]);
	})



 	 


});
 	//이메일 변경
function showEmail(multipleFilter) {
    
	const emailpopup = document.querySelector('#emailpopup');
	    
	    if (multipleFilter) {
	       emailpopup.classList.add('multiple-filter');
	    } else {
	       emailpopup.classList.remove('multiple-filter');
	    }
	    
	    emailpopup.classList.remove('hide');
	}

	function closeemailPopup() {
		const emailpopup = document.querySelector('#emailpopup');
		emailpopup.classList.add('hide');
	}
	     
	function changeemail(){
		var a = $('input[name=newemail]').val();
		var b = '${login.mem_no}';
		
		
		location.href="changeemail.do?mem_no="+b+"&new_email="+a;

	}
	
	//비밀번호 변경
	function showPw(multipleFilter) {
		
		const popup = document.querySelector('#popup');
	    
		if (multipleFilter) {
	       popup.classList.add('multiple-filter');
	    } else {
	       popup.classList.remove('multiple-filter');
	    }
	    
		popup.classList.remove('hide');
	}

	function pwclosePopup() {
		const popup = document.querySelector('#popup');
		 document.getElementById("pw").value ='';
		 document.getElementById("pwd1").value ='';
		 document.getElementById("pwd2").value ='';
		 $("#alert-success").hide();
		 $("#alert-danger").hide();
	    popup.classList.add('hide');
	}

	function changepw(){
		var p2 = $('input[name=pwd2]').val();
		var p1 = $('input[name=pwd1]').val();
		var p3 = $('input[name=pw]').val();
		var p4 = '${login.mem_pw}';
		
		if(p3 == p4){
			if(p1==p2){
			location.href="changepw.do?mem_no="+'${login.mem_no}'+"&new_pw="+p2;
			}else{
				alert("새 비밀번호가 서로 다릅니다!");
			}
			}else{
			alert("현재 비밀번호를 제대로 입력해주세요!");
		}
		
	}
	
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
      <li class="my-nav-item" id="myApply"><a href="#myApply">신청 내역</a></li>
      <li class="my-nav-item" id="applyList"><a href="#applyList">신청받은 내역</a></li>
      <li class="my-nav-item" id="myMeet"><a href="#myMeet">모임확인</a></li>
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
   <table class="table table-hover" style="width: 70%; text-align: center; position: absolute; top: 13%; left: 14%; ">
   <thead>
   <tr style="background-color:black; color:white;"> 
      <th style="position:sticky;top:0px; background-color:black;">내가 신청한 스터디 이름</th>
      <th style="position:sticky;top:0px; background-color:black;">나의 신청 상태</th>
      <th style="position:sticky;top:0px; background-color:black;">내 신청 삭제</th>
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
         <td><button id="delete${status.count }" value="${studyApplylist.mem_no }"name="${studyApplylist.s_no }" class="btn btn-purple" onclick="receivedelete();">삭제</button></td>                        
      </tr>
      
      </c:if>
      </c:forEach>
      </c:forEach>
   
   
   
   </tbody>
   </table>
   </c:if>
   <c:if test="${fn:length(applylist) == 0 }">
      <img  src="resources/img/no_study.png" style="height:200px; margin-left:42%; position:absolute; top:16%;" >
      <a  style="font-weight:bold; font-size: 20px; margin-left:5%; position:absolute; left:31.3%; top:54%; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입 신청한 스터디가없습니다.</a>
   
   
   </c:if>
    

</div>
<!-- 스터디 신청내역 끝 -->

<!--  신청 받은 내역 -->
<div class="tab_content" id="applyList">
   <p style="   display: inline;
    font-size: 20px;
    font-weight: bold;
    position: absolute;
    top: 3%;
    left: 43%;">내가 받은 스터디 신청</p>
   <div style="height:402px; width:70%; position:absolute; top:15%; left:12%; overflow:auto; border-radius:4px;" id="scroll">
   <table class="table table-hover" style="  text-align:center; ">
   <thead>
      <tr style="background-color:black; color:white;">
         <th style="position:sticky;top:0px; background-color:black;">스터디 이름</th>
         <th style="position:sticky;top:0px; background-color:black;">신청한 사람</th>
         <th style="position:sticky;top:0px; background-color:black;">수락/거절</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="receiveapplyname" items="${receiveapplyname }" varStatus="status">
      <c:if test="${Receiveapply[status.index].agree == 'D' }">
         <tr>
            <c:if test="${Receiveapply[status.index].agree == 'D' }"><td id="receive">${receiveapplyname.s_name }</td></c:if>
            <td>${applymember[status.index].mem_name }</td>
            <td>
            <button id="agree${status.count }" value="${Receiveapply[status.index].mem_no }" name="${Receiveapply[status.index].s_no }" class="btn btn-purple" onclick="agree();">수락</button>
            <button id="reject${status.count }" value="${Receiveapply[status.index].mem_no }" name="${Receiveapply[status.index].s_no }" class="btn btn-purple" onclick="reject();" >거절</button>
            </td>
         
         
         </tr>
      </c:if>
      </c:forEach>
   
   </tbody>
   
   </table>
   
   <c:if test="${fn:length(applylist) == 0 }">
      <p style="font-weight: bold; font-size: 30px; margin-left: 41%; margin-top: 6%;">받은 신청이 없습니다!</p>
   </c:if>
   </div>
</div>

<!-- 신청 받은 내역 끝 -->
<!--  모임 이동 -->

<div class="tab_content" id="myMeet">
   <p style=" display: inline;
    font-size: 20px;
    font-weight: bold;
    position: absolute;
    top: 3%;
    left: 44%;">스터디 모임으로 이동</p>
    <div style="height:402px; width:70%; position:absolute; top:15%; left:14%; overflow:auto; border-radius:4px;" id="scroll">
   <table class="table table-hover" style=" position: absolute; top: -1px; text-align:center; ">
   <thead>
      <tr style="background-color:black; color:white; ">
         <th style="position:sticky;top:0px; background-color:black;">스터디 이름</th>
         <th style="position:sticky;top:0px; background-color:black;">모임이름</th>
         <th style="position:sticky;top:0px; background-color:black;">모임날짜</th>
         <th style="position:sticky;top:0px; background-color:black;">투표마감일</th>
         <th style="position:sticky;top:0px; background-color:black;">확인하기</th>
         
      </tr>
   </thead>
   <tbody>
    
      <c:if test="${not empty meetlist}">
      <c:forEach var="meetlist" items="${meetlist }" varStatus="status">
      <jsp:useBean id="now" class="java.util.Date" />
	  <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />

      <fmt:parseDate value='${ meetlist.meet_date }' var='meet_date' pattern="yyyy-MM-dd HH:mm:ss"/>
	  <c:if test="${meetlist.meet_date > today }">
      <tr>
         <td><c:if test="${nameMap.containsKey(meetlist.s_no) = true }">${nameMap.get(meetlist.s_no) }</c:if></td>
         <td>${meetlist.meet_title }</td>
         <td>
		 <fmt:formatDate value="${ meet_date }" pattern="YYYY'년'MM'월'dd'일'"/>
    	 </td>
    	 <td>
    	 <fmt:parseDate value='${ meetlist.vote_enddate }' var='vote_enddate' pattern="yyyy-MM-dd HH:mm:ss"/>
		 <fmt:formatDate value="${ vote_enddate }" pattern="YYYY'년'MM'월'dd'일'"/>
    	 </td>
         <td><button  class="btn btn-purple" onclick="location.href='meetdetail.do?meetno=${meetlist.meet_no}'">확인하기</button></td>
        
      </tr>
      </c:if>
      <c:if test="${status.count < 1 }">
   	  <p style="font-weight: bold;font-size: 30px;margin-left: 42%;margin-top: 9.5%;">모임이 없습니다!</p>
   	  </c:if> 
	 </c:forEach>
      </c:if>
     
   	  
   	   
   </tbody>
   
   </table>



	</div>

</div>
<!-- 모임 이동 끝 -->



<!--  내가 가입한 스터디 리스트     -->
   <c:if test="${fn:length(studylist) != 0 }">
   <p id="mystudyl" style="font-size:20px; font-weight:bold; position:absolute; top:94%; left:7%; display:inline; ">내가 가입한 스터디</p><p style="display:inline; position: absolute; top: 919px; font-size: 12px; left: 313px; cursor:pointer; color: gray;" onclick="studypopup();">스터디 전체 보기</p>

   <div id="studylistdiv" class="owl-carousel hero-slider-area" style="height:50px;  position:absolute; top:950px; ">
     <c:forEach var="studylist" items="${studylist }" varStatus="status">
        <div class="hero-slider-info">
        <div style="height:130px; width:400px;  background-color:white; border:1px solid grey; margin-left:118px; cursor:pointer;  box-shadow: 3px 3px grey;" onclick="location.href='studycommunity.do?s_no=${studylist.s_no }'">
        <div style="height:129px; float:right; background-color:grey; width:147px;"><img style="height:128px; width:147px;" src="${studylist.photo }" onError="this.src='./resources/assets/img/img_study1.png'" ></div>
        <p style="color:black !important;  margin-left:20px;font-size:10px; font-weight:bold; display:inline;position: absolute; margin-top: 22px;">
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
        <p style="color:black !important; margin-left:10px;font-size:10px; font-weight:bold; display:inline; position: absolute;top: 63px; left: 156px;" >
        <c:if test="${studylist.cate_no == 1 }">IT</c:if>
        <c:if test="${studylist.cate_no == 2 }">자격증</c:if>
        <c:if test="${studylist.cate_no == 3 }">공무원</c:if>
        <c:if test="${studylist.cate_no == 4 }">뷰티</c:if>
        <c:if test="${studylist.cate_no == 5 }">대입/수능</c:if>
        <c:if test="${studylist.cate_no == 6 }">어학/회화</c:if>
        <c:if test="${studylist.cate_no == 7 }">취업스터디</c:if>
        <c:if test="${studylist.cate_no == 8 }">기타</c:if>
        </p>
        <a style="color:black; font-weight:bold; margin-left:20px; font-size:20px;  display:block; position: absolute;top: 91px;">${studylist.s_name }</a>
        <c:forEach var="allMember" items="${allMember }">
        <c:if test="${studylist.leader_no == allMember.mem_no }">
        <p style="color:black !important; margin-left:20px; font-size:10px; font-weight:bold; display:inline; position: absolute;top: 136px;">팀장: ${allMember.mem_name }</p>
        </c:if>
        </c:forEach>
        <p style="color:black !important; font-size:10px; font-weight:bold;display:inline;margin-left: 124px; position: absolute; top: 136px;">최대 :${studylist.s_maxcnt }명</p>
        </div>
        </div>
     	
     </c:forEach>
 	
   </div>
   
  
  <!-- prev/next 버튼 -->
   <div class="customNextBtn" style="height:20px; width:20px; position: absolute; top: 1152px;  left: 58%; z-index:1;"><img src="./resources/img/next-allow.png" style=" overflow: hidden; display: flex; align-items: center; justify-content: center; height:20px; width:20px; position: absolute;
    top: -100px;
    left: 720px"></div>
   <div class="customPrevBtn" style="height:20px; width:20px; z-index:1;"><img src="./resources/img/pre-allow.png" style="overlfow:hidden; display:flex; align-items:center; justify-content: center; height:20px; width:20px; position:absolute; top: -100px;  left: -700px;"></div>
   </c:if>
   <c:if test="${fn:length(studylist) == 0 }">
      <p id="mystudyl" style="font-size:20px; font-weight:bold; position:absolute; top:94%; left:7%; ">내가 가입한 스터디</p>
      <p id="mystudyl" style="font-size:20px; font-weight:bold; position:absolute; top:102%; left:41.5%;">가입한 스터디가 없습니다!</p>
   
   </c:if>
<!--  내가 가입한 스터디 리스트 끝 -->
<!--  비밀번호 변경    -->
<div id="popup" class="hide">
  <div class="content">
  	<p style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:36.7%; left:47%;" >비밀번호 변경</p>
  	<p style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:40.7%; left:41%;" >현재 비밀번호:</p><input style="position:absolute; top:41%; left:51%;" id="pw" name="pw" type="password"><br>
    <p style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:44.7%; left:41%;" >새 비밀번호:</p><input style="position:absolute; top:45%; left:51%;" id="pwd1" name="pwd1"  type="password"><br>
    <a style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:49%; left:41%;">비밀번호 확인:</a><input style="display:inline; position:absolute;top:49%; left:51%;" id="pwd2" name="pwd2"  type="password">
    <div class="alert alert-success" id="alert-success" style="position:absolute; top: 54%; left: 41%;width: 349px;">비밀번호가 일치합니다.</div> <div style="position:absolute; top: 54%; left: 41%; width: 349px;" class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
    <p style="position:absolute; top:54%;left:41%; color:red; " id="aaaaa" >비밀번호를 잘생각해서 변경해 주세요!</p>


    <button onclick="changepw()"  class="profileBtn submitBtnPW" >변경</button>
    <button onclick="pwclosePopup()"  class="profileBtn cancelBtnPW" >취소</button>
  </div>
   

</div>
<!--  비밀 번호 변경 끝 -->
<!--  이메일 변경 -->
   <div id="emailpopup" class="hide">
    <div class="content">
     <p style="font-size:20px; font-weight:bold; position:absolute; top:41%; left:47%;">이메일 변경 </p>
    <p style="font-size:20px; font-weight:bold; position:absolute; top:47%; left:41%;">새 이메일:</p>    <input class="popupInput" id="newemail" name="newemail" autocomplete="off" value="${login.mem_email }"><br>
    <button onclick="changeemail()" class="profileBtn submitBtn" >변경</button>
    <button onclick="closeemailPopup()" class="profileBtn cancelBtn" >취소</button>
    </div>
   </div>
<!-- 이메일 변경 끝 -->
<!-- 전화 번호 변경  -->
    <div id="phonepopup" class="hide">
    <div class="content">
        <p style="font-size:20px; font-weight:bold; position:absolute; top:39%; left:46%;">전화번호 변경</p>
       <p style="font-size:20px; font-weight:bold; position:absolute; top:47%; left:41%;">새 전화번호:</p>
       <input style="" class="popupInput" id="newphone" name="newphone" autocomplete="off" value="${login.mem_phone }"><br>
   


    <button onclick="changephone()" class="profileBtn submitBtn" >변경</button>
    <button onclick="closephonePopup()" class="profileBtn cancelBtn" >취소</button>
    </div>
   </div>
<!-- 전화 번호 변경 끝 -->
<!--  스터디 리스트 모달 -->
	<div id="studypopup" class="hide">
    <div class="content">
    	<p style="font-weight: bold; position: absolute; top: 272px; left: 880px; font-size: 18px; ">내 전체 스터디 목록</p>
    	<p style="position: absolute;top: 302px;left: 689px; color:red;">*본인이 리더인 스터디의 경우 빨간색으로 표시됩니다</p>
       <div style="height: 300px; width: 28%; position: absolute; top: 34%; left: 36%; overflow:auto;" id="allstudy">
       		<table id="studyall" style="height:500px; width:511px; text-align:center;" class="table table-hover">
       			<thead>
       				<tr>
       					<th style="position:sticky;top:0px; background-color:white;">스터디 이름</th>
       					<th style="position:sticky;top:0px; background-color:white;">이동하기</th>
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
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<input style="display:none;" name="mem_no" value="${login.mem_no }">
</body>
<footer style="position:absolute; top:1300px; left:42%;">
      <jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>