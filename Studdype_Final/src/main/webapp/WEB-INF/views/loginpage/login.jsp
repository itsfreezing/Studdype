<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
   
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<style type="text/css">
.mainmenu li.active:not(:last-child):after,
.mainmenu li:not(:last-child):hover:after { 
	background: #fff;
}ss
h1{
	margin-top: 3%;
	font-weight:600;
	font-size: 30px;
	line-height: 20px;
	text-align: center;
}
span{
	color:white;
	font-size: 20px;
}
#main_span{
	font-size: 20px;
	color:white;
}
#loginLogo{
	width: 50px;
	height: 50px;
	margin-left: 2%;
	margin-bottom: 1%;
}
.main{
	width: 800px;
	margin: auto;
	margin-right: auto;
	margin-left: auto;
}
.loginForm{
	margin: auto;
	margin-right: auto;
	margin-left: auto;
	margin-top: 3%;
	margin-bottom: 10%;
}
.loginTable{
	margin: auto;
	margin-right: auto;
	margin-left: auto;
}
#id{
	margin-bottom:5%;
    width:300px;
    height:50px;
    border: 1px solid #A6A6A6;
}
#id:hover{
	border: 2px solid #6434ef;
}
#pw{
	margin-bottom:10%;
    width:300px;
    height:50px;
    border: 1px solid #A6A6A6;
}
#pw:hover{
	border: 2px solid #6434ef;
}
#login{
	width:300px;
	height:50px;
	border-radius:2px;
	font-size:18px;
	transition: color 0.5s;
	transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
	border: 1px solid #A6A6A6;
	-webkit-appearance:s;
    cursor: pointer;
    -webkit-writing-mode: horizontal-tb !important;
 	color: white;
 	background-color: white;
 	box-shadow: none;
 	color: black;
 	padding: 1%;
}
#login:hover{
	background-color: white;
	border: 2px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;
}
#signUp{
	width:300px;
	height:50px;
	color: #aaa;
}
#findId{
	color: #aaa;
}
#findPw{
	color: #aaa;
}
.findSection{
    margin-left:32.5%;
    font-weight: 800;
}
.mainBtn{
	margin-left: 31%;
}
.footer-menu{
	margin-bottom: -10%;
}
</style>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 해더 상단 영역 숨기기 (메뉴 넘어갈때는 이 코드 show()로 바꾸기)
		//$(".justify-content-center").hide(); 
		$(".justify-content-center").show(); 
		$(".justify-content-center").css({"background-image":"url('resources/assets/img/loginBanner2.png')","background-size":"cover"});
		$(".hero-text").html("<h1>로그인</h1><br><span>회원가입 후 StuDdye의 다양한 콘텐츠를 이용해보세요.</span>");
	});
	
function login_btn(){
	var form = $(".loginForm");
	var mem_id = $("#id");
	var mem_pw = $("#pw");
	
	if ( mem_id.val() == null || mem_id.val().trim() == ''){
		alert("아이디를 확인해 주세요.");
		return false;
		
	}else if ( mem_pw.val() == null || mem_pw.val().trim() == '' ){
		alert("비밀번호를 확인해 주세요.");
		return false;
		
	}else {
		form.submit();
	}
};

</script>
</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	<div class="main">
    <form class="loginForm" action="login.do" method="POST">
    	<table class="loginTable">
       		<tr>
            	<td>
            	<input type="text" name="mem_id" id="id" placeholder=" 아이디를 입력해주세요" autofocus="autofocus">
            	</td>
          	</tr>
          	<tr>
             	<td>
                <input type="password" name="mem_pw" id="pw" placeholder=" 비밀번호를 입력해주세요">
             	</td>
          	</tr>
       		<br>
   		</table>
   		<div class="findSection">
   		<a href="findIdForm.do" id="findId" onClick="loginpage/findId">아이디 찾기  |  </a>
   		<a href="findpwform.do" id="findPw" onClick="loginpage/findpwform">비밀번호 찾기   |  </a>
   		<a href="signform.do" id="signUp" onClick="loginpage/signup">회원가입</a>
   		</div>
   		<div class="mainBtn">
       	<button type="submit" id="login" onclick="login_btn();">LOGIN</button>
       	<br>
   		</div>
 	</form>
	</div>
   
	
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>

	<script src="./resources/assets/js/popper.min.js"></script>
	<script src="./resources/assets/js/bootstrap.min.js"></script>
	<script src="./resources/assets/js/owl.carousel.min.js"></script>
	<script src="./resources/assets/js/modal-video.js"></script>
	<script src="./resources/assets/js/loadmore.js"></script>
	<script src="./resources/assets/js/prefixfree.min.js"></script>
	<script src="./resources/assets/js/main.js"></script>

</body>
</html>