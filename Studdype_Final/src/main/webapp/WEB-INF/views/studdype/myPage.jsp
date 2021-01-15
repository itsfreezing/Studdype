<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>My Page</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
   href="./resources/assets/css/font-awesome.min.css">

<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min2.css">
  
    
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>
   <style type="text/css">
      #name{
      font-size: 20px;
      margin-left: 20px;
      margin-top: 20px;
      }
      #name2{
      font-size: 20px;
      margin-left: 100px;
      position:absolute;
      top:600px;
      }
      #id{
      font-size:20px;
      margin-left:20px;
      margin-top:20px;
      }
      #id2{
      font-size: 20px;
      margin-left: 100px;
      position:absolute;
      top:650px;
      }
      #email{
      font-size: 20px;
      margin-left: 20px;
      margin-top: 20px;
      }
      #email2{
      font-size: 20px;
      margin-left: 100px;
      position:absolute;
      top:700px;
      }
      #gender{
      font-size:20px;
      margin-left:20px;
      margin-top:20px;
      }
      #gender2{
      font-size: 20px;
      margin-left: 100px;
      position:absolute;
      top:750px;
      }
      #phone{
      font-size:20px;
      margin-left:20px;
      margin-top:20px;
      }
      #phone2{
      font-size: 20px;
      margin-left: 100px;
      position:absolute;
      top:800px;
      }
      #updateinfo{
      margin-left: 20px;
      margin-top: 20px;
      }
      #getout{
      margin-top: 20px;
      margin-left: 160px;
      }
      
      #studylist{
      margin-left:10px;
      }
  
     
	  #studylistdiv{
    
      
      width:100%;
      height:170px !important;
      }
   	#mystudyl{
   		font-size:30px;
   		color:#CC66FF;
   		font-weight:bold;
   		text-align:center;
   	}
   	.hero-slider-info{
   	margin-top:65px !important;
   	}
  	#applystatus{
  		position : relative;
  		left: 300px;
  		bottom: 40px;
  	}
  	#applyname{
  		margin-left:15px;
  	}
  	#receive{
  		margin-left:15px;
  	
  	}
  	#receivebtn{
  		position : relative;
  		left: 260px;
  		bottom: 47px;
  		margin:5px;
  		
  	}
   	
   </style>



   <script type="text/javascript">
   $(document).ready(function() {
		var owl = $('.owl-carousel');

		owl.owlCarousel({
			items : 10, // 한번에 보여줄 아이템 수
			loop : true, // 반복여부
			//margin:35,               // 오른쪽 간격
			autoplay : false, // 자동재생 여부
			autoplayTimeout : 5000, // 재생간격
			autoplayHoverPause : false
		//마우스오버시 멈출지 여부
		});

	
	});
   
   </script>
</head>

<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
   
   
   <!-- body -->
   <div style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
      <p style="text-align:center; font-weight:bold; font-size:28px;">My Studdype Profile</p>
      <p id="name">이름</p>   <p id="name2">: ${login.mem_name }</p>
      <p id="id">아이디</p><p id="id2">: ${login.mem_id }</p>
      <p id="email">이메일</p><p id="email2">: ${login.mem_email }</p>
      <p id="gender">성별</p><p id="gender2"><c:if test="${login.mem_gender == 'M' }">: 남</c:if>
                                   <c:if test="${login.mem_gender == 'F' }">: 여</c:if></p>
      <p id="phone">전화번호</p><p id="phone2">: ${login.mem_phone }</p>
      <button id="updateinfo" type="button" class="btn btn-outline-secondary" onclick="location.href='UpdateMember.do'">정보 수정</button>
      <button id="getout" type="button" class="btn btn-outline-secondary">회원 탈퇴</button>
   </div>
   <div style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
      <p style="text-align:center; font-weight:bold; font-size:28px;">Request Sent</p>
      <p style="margin-left:15px; font-size:20px;margin-top:50px; font-weight:bold;" >새로 신청한 스터디 내역</p>
      <c:forEach var="applylist" items="${applylist }"><p id="applyname">${applylist.s_name }</p></c:forEach> 
      <c:forEach var="studyApplylist" items="${studyApplylist }">
      <c:if test="${studyApplylist.agree == 'D' }"><p id="applystatus">진행중</p></c:if>
      <c:if test="${studyApplylist.agree == 'Y' }"><p id="applystatus">수락됨</p></c:if>
      <c:if test="${studyApplylist.agree == 'N' }"><p id="applystatus">거절됨</p></c:if>
      </c:forEach>
    
   </div>
   <div style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
      <p style="text-align:center; font-weight:bold; font-size:28px;">Received Request</p>
      <p style="margin-left:15px; font-size:20px;margin-top:50px; font-weight:bold;">가입 신청받은 내역</p>
      <c:forEach var="receiveapplyname" items="${receiveapplyname }">
      <p id="receive">${receiveapplyname.s_name }</p>
      </c:forEach>
      <c:forEach var="Receiveapply" items="${Receiveapply }">
       <c:if test="${Receiveapply.agree == 'D' }"><button id="receivebtn" class="btn btn-outline-secondary btn-sm">수락</button><button id="receivebtn" class="btn btn-outline-secondary btn-sm">거절</button></c:if>
     
      </c:forEach>
      
   </div>
   <div style="border:1px solid black; width:400px; height:400px; float:left ;margin:37px; border-radius: 15px;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
      <p style="text-align:center; font-weight:bold; font-size:28px;">Meeting Management</p>
      <p style="margin-left:15px; font-size:20px;margin-top:50px; font-weight:bold;">내가 가입한 스터디 모임 관리</p>
      <c:forEach var="meetlist" items="${meetlist }"><a href="meetdetail.do?meetno=${meetlist.meet_no }">${meetlist.meet_title }</a></c:forEach>
   </div>
   <p id="mystudyl">My Study List</p>
   <div id="studylistdiv" class="owl-carousel hero-slider-area" style="height:50px;">
     <c:forEach var="studylist" items="${studylist }" varStatus="status">
     	<div class="hero-slider-info"><a style="color:black; font-weight:bold; font-size:20px; margin-left:250px;"href="studycommunity.do?s_no=${studylist.s_no }">${studylist.s_name }</a></div>
     
     </c:forEach>
   </div>
      



   
</body>

<footer>
   <jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
</footer>
</html>