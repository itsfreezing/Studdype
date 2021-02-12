<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find ID</title>

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
}
h1{
	margin-top: 3%;
	font-weight:600;
	font-size: 30px;
	line-height: 20px;
	text-align: center;
	color: black;
}
span{
	color:white;
	font-size: 20px;
}
label{
	color: black;
}
#findLogo{
	width: 50px;
	height: 50px;
	margin-left: 2%;
	margin-bottom: 1%;
}
.main_head{
	width: 600px;
	height: 300px;
	margin-top: 3%;
	margin-left: auto;
	margin-right:auto;
	border-radius: 5px;
}
.sub_head{
	height: 250px;
	box-sizing: border-box;
	padding-top: 5%;
	margin-top: 1%;
	background: white;
	opacity: 85%;
	border-radius: 5px;
}
.namerno_part{
	margin-left: 12%;
}
.name_part{
	font-weight: 800;
}
#name{
	margin-left:15%;
    width:300px;
    height:44px;
    margin-bottom: 3%;
    border:1px solid #A6A6A6
}
#name:hover{
	border: 2px solid #6434ef;
}
.rno_part{
	font-weight: 800;
}
#rno1{
	margin-left:3%;
    width:137px;
    height:44px;
    border:1px solid #A6A6A6
}
#rno1:hover{
	border: 2px solid #6434ef;
}
#mid_rno{
	font-weight: 800;
	font-size: 25px;
	color: black;
}
#rno2{
	margin-bottom:5%;
    width:136px;
    height:44px;
    border:1px solid #A6A6A6
}
#rno2:hover{
	border: 2px solid #6434ef;
}
.btn_part{
	color: grey;
	margin-top:-2%;
	text-align: center;
}
#login{
	font-weight: 800;
}
#findPw{
	font-weight: 800;
}
#search_btn{
	width:140px;
   	height:40px;
   	margin-top : 15px;
	background-color: white;
	border: 1px solid #A6A6A6;
	font-size: 15px;
	border-radius: 0px 0px;
	color: black;
	padding: 1%;
	box-shadow: none;
}
#search_btn:hover{
	background-color: white;
	border: 2px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;
}
#cancel{
	width:140px;
   	height:40px;
   	margin-top : 15px;
   	margin-left: 5%;
	background-color: white;
	border: 1px solid #A6A6A6;
	font-size: 15px;
	border-radius: 0px 0px;
	color: black;
	padding: 1%;
	box-shadow: none;
}
#cancel:hover{
	background-color: white;
	border: 2px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".background").show(); 
	$(".background").css({"background-image":"url('resources/assets/img/main3.png')","background-size":"cover"});
	$(".background").css("height", "800px");
	$(".hero-text").html("<h1>아이디 찾기</h1><br><span>하단에 정보를 기입해 주시면 아이디를 알려드려요.</span>");
});

function idsearch(){
	var form = $("#findidform");
	var name = $("#name");
	var rno = $("#rno1").val()+"-"+$("#rno2").val();
	if(name.val() == null || name.val().trim() == ''){
		alert("이름을 확인해 주세요.");
		return false;
	}else if(rno == null || rno.trim() == ''){
		alert("주민번호를 확인해 주세요.");
		return false;
	}else{
		$("#realRno").val(rno);
		form.submit();
	}
};

function cancel(){
	self.close();
}
</script>
</head>
<body>
<div class="background">
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<form class="main_head" id="findidform" action="findId.do" method="POST">
		<div class="sub_head">
			<div class="namerno_part">
			<div class="name_part">
				<label>이름</label>
				<input type="text" name="mem_name" id="name" placeholder=" 이름을 입력해 주세요." title="n" autofocus="autofocus">
			</div>
			<div class="rno_part">
				<label>주민등록번호</label>
				<input type="text" name="rno" id="rno1" placeholder=" 주민번호 앞자리" maxlength="6"><span id="mid_rno"> - </span><input type="password" name="rno" id="rno2" placeholder=" 주민번호 뒷자리" maxlength="7">
				<input type="hidden" name="mem_rno" id="realRno">
			</div>
			</div>
			<div class="btn_part">
				<button type="submit" class="submitBtn" id="search_btn" value="찾기" onClick="idsearch();">찾기</button>
				<button type="submit" class="submitBtn" id="cancel" value="취소 " onClick="cancel();">취소</button>
			</div>
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