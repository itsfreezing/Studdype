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
h1{
	font-weight:800;
	font-size: 30px;
	line-height: 20px;
	text-align: center;
	margin-top: 5%;
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
    height:40px;
    margin-bottom: 3%;
}
.rno_part{
	font-weight: 800;
}
#rno1{
	margin-left:3%;
    width:200px;
    height:40px;
}
#mid_rno{
	font-weight: 800;
	font-size: 25px;
}
#rno2{
	margin-bottom:5%;
    width:200px;
    height:40px;
}
.btn_part{
	margin: auto;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
#send_btn{
	width: 300px;
	height: 50px;
	border-radius: 0px;
}
#search_btn{
	width: 120px;
	height: 50px;
}
#cancel{
	width: 120px;
	height: 50px;
	margin-left: 4.5%;
}
input.submitBtn{
	position: relative;
	background: #fff;
	color: #6434ef;
	border: 1px solid #6434ef;
	box-shadow: 0 0 15px 5px #eaebf2;
	margin-top: 40px;
	padding-bottom: 50px;
	width: 150px;
	height: 50px;
	line-height: 52px;
	padding: 0;
	font-size: 12px;
	font-weight: 600;
	border-radius: 50px;
	transition: all 0.3s ease-in-out;
	cursor: pointer;
}
input.submitBtn:hover{
	background: #6434ef;
	color: #fff;
} 
.row justify-content-center,
.hero-text-wrapper,
.hero-text-inner{
	
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function idsearch(){
	var form = $("#findidform");
	var name = $("#name");
	var rno = $("#rno1").val()+"-"+$("#rno2").val();
	if(name.val() == null || name.val().trim() == ''){
		alert("이름을 확인해 주세요.");
	}else if(rno == null || rno.trim() == ''){
		alert("주민번호를 확인해 주세요.");
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
	<h1>이메일 계정 찾기 </h1>
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
					<input type="button" class="submitBtn" id="search_btn" value="찾기" onClick="idsearch();"><input type="button" class="submitBtn" value="취소 " id="cancel" onClick="cancel();">
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