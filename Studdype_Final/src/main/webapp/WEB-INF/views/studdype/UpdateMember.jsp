<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
      #id{
      font-size:20px;
      margin-left:170px;
      margin-top:20px;
      }
      #chkid2{
       position:absolute;
       top: 57px;
       left: 571px;
      }
      #id2{
      font-size: 20px;
      margin-left: 300px;
      position:absolute;
      top:62px;
      }
      #email{
      font-size: 20px;
      margin-left: 170px;
      margin-top: 20px;
      }
      #email2{
      font-size: 20px;
      margin-left: 300px;
      position:absolute;
      top:112px;
      }
      #gender{
      font-size:20px;
      margin-left:170px;
      margin-top:20px;
      }
      #gender2{
      font-size: 20px;
      margin-left: 300px;
      position:absolute;
      top:700px;
      }
      #phone{
      font-size:20px;
      margin-left:170px;
      margin-top:20px;
      }
      #phone2{
      font-size: 20px;
      margin-left: 300px;
      position:absolute;
      top:163px;
      }
      #pw{
       font-size: 20px;
      margin-left: 170px;
      margin-top: 20px;
      }
      #pw2{
      font-size: 20px;
      margin-left: 300px;
      position:absolute;
      top:230px;
      }
      #updatemember{
     	position:absolute;
     	top:61%;
     	left:43%;
      	background: #6e45e2;
      	text-transform: uppercase;
      	font-size: 12px;
		font-weight: 700;
		border-radius: 25px;
		padding: 14px 40px 12px;
		border: none;
		box-shadow: 0 0 15px #ddd;
      
      }
      #updatemember:hover{
      	background: #fff;
		color: #9fa4af;
		text-color: #6e45e2;
		cursor: pointer;
      }
      #cancle{
    	position:absolute;
    	top:61%;
    	left:69%;
      	background: #6e45e2;
		text-transform: uppercase;
		font-size: 12px;
		font-weight: 700;
		border-radius: 25px;
		padding: 14px 40px 12px;
		border: none;
		box-shadow: 0 0 15px #ddd;
		
      }
      #cancle:hover{
     	background: #fff;
		color: #9fa4af;
		text-color: #6e45e2;
		cursor: pointer;
      
      }
       #newpw{
      	position:absolute;
      	top:61%;
      	left:14%;
      	background: #6e45e2;
      	text-transform: uppercase;
      	font-size: 12px;
		font-weight: 700;
		border-radius: 25px;
		padding: 14px 40px 12px;
		border: none;
		box-shadow: 0 0 15px #ddd;
      
      }
      #newpw:hover{
      	background: #fff;
		color: #9fa4af;
		text-color: #6e45e2;
		cursor: pointer;
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
	
	#popup.hide {
	  display: none;
	}
	
	#popup.multiple-filter {
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
	#main {
	float: right;
	display: inline-block;
	margin-right: 5%;
	margin-top: 3%;
	width: 70%;
	
	border-radius: 10px;
	height:700px;
}
		
	</style>
	<script type="text/javascript">
	$(function() {
		// 해더 상단 영역 숨기기 (메뉴 넘어갈때는 이 코드 show()로 바꾸기)
		$(".justify-content-center").hide(); 
		$(".justify-content-center").css({"background":"black"}); 
	})
	
		var z;
		function idchk(){
			 var i = $('input[name=newid]').val();
			 var p = $('input[name=newpw]').val();
			 var e = $('input[name=newemail]').val();
			 var h = $('input[name=newphone]').val();
			 
			 location.href="idchk.do?mem_id="+i+"&mem_pw="+p+"&mem_email="+e+"&mem_phone="+h;
			
			
		}
		function complete(){
		
			
			var i = $('input[name=newid]').val();
			var p = $('input[name=newpw]').val();
			var e = $('input[name=newemail]').val();
			var h = $('input[name=newphone]').val();
			
			var l = '${login.mem_no}';
			
			location.href="memberupdate.do?mem_id="+i+"&mem_email="+e+"&mem_phone="+h+"&mem_no="+l;
			
			
		}
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
		
		function showPopup(multipleFilter) {
			const popup = document.querySelector('#popup');
		  
		  if (multipleFilter) {
		  	popup.classList.add('multiple-filter');
		  } else {
		  	popup.classList.remove('multiple-filter');
		  }
		  
		  popup.classList.remove('hide');
		}

		function closePopup() {
			const popup = document.querySelector('#popup');
		  popup.classList.add('hide');
		}
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

		
	  
	</script>
	
</head>
<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	<div id="main">
	<form method="post" action="memberupdate.do">
	<div style="border:1px solid black; width:800px; height:400px;  border-radius: 15px;  position:absolute; top:25%; left:29%;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
   <p style="font-size:28px; text-align:center; font-weight:bold;">회원 정보 수정</p>
    
      <p id="id">아이디     :</p><c:if test="${mem_id == null }"><input id="id2" name="newid" value="${login.mem_id }" autocomplete="off"></c:if>
      						 <c:if test="${mem_id != null }"><input id="id2" name="newid" value="${mem_id }" autocomplete="off"></c:if> 
      <input id="chkid2" type="button" class="btn btn-outline-secondary" onclick="idchk()" value="중복확인">
      <p id="email">이메일 :</p><c:if test="${mem_email == null }"><input id="email2" name="newemail" value="${login.mem_email }" autocomplete="off"></c:if> 
   							  <c:if test="${mem_email != null }"><input id="email2" name="newemail" value="${mem_email }" autocomplete="off"></c:if> 
      <p id="phone">전화번호 :</p><c:if test="${mem_phone == null }"><input id="phone2" name="newphone" value="${login.mem_phone }" autocomplete="off"></c:if>
     							<c:if test="${mem_phone != null }"><input id="phone2" name="newphone" value="${mem_phone }" autocomplete="off"></c:if>
      <button id="updatemember" type="button" class="btn btn-outline-purple" onclick="complete()">수정 완료</button>
   	   <button id="newpw" type="button" class="btn btn-outline-purple" onclick="showPopup()">비밀번호 변경</button>
      <button id="cancle" type="button" class="btn btn-outline-purple" onclick="location.href='myPage.do'">취소</button>
   
  	 </div>
	</form>
	
	<div id="popup" class="hide">
  <div class="content">
    <p style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:38.7%; left:41%;" >새 비밀번호:</p><input style="position:absolute; top:39%; left:48%;" id="pwd1" type='password'><br>
    <a style="display:inline; font-size:20px; font-weight:bold; position:absolute; top:46%; left:41%;">비밀번호 확인:</a><input style="display:inline; position:absolute;top:46%; left:48%;" id="pwd2" type='password'>
    <div class="alert alert-success" id="alert-success" style="position:absolute; top: 51%; left: 44%;">비밀번호가 일치합니다.</div> <div style="position:absolute; top: 51%; left: 44%;" class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>


    <button onclick="closePopup()" style="position:absolute; top:58%; left:40%;" class="btn btn-purple" >변경</button>
    <button onclick="closePopup()" style="position:absolute; top:58%; left:57%;" class="btn btn-purple" >취소</button>
  </div>
	

</div>
</div>
</body>

<footer>
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>