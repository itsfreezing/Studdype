<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>

<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	.nav-container {
		display: flex;
		flex-direction:row;
		width: 100%;
		margin:0;
		padding:0;
		list-style-type:none;
		text-align:center;
		
	}
	.nav-item{
		padding: 15px;
		cursor: pointer;
		float:left;
	}
	
	ul li{
		float:left;
		padding: 15px;
		display:inline-block;
	}
	ul{
		text-align:center;
	}
	#popup {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: rgba(0, 0, 0, .7);
	  z-index: 1;
	  backdrop-filter: blur(4px);
	  -webkit-backdrop-filter: blur(4px);
	}
	#emailpopup{
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: rgba(0, 0, 0, .7);
	  z-index: 1;
	  backdrop-filter: blur(4px);
	  -webkit-backdrop-filter: blur(4px);
	}
	#phonepopup{
	 display: flex;
	  justify-content: center;
	  align-items: center;
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: rgba(0, 0, 0, .7);
	  z-index: 1;
	  backdrop-filter: blur(4px);
	  -webkit-backdrop-filter: blur(4px);
	
	}
	
	#popup.hide {
	  display: none;
	}
	#emailpopup.hide{
	  display: none;
	}
	#phonepopup.hide{
	  display: none;
	}
	
	#popup.multiple-filter {
	  backdrop-filter: blur(4px) grayscale(90%);
	  -webkit-backdrop-filter: blur(4px) grayscale(90%);
	}
	
	#emailpopup.multiple-filter {
      backdrop-filter: blur(4px) grayscale(90%);
	  -webkit-backdrop-filter: blur(4px) grayscale(90%);
	}
	#phonepopup.multiple-filter{
	  backdrop-filter: blur(4px) grayscale(90%);
	  -webkit-backdrop-filter: blur(4px) grayscale(90%);
	}
	
	#popup .content {
	  height:300px;
	  width:500px;
	  padding: 20px;
	  background: #fff;
	  border-radius: 5px;
	  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	}
	#phonepopup .content{
	  height:300px;
	  width:500px;
	  padding: 20px;
	  background: #fff;
	  border-radius: 5px;
	  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	}
	
	#emailpopup .content{
	  height:200px;
	  width:500px;
	  padding: 20px;
	  background: #fff;
	  border-radius: 5px;
	  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	}
	.owl-dot{
   background-color: black!important;
   }
   .owl-dot.active{
   background-color: #808080!important;
   }
   
   .owl-dots{
   	margin-top:25px !important; 
   }
   
</style>
<script type="text/javascript">
$(function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function(){
		var pwd1=$("#pwd1").val(); 
		var pwd2=$("#pwd2").val(); 
		if(pwd1 != "" || pwd2 != ""){
			if(pwd1 == pwd2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#submit").removeAttr("disabled"); 
				}else{ 
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled"); 
					} 
			}
		}); 
	});

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
	
	
	//내가 신청한 가입 삭제
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
  //팀장일 경우 가입신청 수락버튼
	function agree(){
		   var a = '${Appli}'
		   var e = window.event,
		   btn = e.target || e.srcElement;
		   var c = (btn.id);
		   var d = document.getElementById(c).value;
		   var f = document.getElementById(c).name;
		   
		 	alert('mem_no:'+d+"s_no:"+f);
		   if (confirm("정말 수락하시겠습니까?") == true){    //확인
			  	
		   		location.href="receiveagree.do?mem_no="+d+"&s_no="+f;
		   }else{   
			    return;
			}
			
	    }
  	
	  	function myapply(){
	  		$('#myapply').show();
	  		$('#Receive').hide();
	  		$('#meet').hide();
	  		$('#a').css("color","#808080");
	  		$('#b').css("color","white");
	  		$('#c').css("color","white");
  		
  		}
  	
  		function receive(){
  			$('#myapply').hide();
  			$('#Receive').show();
  			$('#meet').hide();
  			$('#b').css("color","#808080");
	  		$('#a').css("color","white");
	  		$('#c').css("color","white");
  		} 
	  	function meet(){
	  		$('#myapply').hide();
	  		$('#Receive').hide();
	  		$('#meet').show();
	  		$('#c').css("color","#808080");
	  		$('#b').css("color","white");
	  		$('#a').css("color","white");
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
		  popup.classList.add('hide');
		}
		function changepw(){
			var a = $('input[name=pwd2]').val();
			
			location.href="changepw.do?mem_no="+'${login.mem_no}'+"&new_pw="+a;
		}
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
			location.href="changeemail.do?mem_no="+'${login.mem_no}'+"&new_email="+a;
		}
		//회원 탈퇴
		function getout(){
			var no = '${login.mem_no}';
		if('${LeaderList}'!="[]"){
			alert('본인이 팀장인 스터디가 존재합니다. 스터디 관리를 통해 스터디 대표를 양도해주세요.');
		}else{
			if(confirm("정말 회원 탈퇴 하시겠습니까?")==true){
				location.href="memberDelete.do?mem_no="+no;
			}else{
				return;
			}
		}
	}	
		//전화번호 변경
		function showphone(multipleFilter) {
			const phonepopup = document.querySelector('#phonepopup');
		  
		  if (multipleFilter) {
		  	phonepopup.classList.add('multiple-filter');
		  } else {
		  	phonepopup.classList.remove('multiple-filter');
		  }
		  
		  phonepopup.classList.remove('hide');
		}
		function closephonePopup() {
			const emailpopup = document.querySelector('#phonepopup');
		   phonepopup.classList.add('hide');
		}
		function changephone(){
			var a = $('input[name=newphone]').val();
			//location.href="changeemail.do?mem_no="+'${login.mem_no}'+"&new_email="+a;
		}
</script>
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
 
    
    </head>
<body>
<!-- 헤더 -->
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
<!--  헤더끝 -->

<!-- 상단 정보 회원정보div -->

<div id="container"style="width:100%; height:200px; background-color:black; float:left;">
<a style="color:grey; font-size:14px; position:absolute; top:11.5%; left:25%;" onclick="getout();">회원 탈퇴</a>
	<h3 style="color:white; font-weight:bold; font-size:20px; position:absolute; top:11%; left:4%; ">My page</h3>
	<h3 style="color:white; font-weight:bold; font-size:30px; position:absolute; top:15%; left:4%;"><c:if test="${login != null }">${login.mem_name }</c:if></h3>
	<a style="color:grey; font-size:14px; position:absolute; top:18.5%; left:60%;" onclick="showphone()" >전화번호 변경</a>
	<a style="color:grey; font-size:14px; position:absolute; top:16.5%; left:12%;" onclick="showPw()" >비밀번호 변경</a>
	<a style="color:grey; font-size:14px; position:absolute; top:18.5%; left:30%;" onclick="showEmail()" >이메일 변경</a>
	<p style="color:white;font-size:20px; font-weight:bold; position:absolute; top:11%; left:20%;">회원 정보</p>
	<p style="color:white;font-size:20px; font-weight:bold; position:absolute; top:16%; left:20%;">아이디 : </p><p style="color:white;font-size:20px; font-weight:bold; position:absolute; top:16%; left:24%;">${login.mem_id }</p>
	<p style="color:white; font-size:20px; font-weight:bold; position:absolute; top:16%; left:30%;">이메일 :</p><p style="color:white;font-size:20px; font-weight:bold; position:absolute; top:16%; left:34%">${login.mem_email}</p>
	<p style="color:white; font-size:20px; font-weight:bold; position:absolute; top:16%; left:50%;">성별 : </p><p style="color:white;font-size:20px; font-weight:bold; position:absolute; top:16%; left:53%"><c:if test="${login.mem_gender == 'M'}">남자</c:if><c:if test="${login.mem_gender == 'F'}">여자</c:if></p>
	<p style="color:white; font-size:20px; font-weight:bold; position:absolute; top:16%; left:60%;">전화번호 :</p><p style="color:white; font-size:20px; font-weight:bold; position:absolute; top:16%; left:65%">${login.mem_phone }</p>
</div>
<ul class="nav-container"style="margin-left:730px; text-align:center; position:absolute; top:22%; left:1%;">
	<li class="nav-item" style="color:#808080; margin:10px; cursor:pointer " id="a" onclick="myapply();">신청 내역</li>
	<li class="nav-item" style="color:white; margin:10px; cursor:pointer" id="b" onclick="receive();">신청 받은  내역</li>
	<li class="nav-item" style="color:white; margin:10px; cursor:pointer" id="c" onclick="meet();">모임확인</li>
</ul>
<!-- 상단 div 끝 -->
<!--  스터디 신청 내역 div -->
<div style=" float:left; height:600px; width:100%; position:absolute; top:280px; "  id="myapply">
	<p style="font-size:20px; font-weight:bold; margin-left:850px; margin-top:100px;">나의 스터디 신청 내역</p>
	
	<br>
	<br>
	<br>
	<c:if test="${fn:length(applylist) != 0 }">
	<table class="table table-striped table-bordered table-hover" style="border:1px solid blac; width:70%; text-align:center; position:absolute; top:36%; left:10%; ">
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
<div style=" float:left; height:600px; width:100%; position:absolute; top:280px; display:none;" id="Receive">
	<p style="font-size:20px; font-weight:bold; margin-left:850px; margin-top:100px;">내가 받은 스터디 신청</p>
	
	<table class="table table-striped table-bordered table-hover" style=" width:70%; text-align:center; position:absolute; top:30%; left:14%; ">
	<thead>
		<tr>
			<th>스터디 이름</th>
			<th>신청한 사람</th>
			<th>수락/거절</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="receiveapplyname" items="${receiveapplyname }" varStatus="status" begin="0" end="4">
	
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
	
	<c:if test="${fn:length(Receiveapply) == 0 }">
		<p style="font-weight:bold; font-size: 30px; margin-left:42%; margin-top:9%;">받은 신청이 없습니다!</p>
	</c:if>
</div>

<!-- 신청 받은 내역 끝 -->
<!--  모임 이동 -->
<div style=" float:left; height:600px; width:100%; position:absolute; top:280px; display:none;"  id="meet">
	<p style="font-size:20px; font-weight:bold; margin-left:850px; margin-top:100px;">스터디 모임으로 이동</p>
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
   <p id="mystudyl" style="font-size:20px; font-weight:bold; position:absolute; top:94%; left:45.5%;">내가 가입한 스터디</p>
   <div id="studylistdiv" class="owl-carousel hero-slider-area" style="height:50px;  position:absolute; top:950px; ">
     <c:forEach var="studylist" items="${studylist }" varStatus="status">
     	<div class="hero-slider-info"  >
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
    <div class="alert alert-success" id="alert-success" style="position:absolute; top: 51%; left: 44%;">비밀번호가 일치합니다.</div> <div style="position:absolute; top: 51%; left: 44%;" class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>


    <button onclick="changepw()" style="position:absolute; top:58%; left:40%;" class="btn btn-purple" >변경</button>
    <button onclick="pwclosePopup()" style="position:absolute; top:58%; left:57%;" class="btn btn-purple" >취소</button>
  </div>
	

</div>
<!--  비밀 번호 변경 끝 -->
<!--  이메일 변경 -->
	<div id="emailpopup" class="hide">
    <div class="content">
    <p style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:44.7%; left:41%;" >새 이메일:</p><input style="position:absolute; top:45%; left:47%;" id="newemail" name="newemail" placeholder="000000@00000.com"><br>
   


    <button onclick="changeemail()" style="position:absolute; top:53%; left:40%;" class="btn btn-purple" >변경</button>
    <button onclick="closeemailPopup()" style="position:absolute; top:53%; left:57%;" class="btn btn-purple" >취소</button>
    </div>
	</div>
<!-- 이메일 변경 끝 -->
<!-- 전화 번호 변경  -->
    <div id="phonepopup" class="hide">
    <div class="content">
    <p style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:44.7%; left:41%;" >새 전화번호:</p><input style="position:absolute; top:45%; left:48%;" id="newphone" name="newphone" placeholder="000-0000-0000"><br>
   


    <button onclick="changephone()" style="position:absolute; top:53%; left:40%;" class="btn btn-purple" >변경</button>
    <button onclick="closephonePopup()" style="position:absolute; top:53%; left:57%;" class="btn btn-purple" >취소</button>
    </div>
	</div>
<!-- 전화 번호 변경 끝 -->
</body>
<footer style="position:absolute; top:1300px; left:42%;">
		<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>