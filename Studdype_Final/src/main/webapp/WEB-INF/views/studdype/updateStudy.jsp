<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   

	<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
	<link rel="stylesheet" href="./resources/assets/css/animate.css">
	<link rel="stylesheet" href="./resources/assets/css/normalize.css">
	<link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/assets/css/responsive.css">
    <link rel="stylesheet" href="./resources/css/community/header&footer.css">
    <link rel="stylesheet" href="./resources/css/community/leftnavi.css">
    <link rel="stylesheet" href="./resources/css/community/mainsection.css">
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>
	<style type="text/css">
	#main{
		float: right;  
		display: inline-block; 
		margin-right: 5%; 
		margin-top: 3%; 
		width: 70%;  
		border: 1px solid rgb(115, 98, 222); 
  		border-radius: 10px;
	}
	#book{
		border: 1px solid grey;
		height: 400px;
		width: 500px;
		text-align: center;
		
		
	}
	#member{
		border: 1px solid grey;
		height: 400px;
		width: 500px;
		text-align: center;
	}
	#studyimage{
		width:300px;
		height:195px;
		border:1px solid black; 
		position:absolute; 
		left:1100px; 
		top:600px;
	
	}
	#studyimagep{
		color:purple; 
		font:bold; 
		font-size:20px; 
		position:absolute; 
		left:1100px; 
		top:560px;
	}
	#Fileupdatebtn{
		position:absolute; 
		left: 1420px; 
		top:760px;
	}
	#member{
		border: 1px solid; 
		margin-top:50px;
	}
	#creater{
		position:absolute;
		left: 1570px;
		top: 600px;
		font-size:20px;
		color:purple;
	}
	#createrarea{
		border:1px solid purple;
		position:absolute;
		left: 1570px;
		top: 630px;
		height:30px;
		width:200px;
	}
	#studyname{
		position:absolute;
		left: 1570px;
		top: 665px;
		font-size:20px;
		color:purple;
	}
	#studynameupdate{
		border:1px solid purple;
		position:absolute;
		height:30px;
		width:200px;
		left:1570px;
		top:700px;
	}
	#samename{
		position:absolute;
		left:1570px;
		top:760px;
	}
	#category{
		position:absolute; 
		left:1100px; 
		top:820px;
		font-size:20px;
		color:purple;
	
	}
	#cate{
		position:absolute;
		left:1100px;
		top:850px;
		width:300px;
	}
	#Max{
		position:absolute; 
		left:1420px; 
		top:820px;
		font-size:20px;
		color:purple;
	}
	#Max_member{
		position:absolute;
		left:1420px;
		top:850px;
		width:353px;
	}
	#locsi{
		position:absolute; 
		left:1100px; 
		font-size:20px;
		color:purple;
		top:890px;
	}
	#locationsi{
		position:absolute;
		left:1100px;
		top:920px;
		width:300px;
	
	}
	#locgu{
		position:absolute; 
		left:1420px; 
		top:890px;
		font-size:20px;
		color:purple;
	}
	#locationgu{
		position:absolute;
		left:1420px;
		top:920px;
		width:353px;
	}
	#studyinfo{
		position:absolute;
		left:1100px;
		top:960px;
		font-size:20px;
		color:purple;
	}
	#studyinfot{
		position:absolute;
		left:1100px;
		top:1000px;
		width:672px;
		height:407px;
	}
	#update{
		position:absolute;
		left:1100px;
		width:672px;
	}

	</style>
</head>
<body>

	<!-- 커뮤니티 헤더,네비 -->
	<jsp:include page="../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../commond/communityLeftNavi.jsp"></jsp:include>
	<!-- 커뮤니티 헤더,네비 끝 -->
	
	
	<!-- 메인 세션 -->
	<div id="main">
  	
  	
  	<!-- 대표 도서 table -->
	<table id="book" class="table table-striped table-bordered table-hover" style="border: 1px solid; ">

		<thead >
			<tr>
				<th>번호</th>
				<th>등록된 책 리스트</th>
				<th>대표설정</th>
			</tr>
		</thead>
		<tbody >
			<tr>
				<td>1</td>
				<td>꿈꾸는 다락방</td>
				<td>대표</td>
			</tr>
			<tr>
				<td>2</td>
				<td>꿈꾸는 다락방2</td>
				<td>대표</td>
			</tr>
			<tr>
				<td>3</td>
				<td>꿈꾸는 다락방3</td>
				<td>대표</td>
			</tr>
			<tr>
				<td>4</td>
				<td>꿈꾸는 다락방4</td>
				<td>대표</td>
			</tr>
			<tr>
				<td>5</td>
				<td>꿈꾸는 다락방5</td>
				<td>대표</td>
			</tr>
			<tr>
				<td>6</td>
				<td>꿈꾸는 다락방6</td>
				<td>대표</td>
			</tr>
		</tbody>
	</table>
	<!--  대표 도서 table 끝 -->
	
	
	<!-- 스터디멤버 table  -->
	<table id="member" class="table table-striped table-bordered table-hover" >
		<thead>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>추방하기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>ajsdva</td>
				<td>chosuk0000@gmail.com</td>
				<td>추방</td>
			</tr>
			<tr>
				<td>amwlva</td>
				<td>chosuk0000@nate.com</td>
				<td>추방</td>
			</tr>
			<tr>
				<td>krnvns</td>
				<td>chosuk0000@naver.com</td>
				<td>추방</td>
			</tr>
			<tr>
				<td>ajevoqm</td>
				<td>chosuk0000@daum.com</td>
				<td>추방</td>
			</tr>
			<tr>
				<td>riovciz</td>
				<td>chosuk0000@kh.co.kr</td>
				<td>추방</td>
			</tr>
		</tbody>
	</table>
	<!-- 스터디 멤버 table 끝 -->
	
	
	<!-- 대표 사진  -->
	<p id="studyimagep">대표 사진</p>
	<button id="Fileupdatebtn" type="button" class="btn btn-purple">File Update</button>
	
	<div id="studyimage" class="image-container"> 
	
		<img alt="" src="./resources/assets/img/img_study7.png">
		
	</div>
	<!-- 대표 사진 끝 -->
	
	<!-- 스터디 정보 수정  -->
	<p id="creater">생성자</p>
	<input id="createrarea" readonly="readonly">
	<p id="studyname">스터디 이름</p>
	<input id="studynameupdate">
	<button id="samename" type="button" class="btn btn-purple">스터디 이름 중복 Check!</button>
	<p id="category">카테고리</p>
	<select id="cate">
		<c:forEach var="category" items="${category }">
			<option value="${category.cate_no }">${category.cate_name }</option>
		</c:forEach>
	</select>
	<p id="Max">최대 인원수</p>
	<select id="Max_member">
<%
	for(int i=1;i<31;i++){
%>
	<option value="<%=i%>"><%=i %>명</option>
<%
	}
%>
	</select>
	<p id="locsi">지역(시)</p>
	<select id="locationsi">
		
	</select>
	<p id="locgu">지역(구)</p>
	<select id="locationgu">
		
	</select>
	<p id="studyinfo">스터디 소개</p>
	<input id="studyinfot">
	<button id="update" type="button" class="btn btn-purple">Update!</button>
	
	
	
	
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	</div>
	<!--  메인 세션 끝 -->



</body>
<footer>
	<jsp:include page="../commond/communityFooter.jsp"></jsp:include>
</footer>
</html>