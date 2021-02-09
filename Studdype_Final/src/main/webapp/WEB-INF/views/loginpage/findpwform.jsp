<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
   
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet" href="./resources/css/studdype/findpw.css">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<style type="text/css">
h1{
	font-weight:800;
	font-size: 30px;
	line-height: 20px;
	text-align: center;
}
.page_title{
	margin-bottom: 3%;
	margin-left: 8%;
	width: 500px;
}
#findPsw{
	width: 50px;
	height: 50px;
	margin-left: 4%;
}
#sendExtraPwForm{
	width: 800px;
	margin: auto;
	margin-right: auto;
	margin-left: auto;
	padding-top: 20px;
}
.main_div{
	margin-top: 3%;
}
#id{
	margin-left:3%;
    width:250px;
    height:40px;
    margin-bottom: 3%;
}
#email{
	margin-left:3%;
    width:250px;
    height:40px;
    margin-bottom: 3%;
}
#submit_email{
    width:50px;
    height:40px;
    margin-top: 3%;
    margin-bottom: 10%;
    border-radius: 5px;
 	background: gray;
 	color: white;
}
#submit_email:hover{
	background-color: #6E45E3;
}

#chkNum{
	margin-left:3%;
    width:250px;
    height:40px;
    margin-bottom: 5%;
}
#chkNum_btn{
    width:50px;
    height:40px;
    margin-bottom: 18%;
    margin-top: -15%;
    margin-bottom: 10%;
    border-radius: 5px;
    background: gray;
 	color: white;
}
#chkNum_btn:hover{
	background-color: #6E45E3;
}

.main_btn{
	margin-left: 13%;
	margin-top: 3%;
}
#psw_btn{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	width:200px;
	height:50px;
	border-radius:2px;
	font-size:18px;
	transition: color 0.5s;
	transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
	border-color: #3f51b5;
	-webkit-appearance:s;
    cursor: pointer;
    -webkit-writing-mode: horizontal-tb !important;
    border-width: 3px;
	color:white;
	background-color: gray;
}
#psw_btn:hover{
	background-color: #6E45E3;
}
#cancel_btn{
	width:200px;
	height:50px;
	border-radius:2px;
	font-size:18px;
	transition: color 0.5s;
	transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
	border-color: #3f51b5;
	-webkit-appearance:s;
    cursor: pointer;
    -webkit-writing-mode: horizontal-tb !important;
    border-width: 3px;
	color:white;
	background-color: gray;
}
#cancel_btn:hover{
	background-color: #6E45E3;
}

</style>

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

 <script type="text/javascript">
$(function() {
	// 해더 상단 영역 숨기기 (메뉴 넘어갈때는 이 코드 show()로 바꾸기)
	//$(".justify-content-center").hide(); 
	$(".justify-content-center").show(); 
	$(".justify-content-center").css({"background-image":"url('resources/assets/img/loginBanner2.png')","background-size":"cover"});
	$(".hero-text").html("<h1>비밀번호 찾기</h1>");
});
 
$(function(){
	
	var chkNum_btn = $("#chkNum_btn");
	
	chkNum_btn.attr('disabled', 'disabled');
});

function sendEmail(){
	var mem_id = $("#id").val();
	var mem_email = $("#email").val();
	
	if( mem_id == null || mem_id.trim() ==''){
		alert("아이디를 입력해주세요.");
	}else if( mem_email == null || mem_email.trim() ==""){
		alert("이메일을 입력해주세요.");
	}else{
		var verificationVal = {
				"mem_id":mem_id,
				"mem_email":mem_email
		};

		//인증메일 전송
		$.ajax({
			type:"post",
			url:"sendVerification.do",
			data:JSON.stringify(verificationVal),
			contentType:"application/json",
			dataType:"json",
			success: function(map){
				if(map.isExist == "n"){//이메일이 올바르지 않음
					alert("입력하신 정보와 회원 정보가 일치하지 않습니다!")
				}else{
					alert("이메일을 전송했습니다.")
					var chkNum_btn = $("#chkNum_btn");		
					var eamilInput = $("#email");
					eamilInput.attr("readonly","readonly");
					chkNum_btn.removeAttr("disabled");
					
				}
			} 
			,
			error:function(){
				alert("인증메일 전송 ajax 실패 ㅠ..");
			}
			
			
		});		
	}
}
function chkVerifiNum(){
	var input = $("#chkNum").val();
	
	var verificationVal = {
			"chk":input
	};

	//인증번호 확인
	$.ajax({
		type:"post",
		url:"chkVerification.do",
		data:JSON.stringify(verificationVal),
		contentType:"application/json",
		dataType:"json",
		success: function(map){
			if(map.isExist == "n"){//이메일이 올바르지 않음
				$("#chk_ok").hide();
				$("#chk_no").show();
				$("#chk").attr("title",'n');
			
			}else{
				$("#chk_no").hide();
				$("#chk_ok").show();
				$("#chk").attr("title",'y');
			}
		} 
		,
		error:function(){
			alert("인증번호 확인 ajax 실패 ㅠ..");
		}
		
		
	});		
}

function chkSubmit(){
	var chk = $("#chk").attr("title");
	var form = $("#sendExtraPwForm");
	
	if( chk == 'y'){
		form.submit();
	}else{
		alert("이메일 인증을 해주세요.");
	}
	
}

function cancel(){
	self.close();
}
</script>
</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	
	<div class="main_div">
	<h1 class="page_title">비밀번호 찾기</h1>
	<form action="sendExtraPw.do" method="post" id="sendExtraPwForm">
	<div>
   		<table>
   			<col width="150px"><col width="350px"><col width="100px">
   			<tr>
   				<td><label for="id" style="font-weight: 800;">아이디</label></td>
   				<td><input type="text" id="id" name="mem_id" style="border:2px solid #6E45E3"></td>
   			</tr>
   			<tr>
   				<td><label for="email" style="font-weight: 800;">이메일</label></td>
   				<td><input type="text" id="email" name="mem_email" placeholder="이메일 (email@studdype.com)" style="border:2px solid #6E45E3"></td>
   				<td><input type="button" value="전송" id="submit_email" onclick="sendEmail()"></td>
   			</tr>
   			<tr>
   				<td><label for="chkNum" style="font-weight: 800;">인증번호</label></td>
   				<td><input type="text" id="chkNum" name="chkNum" placeholder="인증번호 입력" style="border:2px solid #6E45E3"></td>
   				<td><input type="button" value="확인" id="chkNum_btn" onclick="chkVerifiNum();" ></td>
   				<input type="hidden" id="chk" title="n">
   			</tr> 
   			<tr style="display:none;" id="chk_ok">
   				<td></td>
   				<td style="color:#4075dd">인증번호가 같습니다.</td>
   			</tr>
   			<tr style="display:none;" id="chk_no">
   				<td></td>
   				<td style="color:red;">인증번호가 다릅니다.</td>
   			</tr>  	  	
   			   
   		</table>
   		
   </div>
   <div class="main_btn">
		<button type="submit" class="findform_btn" id="psw_btn" onClick="chkSubmit();">비밀번호 찾기</button>
   		<button type="submit" class="findform_btn" id="cancel_btn" onClick="cancel();">취소</button>
   </div>
   
   	</form>
   	</div>
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
	<!-- 스크립트 -->
	<script src="./resources/assets/js/popper.min.js"></script> 
	<script src="./resources/assets/js/bootstrap.min.js"></script>
	<script src="./resources/assets/js/owl.carousel.min.js"></script>
	<script src="./resources/assets/js/modal-video.js"></script>
	<script src="./resources/assets/js/loadmore.js"></script>
	<script src="./resources/assets/js/prefixfree.min.js"></script>
	<script src="./resources/assets/js/main.js"></script>

</body>
</html>