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
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

 <script type="text/javascript">


</script>
</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<form>
	<div>
   		<h1>비밀번호 찾기</h1>
   		<table>
   			<col width="200px"><col width="500px"><col width="100px">
   			<tr>
   				<td><label for="email">이메일</label></td>
   				<td><input type="text" id="email" name="email" placeholder="이메일 (email@studdype.com)"></td>
   				<td><input type="button" value="전송"></td>
   			</tr>
   			<tr>
   				<td><label for="chkNum">인증번호</label></td>
   				<td><input type="text" id="chkNum" name="chkNum" placeholder="인증번호 입력"></td>
   				<td><input type="button" value="확인"></td>
   			</tr>   	
   			   
   		</table>
   		<span>인증완료</span>
   		
   </div>
   
   <div>
   		<input type="button" value="홈" onclick="location.href='findpw.do'">
   		<input type="button" value="비밀번호 찾기">
   </div>
	</form>
	<jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
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