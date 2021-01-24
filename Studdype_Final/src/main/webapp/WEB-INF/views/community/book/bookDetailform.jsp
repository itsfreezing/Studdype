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
<link rel="stylesheet" href="./resources/css/style.css">
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

					<div id="book-img">
						<img src="${detailBookDto.getBook_img() }">
					</div>
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
								<th><textarea style="width: 100%;" rows="10"
										readonly="readonly">${detailBookDto.getB_content() }</textarea></th>
							</tr>
							<tr style="text-align: right;">
								<c:choose>
									<c:when
										test="${login.getMem_no() eq detailBookDto.getB_writer() }">
										<td colspan="3">
											<button onclick="updateBookForm();">수정</button>
											<button onclick="deleteBook();">삭제</button>
											<button onclick="location.href='searchBook.do'">목록</button>
										</td>
									</c:when>
									<c:otherwise>
										<td colspan="3">
											<button onclick="location.href='searchBook.do'">목록</button>
										</td>
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