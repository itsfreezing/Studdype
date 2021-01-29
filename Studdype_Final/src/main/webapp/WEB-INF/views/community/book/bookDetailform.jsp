<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터띱 도서 게시판</title>

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

<link rel="stylesheet" href="./resources/css/community/book/bookDetailform.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<style type="text/css">
.main-section {
	width: 60%;
	margin-right: 10%;
}

#main-section-top {
	position: relative;
	display: inline-block;
	width: 100%;
	padding: 1%;
	border-top: 2px solid #868e96;
	border-radius: 5px;
}

#main-section-mid {
	position: relative;
	display: inline-block;
	width: 100%;
	border-top: 2px solid #868e96;
	border-bottom: 2px solid #868e96;
	padding: 1%;
}

#book-content {
	position: relative;
	float: right;
	width: 100%;
	height: 500px;
	padding: 1%;
	margin: 1%;
}

#main-section-mid table {
	width: 100%;
	margin-top:-40px;
	border-collapse: separate;
	border-spacing: 0 20px;
}

#book-img {
	left:12%;
	width:180px;
	height: 250px;
	border: 5px solid #f9f9f0;
	border-radius: 10px;
	background: #f6f5f0;
	box-shadow: 9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px
		rgba(255, 255, 255, 0.5);
}

.main-section input {
	border: none;
	font-weight: bolder;
	width:100%;
}

.main-section textarea {
	border: 2px solid #868e96;
}

#button-area button {
	width: 12%;
	height: 30px;
	float:right;
	margin-left:10px;
	border: 2px solid #868e96;
	border-radius: 20px;
	font-size: 20px;
	color: #868e96;
	font-weight: bolder;
	background: #fff;
}

#button-area button:hover {
	cursor: pointer;
	background: rgb(115, 98, 222);
	color: #fff;
	transition: 0.5s ease all;
}

#link {
	width: 20px;
	height: 20px;
}
#isMain {
	color:#6f42c1;
	font-size:20px;
	font-weight:bolder;
}
</style>

<script type="text/javascript">
	var b_no = 0;
	$(function() {
		b_no = $("#b_no").val();	
	});
	
	// 도서 게시글 삭제 함수
	function deleteBook() {
		location.href="deleteBook.do?b_no="+b_no;
	}
	
	function updateBookForm() {
		location.href="updateBookForm.do?b_no="+b_no;
	}
	
	function returnList() {
		location.href="searchBook.do";
	}
</script>
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	<!-- 메인섹션 시작 -->
	<div class="main-section">
		<c:choose>
			<c:when test="${empty detailBookDto }">
				<p>페이지 오류</p>
				<button onclick="returnList()">돌아가기</button>
			</c:when>
			<c:otherwise>
				<!-- 메인 섹션 상단(글제목영역) -->
				<div id="main-section-top">
					<table>
						<col width="800">
						<col width="200">
						<col width="100">
						<tr>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성시간</th>
						</tr>
						<tr>
							<th><input type="text"
								value="${detailBookDto.getB_title() }"></th>
							<th><input type="text"
								value="${writerNameMap.get(detailBookDto.getB_writer()).getMem_id()}(${writerNameMap.get(detailBookDto.getB_writer()).getMem_name() })"></th>
							<th><fmt:formatDate value="${detailBookDto.getB_regdate() }"
									timeStyle="YYYY-MM-DD" /></th>
						</tr>
					</table>
				</div>

				<!-- 메인 섹션 중앙(도서 정보) -->
				<div id="main-section-mid">
					<div id="book-content">
						<input type="hidden" id="b_no" value="${detailBookDto.getB_no() }">
						<table>
							<tr>
								<th>도서 이름&nbsp;</th>
								<th><input type="text"
									readonly="readonly" value="${detailBookDto.getBook_title()}">
									<c:if test="${detailBookDto.getBook_ismain() eq 'Y' }">
										<span id="isMain">&nbsp;대표도서</span>
									</c:if>
								</th>
								<td rowspan="4">
									<img id="book-img" src="${detailBookDto.getBook_img() }">
								</td>
							</tr>
							<tr>
								<th>저자&nbsp;</th>
								<th><input type="text"
									readonly="readonly" value="${detailBookDto.getBook_author() }"></th>
							</tr>
							<tr>
								<th>출판사&nbsp;</th>
								<th><input type="text"
									readonly="readonly" value="${detailBookDto.getBook_publish() }"></th>
							</tr>
							<tr>
								<th>링크&nbsp;</th>
								<th><a href="${detailBookDto.getBook_url() }"
									target="_blank"><img id="link"
										src='resources/img/link-icon.png' /></a><input type="hidden"
									value="${detailBookDto.getBook_url() }"></th>
							</tr>
							<tr>
								<th style="vertical-align: top;">도서 설명</th>
								<th colspan="2"><textarea style="width: 100%;" rows="10"
										readonly="readonly">${detailBookDto.getB_content() }</textarea></th>
							</tr>
						</table>
					</div>		
				</div>
			</c:otherwise>

		</c:choose>
		<div id="button-area">
			<c:if test="${login.getMem_no() eq detailBookDto.getB_writer() }">
				<button onclick="updateBookForm();">수정</button>
				<button onclick="deleteBook();">삭제</button>
			</c:if>
				<button onclick="location.href='searchBook.do'">목록</button>
		</div>
	</div>
	<!-- 메인섹션 종료 -->

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>

</body>
</html>