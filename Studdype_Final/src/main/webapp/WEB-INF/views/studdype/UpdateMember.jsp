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
       top: 175px;
       left: 1050px;
      }
      #id2{
      font-size: 20px;
      margin-left: 300px;
      position:absolute;
      top:180px;
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
      top:280px;
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
      top:330px;
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
      	margin-left: 200px;
      	margin-top: 37px;
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
      	margin-left: 200px;
      	background: #6e45e2;
		text-transform: uppercase;
		font-size: 12px;
		font-weight: 700;
		border-radius: 25px;
		padding: 14px 40px 12px;
		border: none;
		box-shadow: 0 0 15px #ddd;
		margin-top: 40px
      }
      #cancle:hover{
     	background: #fff;
		color: #9fa4af;
		text-color: #6e45e2;
		cursor: pointer;
      
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
			
			location.href="memberupdate.do?mem_id="+i+"&mem_pw="+p+"&mem_email="+e+"&mem_phone="+h+"&mem_no="+l;
			
			
		}
		
	</script>
	
</head>
<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	
	<form method="post" action="memberupdate.do">
	<div style="border:1px solid black; width:800px; height:400px; margin:37px; border-radius: 15px; margin-left:500px;
   box-shadow: 1px 1px 2px 6px #e9e9e9;">
   <p style="font-size:28px; text-align:center; font-weight:bold;">회원 정보 수정</p>
    
      <p id="id">아이디     :</p><c:if test="${mem_id == null }"><input id="id2" name="newid" value="${login.mem_id }" autocomplete="off"></c:if>
      						 <c:if test="${mem_id != null }"><input id="id2" name="newid" value="${mem_id }" autocomplete="off"></c:if> 
      <input id="chkid2" type="button" class="btn btn-outline-secondary" onclick="idchk()" value="중복확인">
      <p id="pw">비밀번호 :</p> <c:if test="${mem_pw == null}"><input id="pw2" name="newpw"value="${login.mem_pw }" autocomplete="off"></c:if>
      						 <c:if test="${mem_pw != null}"><input id="pw2" name="newpw"value="${mem_pw }" autocomplete="off"></c:if>
      <p id="email">이메일 :</p><c:if test="${mem_email == null }"><input id="email2" name="newemail" value="${login.mem_email }" autocomplete="off"></c:if> 
   							  <c:if test="${mem_email != null }"><input id="email2" name="newemail" value="${mem_email }" autocomplete="off"></c:if> 
      <p id="phone">전화번호 :</p><c:if test="${mem_phone == null }"><input id="phone2" name="newphone" value="${login.mem_phone }" autocomplete="off"></c:if>
     							<c:if test="${mem_phone != null }"><input id="phone2" name="newphone" value="${mem_phone }" autocomplete="off"></c:if>
      <button id="updatemember" type="button" class="btn btn-outline-secondary" onclick="complete()">수정 완료</button>
      <button id="cancle" type="button" class="btn btn-outline-secondary" onclick="location.href='myPage.do'">취소</button>
  	 </div>
	</form>
	
	
</body>
<footer>
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>