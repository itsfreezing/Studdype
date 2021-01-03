<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CommunityHome</title>

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


<!--  freeboard mainsection css -->
<link rel="stylesheet" href="./resources/css/community/freeboard/mainsection.css">

<!-- freeboard css -->
<link rel="stylesheet" href="./resources/css/community/freeboard/freeboard.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>



<script type="text/javascript" >


 

 
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

 	<div class="main-section3">
		<div class="titleDiv">
			<span class="title">${dto.b_title }</span>
			<span class="regdate"><fmt:formatDate value="${dto.b_regdate }" pattern="YYYY.MM.dd HH:mm"/></span>
		</div>
		<div class="writerDiv">
			<span class="writer"> ${writer }</span>
			<span class="cnt">조회수
				<span class="cnt2">${dto.b_cnt }</span>
			</span>
		</div>
		<div class="contentDiv">${dto.b_content }</div>
		<div class="btnDiv">
		</div>
		
		<div class="replyBox" >
			<div class="replyTitle">
				댓글(2) 등록순 최신순
			</div>
			<ul class="replyList">
				<li class="replyItem">
					<div class="reply_area">
						<div class="reply_writer_box">작성자</div>
						<div class="reply_comment_box">내용</div>
						<div class="reply_info_box">2020.12.24 11:43 답글쓰기 </div>
					</div>					
				</li>
				<hr>
				<li class="replyItem">
					<div class="reply_area">
						<div class="reply_writer_box">작성자</div>
						<div class="reply_comment_box">내용</div>
						<div class="reply_info_box">2021.01.23 01:23 답글쓰기</div>
					</div>					
				</li>
				<hr>
			</ul>
			
			
			<div class="replyWrite"  >
				<p class="writerId">작성자</p>
				<textarea class="write_content" placeholder="댓글을 남겨보세요" style="width: 100%;"></textarea>
				<br>등록
			</div>
		</div>
 	</div>
 	
 

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>