<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 관리</title>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/mainstyle.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>
<style type="text/css">
 

#main {
	float: right;
	display: inline-block;
	margin-right: 5%;
	margin-top: 3%;
	width: 70%;
	
	border-radius: 10px;
	height:1000px;
}



#studyimage {
	width: 500px;
	height: 250px;
	position: absolute;
	left: 480px;
	top: 590px;
	border:1px solid grey;
	
}
#studyimage img{
	position: absolute; top:0; left: 0;
	width: 100%;
	height: 100%;
}

#studyimagep {
	color: black;
	font: bold;
	font-size: 20px;
	position: absolute;
	font-weight:bold;
	left: 480px;
	top: 555px;
}

#imgAttach {
	position: absolute;
	left: -1px;
	top:-1px;
    width: 131px;
    height: 35px;
	 
}
#filebtn label{
	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
  
  	background: var(--button-bg-color);
 	color: var(--button-color);
  
 	margin: 0;
   
  
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 1rem;
    font-weight: 400;
    text-align: center;
    text-decoration: none;
  
    border: none;
    border-radius: 4px;
  
    display: inline-block;
    width: auto;
  
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  
    cursor: pointer;
  
    transition: 0.5s;

}



#creater {
	position: absolute;
	left: 1391px;
	top: 611px;
	font-size: 20px;
	font-weight:bold;
	color: black;
}

#createrarea {
	border: 1px solid #808080;
	border-radius:5px;
	position: absolute;
	left: 1391px;
	top: 644px;
	height: 30px;
	width: 300px;
}

#createrarea:hover{
	border: 2px solid #967BDC;
}

#studyname {
	position: absolute;
	left: 1070px;
	top: 611px;
	font-size: 20px;
	color: black;
	font-weight:bold;
}

#studynameupdate {
	border: 1px solid #808080;
	border-radius:5px;
	position: absolute;
	height: 30px;
	width: 300px;
	left: 1070px;
	top: 644px;
}
#studynameupdate:hover{
	border: 2px solid #967BDC;
}
#studynameupdate:focus{
	border: 2px solid #967BDC;
}
#samename {
	position: absolute;
	left: 920px;
	top: 660px;
}

#category {
	position: absolute;
	left: 1070px;
	top: 716px;
	font-size: 20px;
	color: black;
	font-weight:bold;
}

#cate {
	position: absolute;
	left: 1070px;
	top: 750px;
	width: 300px;
}

#Max {
	position: absolute;
	left: 1391px;
	top: 716px;
	font-size: 20px;
	font-weight:bold;
	color: black;
}

#Max_member {
	position: absolute;
	left: 1391px;
	top: 750px;
	width: 300px;
}

#locsi {
	position: absolute;
	left: 1070px;
	font-size: 20px;
	color: black;
	font-weight:bold;
	top: 790px;
}

#locationsi {
	position: absolute;
	left: 1070px;
	top: 820px;
	width: 300px;
}

#locgu {
	position: absolute;
	left: 1391px;
	top: 790px;
	font-size: 20px;
	font-weight:bold;
	color: black;
}

#locationgu {
	position: absolute;
	left: 1391px;
	top: 820px;
	width: 300px;
}

#studyinfo {
	position: absolute;
	left: 480px;
	top: 895px;
	font-size: 20px;
	font-weight:bold;
	color: black;
}

#studyinfot {
	position: absolute;
	left: 480px;
	top: 935px;
	width: 1211px;
	height: 300px;
}
#studyinfot:hover{
    border: 2px solid #967BDC;
}
#studyinfot:focus{
    border: 2px solid #967BDC;
}

#update {
	position: absolute;
	left: 480px;
	width: 1211px;
	top: 1265px;
}

#mainbook {
	color: black;
}



#allbook{
	position:absolute;
	left:88%;
	top:101%;
}
#memberbtn{
	position:absolute;
	left:63%;
	top:100%;
}
#allmember{
	position:absolute;
	left:88%;
	top:147%;
}
#bookbtn{
	position:absolute;
	left:63%;
	top:59%;
}

.filebox label {
  left: 906px;
  top: 850px;
  position: absolute;
  display: inline-block;
  padding: .5em .75em;
  color: #5a2b20;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  border:1px solid #5a2b20;
  background-color: white;
  cursor: pointer;
  
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}



.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
	
	#main2 {
	float: right;
	display: inline-block;
	margin-right: 5%;
	margin-top: 3%;
	width: 70%;
	
	border-radius: 10px;
	height:1000px;

	}
	
	#main3{
	float: right;
	display: inline-block;
	margin-right: 5%;
	margin-top: 3%;
	width: 70%;
	display:none;
	border-radius: 10px;
	height:1000px;
	
	}
	#scr::-webkit-scrollbar { width: 10px; }
	/* 스크롤바의 width */
	#scr::-webkit-scrollbar-track { background-color: #f0f0f0; }
	/* 스크롤바의 전체 배경색 */
	#scr::-webkit-scrollbar-thumb { 
	    background: linear-gradient(to bottom, #1697bf, #62b7ac); 
	}
	/* 스크롤바 색 */
	#scr::-webkit-scrollbar-button { display: none; }
	.table14_8 table {
	width:100%;
	margin:15px 0;
	border:0;
}
.table table-bordered th {
	font-weight:bold;
	background-color:#808080;
	color:black;
}
.table table-bordered,.table table-bordered th,.table table-bordered td {
	font-size:20px;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table table-bordered th,.table table-bordered td {
	border: 1px solid #ffffff;
	border-width:1px
}
.table table-bordered th {
	border: 1px solid #e7e0d5;
	border-width:1px 0 1px 0
}
.table table-bordered td {
	border: 1px solid #eeeeee;
	border-width:1px 0 1px 0
}
.table table-bordered tr {
	border: 1px solid #ffffff;
}
.table table-bordered tr:nth-child(odd){
	background-color:#f7f7f7;
}
.table table-bordered tr:nth-child(even){
	background-color:#ffffff;
}


/*Checkboxes styles*/
input[type="checkbox"] { display: none; }

input[type="checkbox"]+label{
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 20px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}

input[type="checkbox"]+label:last-child { margin-bottom: 0; }

input[type="checkbox"]+label:before {
  content: '';
  display: block;
  width: 20px;
  height: 20px;
  border: 1px solid #6cc0e5;
  position: absolute;
  left: 40px;
  top: 5px;
  opacity: .6;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

input[type="checkbox"]:checked+label:before {
  width: 10px;
  top: 1px;
  left: 46px;
  border-radius: 0;
  opacity: 1;
  border-top-color: transparent;
  border-left-color: transparent;
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}
#modal {
	display:none;
	position:absolute;
	width:100%;
	height:1580px;
	background:rgba(0,0,0,0.3);
	left:0%;
	top:0%;
	z-index:100;
	translate:0.5 ease all;
}

#modal-inside {
	position:absolute;
	width:50%;
	height:600px;
	background:#fff;
	left:25%;
	top:35%;
	text-align:center;
	padding-top:1%;
	padding-left:3%;
}

.modal-image {
	float:left;
	width:45%;
	height:230px;
	border:1px solid black;
	margin-top:20px;
	margin-right:20px;
}

.selected {
	border:5px solid #7362DE;
}
</style>
<script type="text/javascript">
	function LoadImg(value) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				
				$('#LoadImg').attr('src', e.target.result);
				
			}
			reader.readAsDataURL(value.files[0]);
			
		}
	}
	function update(){
		var main = document.getElementsByName("maker");
		var main_check = 0;
		var book = document.getElementsByName("bookmain");
		var book_check = 0;
		for(var i=0;i<book.length;i++){
			if(book[i].checked ==true){
				b = book[i].value;
				book_check++;
			
			}
		}
		var image = $(".selected").attr("src");
	 	var e = [];
		$("input[name=exile]:checked").each(function(i){
			e.push($(this).val());
		});
		for(var i=0;i<main.length;i++){
			if(main[i].checked == true){
				m = main[i].value;
				main_check++;
			}
		}
		
		var i = document.getElementById('studyinfot').value;
		var c = document.getElementById('cate').value;
		var s = document.getElementById('locationsi').value;
		var g = document.getElementById('locationgu').value;
		var m = document.getElementById('Max_member').value;
		var n = document.getElementById('studynameupdate').value;
		if(image != null){
			location.href="studyupdate.do?"+"&s_no="+'${study.s_no}'+"&s_info="+i+"&b_no="+b
			+"&cate="+c+"&locationsi_no="+s+"&locationgu_no="+g+"&max="+m+"&img_name="+image+"&s_name="+n;
		}
		var file = document.getElementById('ex_file');
	
		//파일 경로.
		var filePath = file.value;
	
		//전체경로를 \ 나눔.
		var filePathSplit = filePath.split('\\'); 
		//전체경로를 \로 나눈 길이.
		var filePathLength = filePathSplit.length;
		//마지막 경로를 .으로 나눔.
		var fileNameSplit = filePathSplit[filePathLength-1].split('.');
		//파일명 : .으로 나눈 앞부분
		var fileName = fileNameSplit[0];
		//파일 확장자 : .으로 나눈 뒷부분
		var fileExt = fileNameSplit[1];
		//파일 크기
		var fileSize = file.files[0].size;
	
		alert(fileName);
		
		location.href="studyupdate.do?"+"&s_no="+'${study.s_no}'+"&s_info="+i+"&b_no="+b
				+"&cate="+c+"&locationsi_no="+s+"&locationgu_no="+g+"&max="+m+"&img_name="+fileName+"&s_name="+n;
	
	
	
		
	
		
	}
	
	function onError(){
		alert('해당 파일은 이미지가아닙니다!! 파일을 변경해주세요.');
		document.getElementById('LoadImg').src='resources/img/no_image.png';
	}
	
	function first(){
		$('#member').show();
  		$('#member2').hide();
  		$('#member3').hide();
	}
	function second(){
		$('#member2').show();
  		$('#member').hide();
  		$('#member3').hide();
	}
	function third(){
		$('#member3').show();
  		$('#member').hide();
  		$('#member2').hide();
	}
	
	function change(){
		var main = document.getElementsByName("maker");
		var main_check = 0;
		for(var i=0;i<main.length;i++){
			if(main[i].checked == true){
				var m = main[i].value;
				main_check++;
			}
		}
		//location.href="updateleader.do?"+"&s_no="+'${study.s_no}'+"&leader_no="+m;
		var chk_arr = [];
		$("input[name=exile]:checked").each(function(){
			 var chk = $(this).val();
			 $(this).checked
			 chk_arr.push(chk);
			 
		});
		
		if(chk_arr.length == 0){
			
			location.href="updatelead.do?"+"&s_no="+'${study.s_no}'+"&leader_no="+m
		}else{
		
		
		location.href="updateleader.do?"+"&s_no="+'${study.s_no}'+"&leader_no="+m+"&exile_no="+chk_arr;
		}
	}
	
	function main(){
		$('#main').show();
		$('#main2').hide();
		$('#main3').hide();
		$('#p1').css("color","#5a2b20");
		$('#p2').css("color","#808080");
		$('#p3').css("color","#808080");
	}
	function main2(){
		$('#main2').show();
		$('#main').hide();
		$('#main3').hide();
		$('#p2').css("color","#5a2b20");
		$('#p1').css("color","#808080");
		$('#p3').css("color","#808080");
		
	}
	function main3(){
		$('#main3').show();
		$('#main2').hide();
		$('#main').hide();
		$('#p3').css("color","#5a2b20");
		$('#p2').css("color","#808080");
		$('#p1').css("color","#808080");
		
	}
	function changebook(){
		var main = document.getElementsByName("bookmain");
		var main_check = 0;
		for(var i=0;i<main.length;i++){
			if(main[i].checked == true){
				var m = main[i].value;
				main_check++;
			}
		}
		location.href="bookchange.do?b_no="+m+"&s_no="+'${study.s_no}';
	}

	function modal(){
		$("#modal").show();
	
	

	$("#basicImageCancel").click(function() {
		$("#modal").hide();
	});
	
	
	$(".modal-image").click(function() {
		$(".selected").removeClass("selected");
		$(this).addClass("selected");
	});
	
	$("#basicImageSelect").click(function() {
		var image = $(".selected").attr("src");
		$("#studyimage").empty();
		$("#studyimage").append("<img id='studyMainPhoto' src='"+image+"' />");
		$("#basicPhoto").val(image);
		$("#modal").hide();

		
	});
	}
	$("#ex_file").click(function(){
			$("#studyimage").empty();
	});
	function frmsubmit(){
		var file = document.getElementById('ex_file');
		
		//파일 경로.
		var filePath = file.value;
	
		//전체경로를 \ 나눔.
		var filePathSplit = filePath.split('\\'); 
		//전체경로를 \로 나눈 길이.
		var filePathLength = filePathSplit.length;
		//마지막 경로를 .으로 나눔.
		var fileNameSplit = filePathSplit[filePathLength-1].split('.');
		//파일명 : .으로 나눈 앞부분
		var fileName = fileNameSplit[0];
		//파일 확장자 : .으로 나눈 뒷부분
		var fileExt = fileNameSplit[1];
		//파일 크기
		var fileSize = file.files[0].size;
		
	
	   
	
		
		return true;
	}
	function setThumbnail(event) { 
		
	var reader = new FileReader(); 
		
	reader.onload = function(event) { 
		
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#studyimage").appendChild(img); 
	
	}; 
		reader.readAsDataURL(event.target.files[0]); 
	}


	$("#fileinput").change(function() {
		readURL(this);
	});
	
</script>
</head>
<body>

	<!-- 커뮤니티 헤더,네비 -->
	<jsp:include page="../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../commond/communityLeftNavi.jsp"></jsp:include>
	<!-- 커뮤니티 헤더,네비 끝 -->


	<!-- 메인 세션 -->
	
	<div id="main" >
	<form method="post" enctype="multipart/form-data" action="studyupdate.do" autocomplete="off" onsubmit='return frmsubmit();'>
		<p id="p1" style="color:#black; position:absolute; font-weight:bold; left:1150px; top:555px; cursor:pointer;" onclick="main1();">스터디 관리</p>
		<p id="p2" style="color:#808080; position:absolute; left:1352px; top:555px; cursor:pointer;" onclick="main2();">멤버 관리</p>
		<p id="p3" style="color:#808080; position:absolute; left:1540px; top:555px; cursor:pointer;" onclick="main3();">대표 도서 지정</p>


		<!-- 대표 사진  -->
	
		<p id="studyimagep">대표 사진</p>
		<pre class="brush:html"></pre>
		<div class="filebox">
		  <label for="ex_file">업로드</label>
		  <input type="file" id="ex_file" name="file" onchange="setThumbnail(event);" >
		</div>
			<button class="btn btn-purple" type="button" onclick="modal();" style="position:absolute; top: 851px; left: 788px; background-color:white; border:1px solid #5a2b20; color:#5a2b20;">기본사진</button>
			<input type="hidden" id="basicPhoto" name="photo" value="">
			
		<div id="studyimage" class="image-container" >
			<img src="${fileName }" style="height:100%; width:100%;">
			
		

		</div>
		
		
		<input type="hidden" name="s_no" value="${study.s_no }">
		<div id="modal">
		<div id="modal-inside">
			<img class="modal-image" src="./resources/assets/img/img_study7.png">
			<img class="modal-image" src="./resources/assets/img/img_study5.png">
			<img class="modal-image" src="./resources/assets/img/img_study3.png">
			<img class="modal-image" src="./resources/assets/img/img_study1.png">
			<div style="float:right; margin-top:25px;" class="fileSelectDiv" id="basicImageCancel">
				<button  type="button" class="btn btn-purple" style="position:absolute; background-color:white; border:1px solid #5a2b20; color:#5a2b20; left: 824px; top: 541px;">취소</button>
			</div>
			<div style="position: absolute;  top: 542px;  left: 721px;" class="fileSelectDiv" id="basicImageSelect">
				<button  type="button" class="btn btn-purple" style="background-color:white; border:1px solid #5a2b20; color:#5a2b20;">선택 완료</button>
			</div>
			</div>
		</div>
		
		<!-- 대표 사진 끝 -->
		
		<!-- 스터디 정보 수정  -->

		<p id="creater">스터디 팀장</p>
		<input id="createrarea" readonly="readonly" value="${login.mem_name }">
		<p id="studyname">스터디 이름</p>
		<input id="studynameupdate" name="s_name" value="${study.s_name }">
		
		<p id="category">카테고리</p>
		<select id="cate" name="cate_no">
			<c:forEach var="category" items="${category }">
				<option value="${category.cate_no }" <c:if test="${category.cate_no == study.cate_no }">selected     </c:if>>${category.cate_name }</option>
			</c:forEach>
		</select>
		<p id="Max">최대 인원수</p>
		<select id="Max_member" name="s_maxcnt">
			<c:forEach var="i" begin="1" end="30" step="1">
			<option value="${i }" <c:if test="${i == study.s_maxcnt }">selected </c:if>>${i } 명    </option>
			</c:forEach>
		</select>
		<p id="locsi">지역(시)</p>
		<select id="locationsi" name="si_no">
			<c:forEach var="sidto" items="${sidto }">
				<option value="${sidto.si_no }"<c:if test="${sidto.si_no == study.si_no }">selected </c:if>>${sidto.si_name }</option>
			</c:forEach>
		</select>
		<p id="locgu">지역(구)</p>
		<select id="locationgu" name="gu_no">
			<c:forEach var="gudto" items="${gudto }">
				<option value="${gudto.gu_no }" <c:if test="${gudto.gu_no == study.gu_no }">selected </c:if>>${gudto.gu_name}</option>
			</c:forEach>
		</select>
		<p id="studyinfo">스터디 소개</p>
		<input id="studyinfot" name="s_info" type="text" value="${study.s_info }">
	
		<input id="update" type="submit" class="btn btn-purple" value="스터디 변경">
		</form>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

	</div>
	<!--  메인 세션 끝 -->
	<!--  멤버 관리 -->
	<div id="main2" style="display:none;">
		<form>
		<p id="p1" style="color:#808080; position:absolute; left:1150px; top:555px; cursor:pointer;" onclick="main();">스터디 관리</p>
		<p id="p2" style="color:#black; position:absolute; font-weight:bold; left:1352px; top:555px; cursor:pointer;" onclick="main2();">멤버 관리</p>
		<p id="p3" style="color:#808080; position:absolute; left:1540px; top:555px; cursor:pointer;" onclick="main3();">대표 도서 지정</p>
		<p style="position:absolute; top:57%; left:28%; color:black; font-size:20px; font-weight:bold;">스터디 전체 멤버</p>
		
		<div id="scr" style=" width:1117px; position:absolute; top:65%; left:28%; overflow:auto; overflow-x:hidden; border-radius:4px; ">
		<table id="member"
         class="table table-bordered" style="width:1117px; text-align:center; ">
         <thead>
            <tr >
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">이름</th>
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">이메일</th>
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">아이디</th>
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">성별</th>
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">추방하기</th>
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">대표설정</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="membername" items="${membername}" varStatus="status" >
            
               <tr >
                  <td>${membername.mem_name }</td>
                  <td>${membername.mem_email }</td>
                  <td>${membername.mem_id }</td>
                  <td><c:if test="${membername.mem_gender == 'M' }">남자</c:if><c:if test="${membername.mem_gender == 'F' }">여자</c:if></td>
                  <td id="exilenum">
                  <c:if test="${membername.mem_no != login.mem_no }">
                  <input type="checkbox" id="box-${status.count }" name="exile" value="${membername.mem_no }" onclick="check(this)">
                  <label for="box-${status.count }">추방</label>
                  </c:if>
                 <c:if test="${membername.mem_no == login.mem_no }">
                 <input type="checkbox"  id="box-${status.count }" name="exile" value="${membername.mem_no }" onclick="return false">
                 <label for="box-${status.count }">추방</label></c:if>
                  </td>
               
                  <c:if test="${membername.mem_no == login.mem_no }">
                     <td id="maker${status.count }">
                     <input name="maker" type="radio" id="maker${status.count }" checked="checked" value="${membername.mem_no }">대표</td>
                  </c:if>
                  <c:if test="${membername.mem_no != login.mem_no }">
                     <td id="maker${status.count }"><input name="maker" id="maker${status.count }" type="radio"
                        value="${membername.mem_no }">대표</td>
                  </c:if>

               </tr>
            
            </c:forEach>

         </tbody>
      </table>
      <input type="button" class="btn btn-purple" style="display:block; margin-top:20px; margin-left:90%;" onclick="change();" value="수정하기">   
      </div>
      
	  </form>
	
	</div>
	<!-- 멤버 관리 끝 -->
	
	
	
	
	
	
	<!-- 도서 관리 -->
	<div id="main3" >
		<p id="p1" style="color:#808080; position:absolute; left:1150px; top:555px; cursor:pointer;" onclick="main();">스터디 관리</p>
		<p id="p2" style="color:#808080; position:absolute; left:1352px; top:555px; cursor:pointer;" onclick="main2();">멤버 관리</p>
		<p id="p3" style="color:#black; position:absolute; font-weight:bold; left:1540px; top:555px; cursor:pointer;" onclick="main3();">대표 도서 지정</p>
		<p style="position:absolute; top:57%; left:28%; color:black; font-size:20px; font-weight:bold;">전체 도서 </p>
	
	<div id="scr"style=" width:1117px; position:absolute; top:65%; left:28%; overflow:auto; border-radius:4px; ">
	<table id="book1"
         class="table table-bordered" style="width:1117px; text-align:center;">

         <thead>
            <tr style="text-align:center; background-color:#808080 !important; color:black !important;">
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">번호</th>
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">등록된 책 제목</th>
               <th style="position:sticky;top:0px; background-color:#f2f5f9;">대표 도서</th>
            </tr>
         </thead>
         <tbody style="text-align:center;">
            <c:forEach var="bookList" items="${bookList}" varStatus="status" >
               <tr style="text-align:center;">
                  <td>${status.count }</td>
                  <td>${bookList.book_title }</td>
                  <c:if test="${bookList.book_ismain eq 'N' }">
                     <td id="mainbook"><input id="bookmain" type="radio" value="${bookList.b_no }"
                        name="bookmain">대표</td>
                  </c:if>
                  <c:if test="${bookList.book_ismain eq 'Y' }">
                     <td id="mainbook"><input id="bookmain" type="radio" value="${bookList.b_no }"
                        name="bookmain" checked="checked" >대표</td>
                  </c:if>
               </tr>
            </c:forEach>

         </tbody>
      </table>            
    <input type="button" class="btn btn-purple" style="display:block; margin-top:20px; margin-left:90%;" onclick="change();" value="수정하기">   
	</div>
		
	  
	</div>
	
</body>
<footer>
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>