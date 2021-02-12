<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<link rel="stylesheet" href="./resources/css/mainstyle.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/studyHome.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>
</head>
<body>
<jsp:include page="../commond/communityHeader.jsp"></jsp:include>
<jsp:include page="../commond/communityLeftNavi.jsp"></jsp:include>
<jsp:include page="./rightInfo.jsp"></jsp:include>

	
	<!--main conternt 섹션-->
	<div class="main-section">
							
		<div id="studyImg"><img src="${ fileName }" onError="this.src='resources/img/no_image.png'"></div>
		<!--<img id="studyGif" src="./resources/assets/img/studdypeGif.gif"><span id="studyOneLineIntro"> ${ study.getS_name() } </span>-->
		<div id="studyOneLineIntro">
			<img class="quote" src="./resources/assets/img/studyHome_quote_left.png">
			${ study.s_info }
			<img class="quote" src="./resources/assets/img/studyHome_quote_right.png">
		</div>
		<div id="subMain">
			<div id="content">스터디 상세내용</div>
			<div id="studyContent">
				${ study.s_content }
			</div>
			<div id="content">대표 책 소개</div>
			
			<c:choose>
				<c:when test="${empty book.book_ismain }">
					<div id="studyBook"><img src="./resources/assets/img/nothingBook.png"></div>
				</c:when>
				<c:otherwise>
					<div id="bookContent">
						<div id="bookContentLeft">
							<div id="bookImg"><img src="${ book.book_img} "></div>
						</div>
						<div id="bookContentRight">
							<div id="bookTitle">${ book.book_title }</div>
							<div id="bookInfo">
								<div id="bookInfoLeft">
									저자<br><br>
									출판사<br><br>
									링크<br><br>
									<hr id="bookHR"><br>
									도서안내<br><br>
								</div>
								<div id="bookInfoRight">
									${ book.book_author }<br><br>
									${ book.book_publish }<br><br>
									<a href="${book.book_url }"
									target="_blank"><img id="link"
										src='resources/img/link-icon.png' /></a><input type="hidden"
									value="${book.book_url }"><br><br>
									<div id="bookExplan"><br>${ book.b_content }<br><br></div>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>	
			
	</div>
    
<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</body>
</html>