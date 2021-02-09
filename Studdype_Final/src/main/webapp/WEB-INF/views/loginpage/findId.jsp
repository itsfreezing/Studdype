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
	font-weight:800;
	font-size: 30px;
	line-height: 20px;
	text-align: center;
	margin-top: 3%;
	margin-bottom: -1%;
}
#findLogo{
	width: 50px;
	height: 50px;
	margin-left: 2%;
	margin-bottom: 1%;
}
.main_head{
	width: 800px;
	margin: auto;
	margin-right: auto;
	margin-left: auto;
	padding-top: 50px;
}
.sub_head{
	box-sizing: border-box;
	display: block;
}
.namerno_part{
	margin-left: 12%;
}
.name_part{
	font-weight: 800;
}
#name{
	margin-left:12%;
    width:200px;
    height:45px;
    margin-bottom: 3%;
}
.rno_part{
	font-weight: 800;
}
#rno1{
	margin-left:3%;
    width:200px;
    height:45px;
}
#mid_rno{
	font-weight: 800;
	font-size: 25px;
}
#rno2{
	margin-bottom:5%;
    width:200px;
    height:45px;
}
.btn_part{
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
.mid_menu{
	margin-left: 41%;
}
#login{
	font-weight: 800;
}
#findPw{
	font-weight: 800;
}
#search_btn{
	width: 200px;
	height: 50px;
	border-radius: 5px;
	font-size: 18px;
	transition: color 0.5s;
	transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
	-webkit-appearance:s;
    cursor: pointer;
    -webkit-writing-mode: horizontal-tb !important;
    border-width: 3px;
    color:white;
    background-color: gray;
}
#search_btn:hover{
	background-color: #6E45E3;
}
#cancel{
	width: 200px;
	height: 50px;
	margin-left:7%;
	border-radius: 5px;
	font-size: 18px;
	transition: color 0.5s;
	transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
	border-color: #3f51b5;
	-webkit-appearance:s;
    cursor: pointer;
    -webkit-writing-mode: horizontal-tb !important;
    border-width: 3px;
	color: white;
	background-color: gray;
}
#cancel:hover{
	background-color: #6E45E3;
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".justify-content-center").show(); 
	$(".justify-content-center").css({"background-image":"url('resources/assets/img/loginBanner2.png')","background-size":"cover"});
	$(".hero-text").html("<h1>아이디 찾기</h1>");
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
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<h1>아이디 찾기</h1>
	
	<form class="main_head" id="findidform" action="findId.do" method="POST">
		<div class="sub_head">
			<div class="namerno_part">
			<div class="name_part">
				<label id="nameLabel">이름</label>
				<input type="text" name="mem_name" id="name" title="n" style="border:2px solid #6E45E3" autofocus="autofocus">
			</div>
			<div class="rno_part">
				<label id="rnoLabel">주민등록번호</label>
				<input type="text" name="rno" id="rno1" style="border:2px solid #6E45E3" maxlength="6"><span id="mid_rno"> - </span><input type="password" name="rno" id="rno2" style="border:2px solid #6E45E3" maxlength="7">
				<input type="hidden" name="mem_rno" id="realRno">
			</div>
			</div>
			<div class="btn_part">
				<div>
					<button type="submit" class="submitBtn" id="search_btn" value="찾기" onClick="idsearch();">찾기</button>
					<button type="submit" class="submitBtn" id="cancel" value="취소 " onClick="cancel();">취소</button>
				</div>
			</div>
		</div>
	</form>
	
	
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