<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>

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
	
}

#main-section-top {
	display: block;
	position: relative;
	width: 100%;
	border: 1px solid black;
}

.main-section-bottom {
	display: block;
	position: relative;
	width: 100%;
	border: 1px solid red;
	display:none;
}

#register-section {
	border:1px solid red;
}

/* 검색창 영역 */
.search-container {
	text-align: center;
	color: #2c3e50;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	margin-top:10%;
}

form {
	transition: all 0.5s;
	position: absolute;
	top: 20%;
	margin-top: 2%;
	transform: translateY(-50%);
}

.finder {
	border: 1px solid #fff;
	background-color: #f6f5f0;
	border-radius: 15px;
	padding: 8px;
	box-shadow: 9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px
		rgba(255, 255, 255, 0.5);
}

.finder_outer {
	display: flex;
	width: 500px;
	padding: 1.5rem 2rem;
	border-radius: 10px;
	box-shadow: inset 10px 10px 15px -10px #c3c3c3, inset -10px -10px 15px
		-10px #ffffff;
}

.finder_inner {
	display: flex;
	align-items: center;
	position: relative;
	flex: 1;
}

.finder_form {
	flex: 1;
	height: calc(50% + 3rem);
}

.finder_input {
	height: calc(100% + 3rem);
	border: none;
	width: 100%;
	background-color: transparent;
	outline: none;
	font-size: 1.5rem;
	letter-spacing: 0.75px;
}

.finder_icon {
	width: 40px;
	height: 40px;
	margin-right: 1rem;
	transition: all 0.2s;
	box-shadow: inset 0 0 0 20px #292929;
	border-radius: 50%;
	position: relative;
}

.finder_icon:after, .finder_icon:before {
	display: block;
	content: "";
	position: absolute;
	transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.finder_icon:after {
	width: 10px;
	height: 10px;
	background-color: #292929;
	border: 3px solid #f6f5f0;
	top: 50%;
	position: absolute;
	transform: translateY(-50%);
	left: 0px;
	right: 0;
	margin: auto;
	border-radius: 50%;
}

.active .finder_icon:after {
	border-width: 10px;
	background-color: #f6f5f0;
}

.finder_icon:before {
	width: 4px;
	height: 13px;
	background-color: #f6f5f0;
	top: 50%;
	left: 20px;
	transform: rotateZ(45deg) translate(-50%, 0);
	transform-origin: 0 0;
	border-radius: 4px;
}

.active .finder_icon:before {
	background-color: #292929;
	width: 6px;
	transform: rotateZ(45deg) translate(-50%, 25px);
}

.processing .finder_icon {
	transform-origin: 50%;
	animation: spinner 0.3s linear infinite;
	animation-delay: 0.5s;
}

.active .finder_icon {
	transform: translateY(-5px);
}

@
keyframes spinner { 0% {
	transform: rotateZ(45deg);
}
100
%
{
transform
:
rotateZ(
405deg
);
}
}

#no-list {
	position:relative;
	width:20%;
	left:40%;
	margin-top:2%;
	opacity:0.8;
}

#no-list-comment {
	position:relative;
	width:50%;
	left:25%;
	margin-top:1%;
	text-align:center;
	font-weight:bolder;
	font-size:25px;
	opacity:0.8;
}

.book-info {
	position:relative;
	width:45%;
	margin:1%;
	border:1px solid black;
}

.book-info-left {
	position:relative;
	width:45%;
	margin:1%;
	border:1px solid blue;
	height:600px;
}



.book-info-right {
	position:relative;
	width:45%;
	margin:1%;
	border:1px solid red;
	height:600px;
}

.book-info-height {
	position:relative;
	width:90%;
	margin:1%;
	border:1px solid green;
	height:200px;
}
/* ************************************************************ */
</style>
<script type="text/javascript">
	$(function() {
		
		$("#register-search").click(function() {
			$("#new-section").hide();
			$("#register-section").show();
		});

		$("#new-search").click(function() {
			$("#register-section").hide();
			$("#new-section").show();
		});
		
		///////////////////////////////////////////////////////////////////////
		
		// 검색창 영역
		///////////////////////////////////////////////////////////////////////
		const input = document.querySelector(".finder_input");
		const finder = document.querySelector(".finder");
		const form = document.querySelector("form");

		input.addEventListener("focus", () => {
		  finder.classList.add("active");
		});

		input.addEventListener("blur", () => {
		  if (input.value.length === 0) {
		    finder.classList.remove("active");
		  }
		});

		form.addEventListener("submit", (ev) => {
		  ev.preventDefault();
		  finder.classList.add("processing");
		  finder.classList.remove("active");
		  input.disabled = true;
		  setTimeout(() => {
		    finder.classList.remove("processing");
		    input.disabled = false;
		    if (input.value.length > 0) {
		      finder.classList.add("active");
		    }
		  }, 1000);
		});

		$("form").on("submit", function() {	
			$("")
		});
		
	});

</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	<!-- 메인 섹션----------------------------------------------------------------------------- -->
	<div class="main-section">
	<h3>스터디 도서 검색</h3>
		<!--메인 상단 세션 --------------------------------------------------------------------- -->
		<div id="main-section-top">
		
			<!-- 검색창 영역 ----------------------------------------------------------------- -->
			<div class="search-container">
				<!-- 검색창 form----------------------------------------------------------------- -->
				<form autocomplete="off" action="searchBookList.do">
					<div class="finder">
						<div class="finder_outer">
							<div class="finder_inner">
								<div class="finder_icon" ref="icon"></div>
								<input class="finder_input" type="text" name="book_title" />
							</div>
						</div>
					</div>
				</form>
				<!-- ----------------------------------------------------------------- -->
			</div>
			<!--검색창 영역 종료 -------------------------------------------------------------------- -->

		</div>
		<!-- 메인 상단 영역 종료 ----------------------------------------------------------------------------------------- -->
		
		<!-- 리스트 영역 시작 ------------------------------------------------------------------------------------------------- -->
		<div id="register-section">
			<c:choose>
				<c:when test="${empty list }">
					<div id="no-list">
						<img src="https://image.freepik.com/free-vector/red-prohibited-sign_1284-42862.jpg">
					</div>
					<div id="no-list-comment">
						<p>등록된 도서가 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
						<div class="book-info">
							<div class="book-info-left">
								<img src="${list.get(i).getBook_url }">
							</div>
							<div class="book-info-right">
								<table>
									<tr>
										<th>도서 이름  </th>
										<th>${list.get(i).getBook_title }</th>
									</tr>
									<tr>
										<th>작가  </th>
										<th>${list.get(i).getBook_author }</th>
									</tr>
									<tr>
										<th>출판사  </th>
										<th>${list.get(i).getBook_publish }</th>
									</tr>
									<tr>
										<th>도서 상세정보  </th>
										<th>${list.get(i).getBook_url }</th>
									</tr>
								</table>
							</div>
							<div class="book-info-bottom">
								<table>
									<tr>
										<th>제목  </th>
										<th>${list.get(i).getB_title }</th>
									</tr>
									<tr>
										<th>${list.get(i).getB_writer }</th>
									</tr>
								</table>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 리스트 영역 종료 ------------------------------------------------------------------------------------------------- -->
	</div>
	<!-- 메인 섹션 종료 --------------------------------------------------------------------------------------------- -->

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>