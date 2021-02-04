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
<style type="text/css">
.mainmenu li.active:not(:last-child):after,
.mainmenu li:not(:last-child):hover:after { 
	background: #fff;
}

.header-area {
	background: #88d3ce;
	background: -moz-linear-gradient(left, #88d3ce 0%, #6e45e2 100%);
	background: -webkit-linear-gradient(left, #88d3ce 0%, #6e45e2 100%);
	background: linear-gradient(to right, #88d3ce 0%, #6e45e2 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#88d3ce', endColorstr='#6e45e2', GradientType=1);
}
h1{
	margin-top: 3%;
	font-weight:800;
	font-size: 35px;
	line-height: 20px;
	text-align: center;
	
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
}
#pw{
	margin-bottom:10%;
    width:300px;
    height:50px;
}
#login{
	width:300px;
	height:50px;
	border-radius:2px;
	font-size:20px;
}
#signup{
	width:300px;
	height:50px;
	border-radius:25px;
	font-size:20px;
}
.findSection{
    margin-left:32.5%;
    font-weight: 800;
}
.mainBtn{
	margin-left: 31%;
}
.footer-menu{
	margin-bottom: -50%;
}
</style>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 해더 상단 영역 숨기기 (메뉴 넘어갈때는 이 코드 show()로 바꾸기)
		//$(".justify-content-center").hide(); 
		$(".justify-content-center").show(); 
		$(".justify-content-center").css({"background":"black"}); 
	})
	
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
	<h1>로그인</h1>
	<div class="main">
    <form class="loginForm" action="login.do" method="POST">
    	<table class="loginTable">
       		<tr>
            	<td>
            	<input type="text" name="mem_id" id="id" placeholder="아이디를 입력해주세요" style="border:2px solid #6E45E3" autofocus="autofocus">
            	</td>
          	</tr>
          	<tr>
             	<td>
                <input type="password" name="mem_pw" id="pw" placeholder="비밀번호를 입력해주세요" style="border: 2px solid #6E45E3">
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