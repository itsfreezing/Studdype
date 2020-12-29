<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meet Detail Page</title>

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
    <link rel="stylesheet" href="./resources/css/community/meet.css">
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>

</head>
<body>
	<jsp:include page="../../commond/studdypeHeader.jsp"></jsp:include>
	<jsp:include page="../../comunitycommon/studyleftnavi.jsp"></jsp:include>
	
	
     <!--main conternt 섹션-->
     <div class="main-section">
     	
     	<!-- 모임 상세페이지 -->
     	<!-- form의 action은 updateform으로 넘어가는 용도 -->
        <form action="meetupdateform.do" method="post">
	        <table border="1" id="meetInsertTable">
	        	<tr>
	        		<th colspan="2">작성자:&nbsp;홍길동</th>
	        		<th colspan="4">모임날짜:&nbsp;2021년&nbsp;1월&nbsp;1일</th>
	        		<th colspan="4">모임시간:&nbsp;오후2시</th>
	        	</tr>
	        	<tr>
	        		<th colspan="5">모집시작일:&nbsp;2020년&nbsp;12월&nbsp;25일</th>
	        		<th colspan="5">모집마감일:&nbsp;2020년&nbsp;12월&nbsp;31일</th>
	        	</tr>
	        	<tr>
	        		<th colspan="10">제목:&nbsp;홍길동의 스터디 첫 정모</th>
	        	</tr>
	        	<tr>
	        		<th colspan="10">장소:&nbsp;스타벅스 대치사거리점</th>
	        	</tr>
	        	<tr>
					<td colspan="5">
						<textarea rows="30" class="meetInsertInput" readonly>인기만점 홍길동의 2021 스터디 첫 정모 참가인원 모집합니다! 오른쪽 투표함에서 참가/불참가 투표 부탁드리며, 참석 결정 하신 분들은 혹시 못오게 되시면 댓글로 미리 말씀 부탁드립니다!
						</textarea>
					</td>
					
					<!-- 투표 -->
					<th colspan="5" id="vote_text" align="center">참가여부<br><br><br>
						<input type="radio" name="fruit" value="apple">참석<br><br>
      					<input type="radio" name="fruit" value="banana">불참석<br><br> 						
			        	<input type="button" value="투표하기" class="submitBtn vote" onclick="">
					</th>
	        </table>
	        <div>
		        <button class="submitBtn" id="detailBtn_updateform">수정</button>&nbsp;&nbsp;
		        <input type="button" value="삭제" class="submitBtn" id="detailBtn_delete" onclick="location.href='meetlist.do'">
		    </div>
        </form>
    </div>
    
    <jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>