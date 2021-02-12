<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터띱 도서 목록 페이지</title>

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

<link rel="stylesheet" href="./resources/css/community/book/searchBook.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<script type="text/javascript">
	
	$(function() {	
		// 전달받은 도서 리스트 6번째부터 숨기기
		$(".book-info:gt(5)").hide();
		$("#detailBook").hide();
		
		// 왼쪽 페이징 클릭 이벤트
		$("#left-allow").click(function() {
			$("#register-section .book-info:eq(5)").show();
			$("#register-section .book-info:first").insertAfter("#register-section .book-info:last");
			$("#register-section .book-info:gt(4)").hide();
		});
		
		// 오른쪽 페이징 클릭 이벤트
		$("#right-allow").click(function() {
			$("#register-section .book-info:last").show();
			$("#register-section .book-info:last").insertBefore("#register-section .book-info:first");
			$("#register-section .book-info:gt(4)").hide();
		});
		
		// 도서 리스트 중 해당 도서 클릭 이벤트
		$(".book-info").click(function() {
			$("#main-section-top").children().eq(1).remove();
			$(".thisBook").removeClass("thisBook");
			$(this).addClass("thisBook");
			var appendBook = $(this).clone();
			appendBook.appendTo("#main-section-top");
			appendBook.addClass("append");
			$(".append .book-info-bottom").css("display", "inline-block");
			$("#detailBook").show();
 		});
		
		// 등록 여부 
		if($("#isMain").children().hasClass("firstMain") == true) {
			$("#isMain").children().first().remove();
			$("#detailBook").show();
		}
		
		$(document).on("click", ".append",  function() {
			var b_no = $(".append").children().first().val();
			location.href="bookDetailform.do?b_no="+b_no;
		});

	});
	
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	
	<!-- 메인 섹션----------------------------------------------------------------------------- -->
	<div class="main-section">
	<h3>스터디 도서 목록</h3>
		<!--메인 상단 세션 --------------------------------------------------------------------- -->
		<div id="main-section-top">
		<c:choose>
			<c:when test="${empty list }">
				<div id="no-list">
					<img src="./resources/img/no-exsist-book.png">
					<p>등록된 도서가 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div id="detailBook">
					<span>자세히 보기</span>
				</div>
				<div id="isMain">
					<div id="no-mainBook">
						<img src="./resources/img/no-exsist-book.png">
						<p>스터디 대표도서가 없습니다.</p>					
					</div>
					<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
						<c:if test="${list.get(i).getBook_ismain() eq 'Y' }">
							<div class="book-info thisBook append firstMain">
								<input type="hidden" name="b_no" value="${list.get(i).getB_no() }">
								<div class="book-info-top">
									<c:choose>
										<c:when test="${list.get(i).getBook_img() eq 'noImage'}">
											<img src="./resources/assets/img/icon_photoUpload.png">
										</c:when>
										<c:otherwise>
											<img src="${list.get(i).getBook_img() }" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="book-info-bottom">
									<p style="color:red;">&nbsp;[대표도서]</p>
									<p class="book_title_th">글제목 : ${list.get(i).getB_title() }</p>
									<p class="book_title_th">작성자 : ${writerMap.get(list.get(i).getB_writer()).getMem_id() }(${writerMap.get(list.get(i).getB_writer()).getMem_name() })</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
		<!-- 메인 상단 영역 종료 ----------------------------------------------------------------------------------------- -->
		
		<!-- 리스트 영역 시작 ------------------------------------------------------------------------------------------------- -->
		<div id="register-section">
			<c:if test="${not empty list}">
			<div class="allow" id="left-allow"><img src="./resources/img/left-allow.png"></div>
			<div class="allow" id="right-allow"><img src="./resources/img/right-allow.png"></div>
				<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
					<div class="book-info">
						<input type="hidden" name="b_no" value="${list.get(i).getB_no() }">
						<div class="book-info-top">
							<c:choose>
								<c:when test="${list.get(i).getBook_img() eq 'noImage'}">
									<img src="./resources/assets/img/icon_photoUpload.png">
								</c:when>
								<c:otherwise>
									<img src="${list.get(i).getBook_img() }" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="book-info-bottom">
						<c:if test="${list.get(i).getBook_ismain() eq 'Y' }">
							<p style="color:red;">&nbsp;[대표도서]</p>
						</c:if>
						<p class="book_title_th">글제목 : ${list.get(i).getB_title() }</p>
						<p class="book_title_th">작성자 : ${writerMap.get(list.get(i).getB_writer()).getMem_id() }(${writerMap.get(list.get(i).getB_writer()).getMem_name() })</p>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
		<!-- 리스트 영역 종료 ------------------------------------------------------------------------------------------------- -->
	</div>
	<!-- 메인 섹션 종료 --------------------------------------------------------------------------------------------- -->

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>