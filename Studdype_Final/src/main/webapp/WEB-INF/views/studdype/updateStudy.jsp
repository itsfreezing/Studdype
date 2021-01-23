<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study Update!</title>


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
<link rel="stylesheet" href="./resources/css/style.css">
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
<script src="./resources/assets/js/main.js"></script>
<style type="text/css">
#main {
	float: right;
	display: inline-block;
	margin-right: 5%;
	margin-top: 3%;
	width: 70%;
	border: 1px solid rgb(115, 98, 222);
	border-radius: 10px;
}

#book1 {
	border: 1px solid grey;
	height: 400px;
	width: 500px;
	text-align: center;
}

#member {
	border: 1px solid grey;
	height: 400px;
	width: 500px;
	text-align: center;
}

#studyimage {
	width: 300px;
	height: 195px;
	position: absolute;
	left: 1100px;
	top: 600px;
}

#studyimagep {
	color: purple;
	font: bold;
	font-size: 20px;
	position: absolute;
	left: 1100px;
	top: 560px;
}

#imgAttach {
	position: absolute;
	left: 1420px;
	top: 760px;
}

#member {
	border: 1px solid;
	margin-top: 50px;
}

#creater {
	position: absolute;
	left: 1570px;
	top: 600px;
	font-size: 20px;
	color: purple;
}

#createrarea {
	border: 1px solid purple;
	position: absolute;
	left: 1570px;
	top: 630px;
	height: 30px;
	width: 200px;
}

#studyname {
	position: absolute;
	left: 1570px;
	top: 665px;
	font-size: 20px;
	color: purple;
}

#studynameupdate {
	border: 1px solid purple;
	position: absolute;
	height: 30px;
	width: 200px;
	left: 1570px;
	top: 700px;
}

#samename {
	position: absolute;
	left: 1570px;
	top: 760px;
}

#category {
	position: absolute;
	left: 1100px;
	top: 820px;
	font-size: 20px;
	color: purple;
}

#cate {
	position: absolute;
	left: 1100px;
	top: 850px;
	width: 300px;
}

#Max {
	position: absolute;
	left: 1420px;
	top: 820px;
	font-size: 20px;
	color: purple;
}

#Max_member {
	position: absolute;
	left: 1420px;
	top: 850px;
	width: 353px;
}

#locsi {
	position: absolute;
	left: 1100px;
	font-size: 20px;
	color: purple;
	top: 890px;
}

#locationsi {
	position: absolute;
	left: 1100px;
	top: 920px;
	width: 300px;
}

#locgu {
	position: absolute;
	left: 1420px;
	top: 890px;
	font-size: 20px;
	color: purple;
}

#locationgu {
	position: absolute;
	left: 1420px;
	top: 920px;
	width: 353px;
}

#studyinfo {
	position: absolute;
	left: 1100px;
	top: 960px;
	font-size: 20px;
	color: purple;
}

#studyinfot {
	position: absolute;
	left: 1100px;
	top: 1000px;
	width: 672px;
	height: 407px;
}

#update {
	position: absolute;
	left: 1100px;
	width: 672px;
	top: 1450px;
}

#mainbook {
	color: black;
}

#imgAttach {
	position: absolute;
	left: 1100px;
	top: 800px;
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
		
		
		
		
		location.href="studyupdate.do?b_no="+b+"&mem_no="+m+"&ban_no="+e+"&s_no="+'${study.s_no}'+"&s_info="+i
				+"&cate="+c+"&locationsi_no="+s+"&locationgu_no="+g+"&max="+m;
		
		
		
	}
	function onError(){
		alert('해당 파일은 이미지가아닙니다!! 파일을 변경해주세요.');
		document.getElementById('LoadImg').src='resources/img/no_image.png';
	}
	
</script>
</head>
<body>

	<!-- 커뮤니티 헤더,네비 -->
	<jsp:include page="../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../commond/communityLeftNavi.jsp"></jsp:include>
	<!-- 커뮤니티 헤더,네비 끝 -->


	<!-- 메인 세션 -->
	<div id="main">


		<!-- 대표 도서 table -->
		<table id="book1"
			class="table table-striped table-bordered table-hover"
			style="border: 1px solid;">

			<thead>
				<tr>
					<th>번호</th>
					<th>등록된 책 제목</th>
					<th>대표설정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bookList" items="${bookList}" varStatus="status">
					<tr>
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
		<!--  대표 도서 table 끝 -->


		<!-- 스터디멤버 table  -->
		<table id="member"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>이름</th>
					<th>이메일</th>
					<th>추방하기</th>
					<th>대표설정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="membername" items="${membername}">
					<tr>
						<td>${membername.mem_name }</td>
						<td>${membername.mem_email }</td>
						<td><input type="checkbox" name="exile" value="${membername.mem_no }">추방</td>
						<c:if test="${membername.mem_no == login.mem_no }">
							<td><input name="maker" type="radio" checked="checked"
								value="${membername.mem_no }">대표</td>
						</c:if>
						<c:if test="${membername.mem_no != login.mem_no }">
							<td><input name="maker" type="radio"
								value="${membername.mem_no }">대표</td>
						</c:if>

					</tr>
				</c:forEach>

			</tbody>
		</table>
		<!-- 스터디 멤버 table 끝 -->


		<!-- 대표 사진  -->
		<form action="${pageContext.request.contextPath}/file/upload.do" method="post" enctype="multipart/form-data">
		<p id="studyimagep">대표 사진</p>
		<pre class="brush:html"></pre>
		<input type="file" id="imgAttach" name="imgAttach"
			onchange="LoadImg(this);">
		

		<div id="studyimage" class="image-container">

			<img id="LoadImg" style="width: 300px; height: 195px;"
				onError="onError();">

		</div>
		</form>
		<!-- 대표 사진 끝 -->

		<!-- 스터디 정보 수정  -->

		<p id="creater">생성자</p>
		<input id="createrarea" readonly="readonly" value="${login.mem_name }">
		<p id="studyname">스터디 이름</p>
		<input id="studynameupdate" value="${study.s_name }">
		<button id="samename" type="button" class="btn btn-purple" onclick="check();">스터디
			이름 중복 Check!</button>
		<p id="category">카테고리</p>
		<select id="cate">
			<c:forEach var="category" items="${category }">
				<option value="${category.cate_no }" <c:if test="${category.cate_no == study.cate_no }">selected     </c:if>>${category.cate_name }</option>
			</c:forEach>
		</select>
		<p id="Max">최대 인원수</p>
		<select id="Max_member">
			<c:forEach var="i" begin="1" end="30" step="1">
			<option value="${i }" <c:if test="${i == study.s_maxcnt }">selected </c:if>>${i } 명    </option>
			</c:forEach>
		</select>
		<p id="locsi">지역(시)</p>
		<select id="locationsi">
			<c:forEach var="sidto" items="${sidto }">
				<option value="${sidto.si_no }"<c:if test="${sidto.si_no == study.si_no }">selected </c:if>>${sidto.si_name }</option>
			</c:forEach>
		</select>
		<p id="locgu">지역(구)</p>
		<select id="locationgu">
			<c:forEach var="gudto" items="${gudto }">
				<option value="${gudto.gu_no }" <c:if test="${gudto.gu_no == study.gu_no }">selected </c:if>>${gudto.gu_name}</option>
			</c:forEach>
		</select>
		<p id="studyinfo">스터디 소개</p>
		<input id="studyinfot" value="${study.s_info }">
		<button id="update" type="button" class="btn btn-purple" onclick="update();">Update!</button>









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



</body>
<footer>
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>