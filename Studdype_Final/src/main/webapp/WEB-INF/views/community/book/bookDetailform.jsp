<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
.main-section {
	width:60%;
	margin-right:10%;
}

#main-section-top {
	position:relative;
	display:inline-block;
	width:100%;
	padding:1%;
	border-top:2px solid #868e96;
	border-radius:5px;
}

#main-section-mid {
	position:relative;
	display:inline-block;
	width:100%;
	border-top:2px solid #868e96;
	border-bottom:2px solid #868e96;
	padding:1%;
}

#book-content {
	position:relative;
	float:right;
	width:60%;
	height:500px;
	padding:1%;
	margin:1%;
}

#main-section-mid table {
	width:100%;
	border-collapse: separate;
	border-spacing: 0 20px;
}

#book-content table th,td {
	padding:1%;
}

#book-content a {
	color:#1a0dab;
}

#book-img {
	position:relative;
	float:left;
	width:35%;
	height:500px;
	margin:1%;
	
}

#main-section-mid img {
	height:498px;
	border:5px solid #f9f9f0;
	border-radius:10px;
	background:#f6f5f0;
	box-shadow:9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px rgba(255, 255, 255, 0.5);
}

input {
	border:none;
	font-weight:bolder;
}

textarea {
	border:2px solid #868e96;
}

table button {
	width:20%;
	height:30px;
	border:2px solid #868e96;
	border-radius:20px;
	font-size:20px;
	color:#868e96;
	font-weight:bolder;
	background:#fff;
}

table button:hover {
	cursor:pointer;
	background:rgb(115, 98, 222);
	color:#fff;
	transition:0.5s ease all;
}

</style>

<script type="text/javascript">

</script>
</head>
<body>
	
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	<!-- 메인섹션 시작 -->
	<div class="main-section">
		<c:choose>
			<c:when test="${empty detailBookDto }">
				<c:out value=""></c:out>
			</c:when>
			<c:otherwise>
				<form action="" autocomplete="on"></form>
				<!-- 메인 섹션 상단(글제목영역) -->
				<div id="main-section-top">
					<table  style="text-align:center;">
						<col width="800"><col width="200"><col width="100">
						<tr>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성시간</th>
						</tr>
						<tr>
							<th><input type="text" name="b_title" value="${detailBookDto.getB_title() }"></th>
							<th><input type="text" name="b_writer" value="${writerNameMap.get(detailBookDto.getB_writer()).getMem_id()}(${writerNameMap.get(detailBookDto.getB_writer()).getMem_name() })"></th>
							<th><fmt:formatDate value="${detailBookDto.getB_regdate() }" timeStyle="YYYY-MM-DD"/></th>
						</tr>
					</table>
				</div>
				
				<!-- 메인 섹션 중앙(도서 정보) -->
				<div id="main-section-mid">
					<div id="book-img">
						<img src="${detailBookDto.getBook_img() }">
					</div>
					<div id="book-content">
					<table>
						<tr>
							<th>책이름&nbsp;</th>
							<th><input type="text" name="book_title" value="${detailBookDto.getBook_title()}"></th>
						</tr>
						<tr>
							<th>저자&nbsp;</th>
							<th><input type="text" name="book_author" value="${detailBookDto.getBook_author() }"></th>
						</tr>
						<tr>
							<th>출판사&nbsp;</th>
							<th><input type="text" name="book_publish" value="${detailBookDto.getBook_publish() }"></th>
						</tr>
						<tr>
							<th>상세 URL&nbsp;</th>
							<th><a href="${detailBookDto.getBook_url() }" target="_blank">${detailBookDto.getBook_url() }</a></th>
						</tr>
						<tr>
							<th style="vertical-align: top;">도서 설명</th>
							<th><textarea style="width:100%;" rows="10" name="b_content" readonly="readonly">${detailBookDto.getB_content() }"</textarea></th>
						</tr>
						<tr style="text-align:right;">
							<c:choose>
								<c:when test="${login.getMem_no() eq detailBookDto.getB_writer() }">
									<td colspan="3">
										<button onclick="location.href=''">수정</button>
										<button onclick="location.href=''">삭제</button>
										<button onclick="location.href='searchBook.do'">목록</button>
									</td>
								</c:when>
								<c:otherwise>
									<td colspan="3"><button onclick="location.href='searchBook.do'">목록</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
					</div>
				</div>
				
			</c:otherwise>
			
		</c:choose>
	</div>
	<!-- 메인섹션 종료 -->
	
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
	
</body>
</html>