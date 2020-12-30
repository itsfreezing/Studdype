<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ComunityHome</title>

	<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
	<link rel="stylesheet" href="./resources/assets/css/animate.css">
	<link rel="stylesheet" href="./resources/assets/css/normalize.css">
	<link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/assets/css/responsive.css">
    <link rel="stylesheet" href="./resources/css/studdype/createStuddype.css">
    <link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>
	
</head>
<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	
	 
     <!--main conternt 섹션-->
     <div class="main-section">
       <form action="createStuddype.do" method="post">
       		<span>대표사진<br><input id="main-photo" type="file" name="file"></span>
       		<br>
       		<span>생성자<input type="text" name="mem_name"></span>
       		<br>
       		<span>스터디 제목<input type="text" name="s_name"></span>
       		<br>
       		<span>카테고리
       		<select name="카테고리를 선택해주세요.">
       			<option value="IT">
       			<option value="자격증">
       			<option value="공무원">
       			<option value="뷰티">
       		</select></span>
       		<br>
       		<span>최대 인원수
       		<select name="인원수를 선택해주세요.">
       			<c:forEach begin="1" end="15" var="cnt" step="1">
       				<option value=>${cnt }</option>
       			</c:forEach>
       		</select></span>
       </form>
        
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
   
    <jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
</body>


</html>