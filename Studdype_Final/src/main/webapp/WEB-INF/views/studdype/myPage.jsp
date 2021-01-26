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
  
  	
  	#receive{
  		margin-left:15px;
  	
  	}
  	#receivebtn{
  		position : relative;
  		left: 260px;
  		bottom: 47px;
  		margin:5px;
  		
  	}
  	#applystatusagree{
  		position : relative;
  		left: 300px;
  		bottom: 80px;
  		display: inline-block;
  		color: green;
  	}
  	#applystatusreject{
  		position : relative;
  		left: 300px;
  		bottom: 80px;
  		display: inline-block;
  		color: red;
  	}
  	
   	
   </style>



   <script type="text/javascript">
	
   //스터디 리스트 배너 
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

 
	 
  	//회원 탈퇴 버튼 클릭시 
	function getout(){
  		var no = '${login.mem_no}';
		if('${LeaderList}'!="[]"){
			alert('본인이 팀장인 스터디가 존재합니다. 스터디 대표를 양도해주세요.');
		}else{
			if(confirm("정말 회원 탈퇴 하시겠습니까?")==true){
				location.href="memberDelete.do?mem_no="+no;
			}else{
				return;
			}
		}
	}
  	//팀장일 경우 가입신청 수락버튼
	function agree(){
		   var a = '${Appli}'
		   var e = window.event,
		   btn = e.target || e.srcElement;
		   var c = (btn.id);
		   var d = document.getElementById(c).value;
		   var f = document.getElementById(c).name;
		   
		 
		   if (confirm("정말 수락하시겠습니까?") == true){    //확인
			  	
		   		location.href="receiveagree.do?mem_no="+d+"&s_no="+f;
		   }else{   
			    return;
			}
			
	   }
  	//팀장일 경우 가입 신청 거절버튼
  	function reject(){
  		 var a = '${Appli}'
  		   var e = window.event,
  		   btn = e.target || e.srcElement;
  		   var c = (btn.id);
  		   var d = document.getElementById(c).value;
  		   var f = document.getElementById(c).name;
  		   
  		   if(confirm("정말 거절하시겠습니까?") == true){
  			   location.href="receivereject.do?mem_no="+d+"&s_no="+f;
  		   }else{
  			   return;
  		   }
  	} 
  	//가입 신청 삭제 버튼 
  	function receivedelete(){
  		var a = '${Appli}'
  		var e = window.event,
  		btn = e.target || e.srcElement;
  		var c= (btn.id);
  		var d = document.getElementById(c).value;
  		var f = document.getElementById(c).name;
  		
  		
  		if(confirm("정말 삭제하시겠습니까?")==true){
  			location.href="receivedelete.do?mem_no="+d+"&s_no="+f;
  		}else{
  			return;
  		}
  		
  		
  	}
  
 

   </script>
</head>

<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
   
   
   <!-- body -->
   <!--  회원 정보          -->
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
      <button id="getout" type="button" class="btn btn-outline-secondary" onclick="getout();">회원 탈퇴</button>
   </div>
   
   
   
   <!--  내가 가입 신청한 내역                     -->
   <div class="newjoin" style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
      <p style="text-align:center; font-weight:bold; font-size:28px;">Request Sent</p>
      <p style="margin-left:15px; font-size:20px;margin-top:50px; font-weight:bold;" >새로 신청한 스터디 내역</p>

      <c:forEach var="applylist" items="${applylist }"><p id="applyname" style="position:relative; display:inline-block; margin-left:15px;">${applylist.s_name }</p></c:forEach> 
      <c:forEach var="studyApplylist" items="${studyApplylist }" varStatus="status">
      <c:if test="${studyApplylist.agree == 'D' }"><p id="applystatus" style="position : relative; display: inline-block; margin-left:120px;">진행중</p>
      <button id="delete${status.count }" value="${studyApplylist.mem_no }" name="${studyApplylist.s_no }" class="btn btn-outline-secondary btn-sm" onclick="receivedelete();" style="position : relative; display: inline-block; margin-left:40px;">삭제</button><br></c:if>
      <c:if test="${studyApplylist.agree == 'Y' }"><p id="applystatusagree" style="position : relative; display: inline-block;  margin-left:120px; color:green;">수락됨</p>
      <button id="delete${status.count }" value="${studyApplylist.mem_no }" name="${studyApplylist.s_no }" class="btn btn-outline-secondary btn-sm" onclick="receivedelete();" style="position : relative; display: inline-block; margin-left:40px;">삭제</button><br></c:if>
      <c:if test="${studyApplylist.agree == 'N' }"><p id="applystatusreject" style="position : relative; display: inline-block;  margin-left:120px; color:red;">거절됨</p>
      <button id="delete${status.count }" value="${studyApplylist.mem_no }" name="${studyApplylist.s_no }" class="btn btn-outline-secondary btn-sm" onclick="receivedelete();" style="position : relative; display: inline-block; margin-left:40px;">삭제</button><br></c:if>
      </c:forEach>
  
   </div>
   
   
   
   <!-- 가입 신청 받은 내역                -->
   <div style="border:1px solid black; width:400px; height:400px; float:left; margin:37px; border-radius: 15px; position: relative;, display:inline-block;
   box-shadow: 1px 1px 2px 6px #e9e9e9;" >
      <p style="text-align:center; font-weight:bold; font-size:28px;">Received Request</p>
      <p style="margin-left:15px; font-size:20px;margin-top:50px; font-weight:bold;">가입 신청받은 내역</p>
      <c:forEach var="receiveapplyname" items="${receiveapplyname }">
      <c:forEach var="Receiveapply" items="${Receiveapply }">
      <c:if test="${Receiveapply.agree == 'D' }"><p id="receive" style="position:relative; display:inline-block; margin-left:15px;">${receiveapplyname.s_name }</p></c:if>
      </c:forEach>
      </c:forEach>
      <c:forEach var="Receiveapply" items="${Receiveapply }" varStatus="status">
       <c:if test="${Receiveapply.agree == 'D' }">
       <button id="agree${status.count }" value="${Receiveapply.mem_no }" name="${Receiveapply.s_no }"class="btn btn-outline-secondary btn-sm" onclick="agree();" style="position:relative; display:inline-block; margin-left:150px;">수락</button>
    
       <button  class="btn btn-outline-secondary btn-sm" id="reject${status.count }" value="${Receiveapply.mem_no}" name="${Receiveapply.s_no }"onclick="reject();" >거절</button>
       </c:if>
     
      </c:forEach>
      
   </div>
   <!--  모임 관리    -->
   <div style="border:1px solid black; width:400px; height:400px; float:left ;margin:37px; border-radius: 15px;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
      <p style="text-align:center; font-weight:bold; font-size:28px;">Meeting Management</p>
      <p style="margin-left:15px; font-size:20px;margin-top:50px; font-weight:bold;">내가 가입한 스터디 모임 관리</p>
      

      
     <c:forEach var="i" begin="0" end="${pageList.size()-1}" step="1">
     		<p>${pageList.get(i).getS_no()}</p>
	</c:forEach>
      <c:if test="${not empty pageList}">
     <c:forEach var="pageList" items="${pageList}">
     		<p>${pageList.getS_no() }</p>

     </c:forEach>
     </c:if>
     
     
    
   </div>
   <!--  내가 가입한 스터디 리스트     -->
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