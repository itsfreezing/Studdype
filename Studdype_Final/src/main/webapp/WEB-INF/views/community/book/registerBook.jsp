<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

.search-container form {
	transition: all 0.5s;
	position: absolute;
	top: 10%;
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
	font-size: 1.2rem;
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
/* 검색창 CSS 종료 */
.main-section {
	border:1px solid black;
}

#main-section-top {
	position:relative;
	width:100%;
	border:1px solid red;
}

#main-section-mid {
	position:relative;
	width:100%;
	border:1px solid blue;
}

#main-section-bottom {
	position:relative;
	width:100%;
	border:1px solid gray;
}

#paging-section {
	position:relative;
	width:100%;
	margin:1%;
	text-align:center;
}

#paging-section a {
	font-size:40px;
	margin:1%;
	background:#fff;
	color:#868e96;
	border:3px solid #fff;
	border-radius:10px;
	padding-bottom:0.5%;
}

#paging-section a:hover {
	cursor:pointer;
	background:rgb(115, 98, 222);
	color:#fff;
	transition:0.3s ease all;
}

.bookList-section {
	position:relative;
	display:inline-block;
	width:100%;
	margin:1%;
	border:1px solid gold;
}

.bookList-img-section {
	position:relative;
	float:left;
	margin-right:1%;
	width:15%;
	height:250px;
	border:1px solid red;
}

.bookList-img-section img {
	width:100%;
	margin:1%;
	height:248px;
}

.bookList-content-section {
	position:relative;
	float:left;
	margin-right:1%;
	width:70%;
	height:250px;
	border:1px solid blue;
}

.bookList-section form{
	position:relative;
	width:100%;
}

.bookList-content-section table {
	width:100%;
	border-collapse: separate;
	border-spacing: 0 10px;	
	table-layout:fixed;
	white-space:nowrap;
	text-overflow:ellipsis;
}

#link-icon {
	width:20px;
	height:20px;
}

.button-section {
	position:relative;
	float:left;
	margin-right:1%;
	width:10%;
	height:250px;
	border:2px solid rgb(115, 98, 222);
	text-align:center;
	color:#868e96;
}

.button-section span {
	position:relative;
	top:40%;
	font-size:25px;
	font-weight:bolder;
}

.button-section:hover {
	color:#fff;
	background:rgb(115, 98, 222);
	transition:0.3s ease all;
	cursor:pointer;
}
</style>

<script type="text/javascript">
	var bookList = [];
	$(function() {
	///////////////////////////////////////////////////////////////////////
		//검색창 영역
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
		//////////////////검색창 JS 종료
		
		// 카카오 도서 검색 api
		$("#searchForm").submit(function() {
			$("#main-section-mid").empty();
			$.ajax({
				method:"GET",
				url:"https://dapi.kakao.com/v3/search/book?sort=accuracy&page=1&size=40&query="+$("#bookName").val()+"&target=title&target=person",
				data:{ query: $("#bookName").val() },
				headers:{ Authorization: "KakaoAK 6e0eb818150f47faddc3398e2aef87b6" }
			})
			
			// 데이터 정제
			.done(function(msg) {
				/* console.log(msg);
				console.log(msg.documents[4].authors[0]); 	// 첫번째 작가 가져오기
				console.log(msg.documents[4].publisher);	// 출판사
				console.log(msg.documents[4].thumbnail);	// 이미지 url
				console.log(msg.documents[4].title);		// 도서 제목
				console.log(msg.documents[4].url);			// 도서 상세 url
				console.log(msg.documents.length);			// 배열 길이 */
				
				bookList = [];
				var book_title = "";
				var book_author ="";
				var book_publish = "";
				var book_img = "";
				var book_url = "";
				
				for(var i = 0; i < msg.documents.length; i++) {
					var bookDto = [];
					bookDto.push(msg.documents[i].title);		// 0
					bookDto.push(msg.documents[i].authors[0]);	// 1
					bookDto.push(msg.documents[i].publisher);	// 2
					bookDto.push(msg.documents[i].thumbnail);	// 3
					bookDto.push(msg.documents[i].url);			// 4
					bookList.push(bookDto);
				}
				
				console.log(bookList[0]);
				console.log(bookList[0][0]);
				
				appendBookList(bookList);
				
			});
		});
	});
	
	// 도서 리스트 영역별로 정보 append
	function appendBookList(bookList) {
		for(var i = 0; i < bookList.length; i++) {
			$("#main-section-mid").append(
					"<div class='bookList-section'>"+
						"<form>"+
							"<div class='bookList-img-section'>"+
								"<img class='bookList-img'src='"+bookList[i][3]+"'>"+
							"</div>"+
							"<div class='bookList-content-section'>"+
								"<table>"+
									"<colgroup>"+
										"<col width='20%'/><col width='80%'/>"+
									"</colgroup>"+
									"<tr>"+
										"<th>도서 이름</th>"+
										"<th>"+bookList[i][0]+"</th>"+
									"</tr>"+
									"<tr>"+
										"<th>저자</th>"+
										"<th>"+bookList[i][1]+"</th>"+
									"</tr>"+
									"<tr>"+
										"<th>출판사</th>"+
										"<th>"+bookList[i][2]+"</th>"+
									"</tr>"+
									"<tr>"+
										"<th>도서 상세 정보</th>"+
										"<th><div style=''display', 'inline-block''><a href='"+bookList[i][4]+"' target='_blank'><img id='link-icon' src='resources/img/link-icon.png'></a><div></th>"+
									"</tr>"+
								"</table>"+
							"</div>"+
						"</form>"+
						"<div class='button-section'><span>등록</span></div>"+
					"</div>"
			);
		}
	}
</script>

</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	<!-- 메인 섹션 시작 -->
	<div class="main-section">
	
		<!-- 메인 섹션 상단 시작 -->
		<div id="main-section-top">
		
			<!-- 검색창 영역 시작 -->
			<div class="search-container">
			
				<!-- 검색창 form 시작 -->
				<form autocomplete="off" id="searchForm">
					<div class="finder">
						<div class="finder_outer">
							<div class="finder_inner">
								<div class="finder_icon" ref="icon"></div>
								<input class="finder_input" id="bookName" type="text" placeholder="검색할 도서 이름을 작성해주세요." name="book_title" />
							</div>
						</div>
					</div>
				</form>
				<!-- 검색창 form 종료 -->
				
			</div>
			<!--검색창 영역 종료 -->
			
		</div>
		<!-- 메인 섹션 상단 종료 -->
		
		<!-- 메인 섹션 중앙 시작 -->
		<div id="main-section-mid">
		
<%-- 			<!-- 도서 리스트 영역 시작 -->
			<div class="bookList-section">
				<form>
					<div class="bookList-img-section">
						<img class="bookList-img" src="">
					</div>
					<div class="bookList-content-section">
						<table>
							<col width="100">
							<tr>
								<th>도서 이름</th>
								<th>~~~~~~</th>
							</tr>
							<tr>
								<th>저자</th>
								<th>~~~~~~</th>
							</tr>
							<tr>
								<th>출판사</th>
								<th>~~~~~~</th>
							</tr>
							<tr>
								<th>상세 URL</th>
								<th>~~~~~~</th>
							</tr>
						</table>
					</div>
				</form>
				<!-- 등록 버튼 영역 시작 -->
				<div class="button-section"><span>등록</span></div>
				<!-- 등록 버튼 영역 종료 -->				
			</div>
			<!-- 도서 리스트 영역 종료 --> --%>
			
		</div>
		<!-- 메인 섹션 중앙 종료 -->
		
		<!-- 메인 섹션 하단 시작 -->
		<div id="main-section-bottom">
			<!-- 페이징 영역 시작 -->
			<div id="paging-section">
				<a href=""><</a>
				<div class="pageNum" style="display:inline-block;"></div>
				<a href="">></a>
			</div>
			<!-- 페이징 영역 종료 -->
		</div>
		<!-- 메인 섹션 하단 종료 -->
		
	</div>
	<!-- 메인 섹션 종료 -->
	
	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>

</body>
</html>