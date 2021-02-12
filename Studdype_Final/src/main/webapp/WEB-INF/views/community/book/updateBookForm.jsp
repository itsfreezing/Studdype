<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터띱 도서 게시글 수정페이지</title>

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

<link rel="stylesheet" href="./resources/css/community/book/updateBookForm.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<script type="text/javascript">
	var b_no = 0;
	
	$(function() {
		b_no = $("#b_no").val();
	});
	
	function returnDetailPage() {
		location.href = "bookDetailform.do?b_no="+b_no;
	}
	
	function validateSubmit() {
		var title = $("#title").val();
		var content = $("#content").val();
		
		if( (title.trim().length==0) || (title==null) || (title.trim()=='') ) {
			alert("글제목을 작성해주세요.");
			return false;
		}else if(title.trim() > 500) {
			alert("글제목은 500자 이내로 작성해주세요.");
			return false;
		}else if( (content.trim().length==0) || (content.trim()=='') || (conetnt==null) ) {
			alert("도서 설명을 작성해주세요.");
			return false;
		}else {
			return true;
		}
	}
</script>
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	<!-- 메인섹션 시작 -->
	<div class="main-section">
		<c:choose>
			<c:when test="${empty bookDto }">
				<p>페이지 오류</p>
				<button onclick="returnDetailPage();">돌아가기</button>
			</c:when>
			<c:otherwise>
				<!-- 메인 섹션 상단(글제목영역) -->
				<form action="bookBoardUpdateBook.do" autocomplete="off" onsubmit="return validateSubmit();" accept-charset="utf-8">
					<input type="hidden" name="s_no" value="${study.s_no }">
					<input type="hidden" name="b_writer" value="${login.mem_no }">
					<div id="main-section-top">
						<table id="titleTable">
							<col width="700">
							<col width="250">
							<col width="100">
							<tr>
								<th style="font-size:25pt;"><input type="text" id="title" name="b_title" value="${bookDto.getB_title() }"></th>
								<th><input type="text" readonly="readonly" class="input_none"
									value="${writerNameMap.get(bookDto.getB_writer()).getMem_id()}(${writerNameMap.get(bookDto.getB_writer()).getMem_name() })"></th>
								<th style="font-size:13pt;"><fmt:formatDate value="${bookDto.getB_regdate() }" pattern="YYYY.MM.dd"/></th>
							</tr>
						</table>
					</div>

					<!-- 메인 섹션 중앙(도서 정보) -->
					<div id="main-section-mid">
						<input type="hidden" name="book_img" value="${bookDto.getBook_img() }">
						<div id="book-content">
							<input type="hidden" id="b_no" name="b_no" value="${bookDto.getB_no() }">
							<table id="info-table">
								<col width="200px"><col width="100px">
								<tr>
									<td rowspan="5"><img id="book-img" src="${bookDto.getBook_img() }"></td>
									<td colspan="2" style="font-size:21pt; font-weight:bold;"><input type="text" readonly="readonly" class="input_none" name="book_title"
										value="${bookDto.getBook_title()}"></td>
								</tr>
								<tr>
									<th>저자&nbsp;</th>
									<td><input type="text" readonly="readonly" class="input_none" name="book_author"
										value="${bookDto.getBook_author() }"></td>
								</tr>
								<tr>
									<th>출판사&nbsp;</th> 
									<td><input type="text" readonly="readonly" class="input_none" name="book_publish"
										value="${bookDto.getBook_publish() }"></td>
								</tr>
								<tr>
									<td>링크&nbsp;</td>
									<td><a href="${bookDto.getBook_url() }" target="_blank">
											<img id="link" src='resources/img/link-icon.png' />
									</a> <input type="hidden" value="${bookDto.getBook_url() }">
									</td>
								</tr>
							</table>
						</div>
						<div id="book_textarea">
							<table>
								<tr>
									<th style="color:black;">도서 설명</th>
								</tr>
								<tr>
									<th><textarea style="width: 100%;" rows="15" id="book_board_content" 
									name="b_content">${detailBookDto.getB_content() }</textarea></th>
								</tr>
							</table>
						</div>
						<div id="button-area">
							<button class="update-btn-group" type="submit">완료</button>
							<button class="update-btn-group" type="button" onclick="returnDetailPage();">취소</button>
						</div>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 메인섹션 종료 -->

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>

</body>
</html>