<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터띱 도서 검색 페이지</title>

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
[tooltip]:before {
    /* 여긴 건드리지 말 것 */
    content: attr(tooltip);
    position: absolute;
    opacity: 0;
    
    /* 변경가능 */
    transition: all 0.15s ease;
    padding: 10px;
    color: rgb(115, 98, 222);
    border-radius: 10px;
    box-shadow: 2px 2px 1px silver;    
    text-align:center;
}

[tooltip]:hover:before {
    /* 여긴 건드리지 말 것 */
    opacity: 0.9;
    
    /* 변경가능 */
    background: #fff;
    border:2px solid rgb(115, 98, 222);
    margin-top: 120px;
    margin-left: 45px;    
}

/* 안내 문구 영역에 마우스 올리면 텍스트 없어지게 하고싶을 때 
tooltip-persistent 요소 추가 할 것 */
[tooltip]:not([tooltip-persistent]):before {
    pointer-events: none;
}

/* 모달 CSS */
*,
:before,
:after {
  box-sizing: border-box;
  margin: 0;
  transition: 0.4s ease all;
}

/* body {
  background: #616161 url(https://images.unsplash.com/photo-1452716726610-30ed68426a6b?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=177c2914fe84d20069f207e27632acc9) center/cover no-repeat;
  height: 100vh;
  overflow: hidden;
  color: #fff; 
} */

.modal {
  height: 600px;
  width: 1200px;
  margin: auto;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
  top: 0;
  bottom: 0;
  left: 17%;
  right: 0;
  transition: 0.4s, box-shadow 0.3s 0.4s;
  font-family: Roboto;
  display:block;
  border-color:rgba(0,0,0,0.5);
  z-index:100;
}
.modal.hidden {
  box-shadow: none;
  transition: 0.4s, box-shadow 0s;
  opacity: 0;
  visibility: hidden;
}
.modal.hidden .form {
  top: 100%;
}
.modal.hidden .invite {
  top: -100%;
}
.modal.hidden .invite .close {
  height: 0;
  width: 0;
  top: 0;
  right: 0;
}

.form {
	background: rgba(71, 71, 71, 1);
	width: 60%;
	height: 100%;
	padding: 25px;
	position: absolute;
	top: 0;
	left: 0;
}
.invite {
  background: rgba(71, 71, 71, 1);
  width: 40%;
  height: 100%;
  padding: 25px;
  position: absolute;
  top: 0;
  left: 0;
}

.invite img {
	width:100%;
	height:100%;
	border:5px solid #f9f9f0;
	border-radius:10px;
	background:#f6f5f0;
}

#modal-top {
	width:100%;
	height:100px;
}

#modal-bottom {
	width:100%;
	height:480px;
}

#modal-textarea {
	float:left;
	width:60%;
	height:450px;
	padding:1%;
}

#modal-content {
	float:left;
	left:60%;
	width:40%;
	height:450px;
	padding:1%;
}

#modal-content img {
	width:20px;
	height:20px;
}

#modal-content textarea {
	width:450px;
}

.form input, textarea {
  background: rgba(255, 255, 255, 0.15);
  width: 100%;
  padding: 8px;
  margin: 15px 0;
  border: none;
  border-radius: 3px;
  outline: none;
  color: #fff;
  font-size: 15px;
}
.form input, textarea:-webkit-autofill {
  -webkit-box-shadow: 0 0 0px 500px #7a7a7a inset;
  -webkit-text-fill-color: #fff;
}

.form label {
  font: 500 14px Roboto;
  color: #fb5781;
}

.form button {
  background: linear-gradient(-45deg, #f857a6, #ff5858);
  padding: 10px 20px;
  border: none;
  border-radius: 21px;
  outline: none;
  overflow: hidden;
  position: absolute;
  padding:2% 5%;
  bottom: 30px;
  left: 50%;
  color: #fff;
  font-size: 18px;
  cursor: pointer;
  transform: translateX(-50%);
}
.form button:hover:before {
  left: 110%;
  transition: 0.3s;
}
.form button:before {
  content: "";
  background: rgba(255, 255, 255, 0.3);
  height: 100%;
  width: 65px;
  position: absolute;
  top: 0;
  left: -100%;
  transform: skew(-45deg);
  transition: 0s;
}

.invite {
  background: linear-gradient(-45deg, #f857a6, #ff5858);
  left: 60%;
}

.nope {
  background: #474747;
  padding: 10px 15px;
  border-radius: 3px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25);
  position: absolute;
  bottom: 30px;
  left: 50%;
  font-size: 12px;
  white-space: nowrap;
  cursor: pointer;
  transform: translateX(-50%);
  color:#fff;
}
.nope:hover {
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.25);
  transform: translateX(-50%);
}

.close {
  background: #474747;
  height: 30px;
  width: 30px;
  border: 3px solid #fff;
  border-radius: 50%;
  position: absolute;
  top: -1px;
  right: -1px;
  cursor: pointer;
  transition: 0.4s 0.3s;
}
.close:before, .close:after {
  content: "";
  background: #fff;
  height: 80%;
  width: 3px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(-45deg);
}
.close:after {
  transform: translate(-50%, -50%) rotate(45deg);
}
/* 모달 CSS 종료 */


.main-section {

}

#main-section-top {
	position:relative;
	width:100%;
	border:1px solid #fff;
}

#main-section-bottom {
	position:relative;
	width:100%;
	border:1px solid #fff;
}

#book-img-section {
	position:relative;
	display:inline-block;
	width:100%;
}

.divBox {
	position:relative;
	float:left;
	margin:2%;
	width:20%;
	border:5px solid #f9f9f0;
	border-radius:10px;
	background:#f6f5f0;
	box-shadow:9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px rgba(255, 255, 255, 0.5);
}

#book-img-section img {
	width:100%;
	height:340px;
}

#book-img-section img:hover {
	cursor:pointer;
}

#no-list {
	position:relative;
	width:30%;
	height:auto;
	left:35%;
}

#paging-section {
	position:relative;
	display:inline-block;
	width:100%;
	text-align:center;
}

.pageNumber {
	width:30px;
	height:50px;
	font-size:40px;
	border:2px solid rgb(115, 98, 222);
	border-radius:5px;
	cursor:pointer;
}

.show {
	background:rgb(115, 98, 222);
}
</style>
<script type="text/javascript">
	var bookList = [];		// 전달받은 도서 정보 리스트
	var pageSize = 12; 		// 한 페이지 수 
	var pageGroupSize = 5; 	// 페이징 당 페이지 수 
	var listLength = 0;		// 전달받은 도서 수
	
	$(function() {
	///////////////////////////////////////////////////////////////////////
		search();
		
		// 카카오 도서 검색 api
		$("#searchForm").submit(function() {
			$("#book-img-section").empty();
			$.ajax({
				method:"GET",
				url:"https://dapi.kakao.com/v3/search/book?sort=accuracy&page=3&size=50&query="+$("#bookName").val()+"&target=title&target=person",
				data:{ query: $("#bookName").val() },
				headers:{ Authorization: "KakaoAK 6e0eb818150f47faddc3398e2aef87b6" }
			})
			// 데이터 정제
			.done(function(msg) {
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
				
				console.log(msg);
				console.log(bookList);
				
				appendBookList(bookList);
				
			});
		});	
		
		// 모달 창 닫기 이벤트
		$(".close, .nope").on('click', function () {
			$('.modal').addClass('hidden');
		});
		
		// 도서 이미지 클릭 이벤트 (모달 띄우는 함수)
		$(document).on("click", ".divBox", function() {
			var bookNum = $(this).children().last().val(); // 도서 번호 			
			
			$("#title").val(bookList[bookNum][0]);
			$("#author").val(bookList[bookNum][1]);
			$("#publish").val(bookList[bookNum][2]);
			$("#link").attr("href", bookList[bookNum][4]);
			$("#book_img").attr("src", bookList[bookNum][3]);
			$("#input_book_img").val(bookList[bookNum][3]);
			$("#book_url").val(bookList[bookNum][4]);
			
			$("#b_title").val("");
			$("#content").val("");
			
			$('.modal').removeClass('hidden');
		})
		
		$(document).on("click", ".pageNumber", function() {
			var pageOrder = $(this).text();
			
			paging(listLength, pageOrder);
		});
		
	}); // 즉시 실행 종료

	// 도서 리스트 영역별로 정보 append
	function appendBookList(bookList) {
		listLength = bookList.length; // 전달받은 도서 수
		$("#paging-section").empty();
		if(listLength == 0) {
			$("#book-img-section").append(
				"<div id='no-list'>"+
					"<img src='resources/img/no-list.png'>"+
				"</div>"
			);
			return;
		}
		
		paging(listLength, 0);
		
		for(var i = 0; i < bookList.length; i++) {
			$("#book-img-section").append(
					"<div class='divBox' tooltip='도서 상세 정보 보기' tooltip-persistent data-backdrop='static'>"+
						"<img src='"+bookList[i][3]+"' onError=\"this.src='resources/img/no-image.png'\"/>"+
						"<input type='hidden' class='bookNum' value='"+i+"'>"+
					"</div>"
			);
		}
		$(".divBox:gt(11)").hide();
	}
	
	// 페이징 계산 및 append 함수
	function paging(listLength, clickPage) {
		
		if(clickPage == 0) {
			clickPage = 1;
		}
		
		var startBook = (clickPage - 1) * pageSize;			// 첫번째 도서
		var endBook = (clickPage * pageSize) - 1;				// 마지막 도서
		var pageGroup = Math.ceil(clickPage / pageGroupSize);	// 페이지 그룹
		var startPage = (pageGroup - 1) * pageGroupSize + 1;	// 첫페이지
		var endPage = pageGroup * pageGroupSize;				// 끝페이지
		var totalPageNum = (listLength / pageSize) + 1;			// 총페이지
		
		if(endPage > totalPageNum) {
			endPage = totalPageNum;
		}
		
		// 페이지 조건 처리
		if($("#paging-section").children().hasClass("pageNumber") == true) {
			$(".show").removeClass("show");
			$("#"+clickPage).addClass("show");
			$(".divBox").hide();
			for(var i = startBook; i <= endBook; i++) {
				$(".divBox").eq(i).show();
			}
		}else {
			appendPage(startPage, endPage);
		}
		
	}
	
	// 페이지 버튼 append 함수
	function appendPage(startPage, endPage) {
		for(var i = startPage; i <= endPage; i++) {
			$("#paging-section").append("<a class='pageNumber' id="+i+">"+i+"</a>");
		}
		$(".pageNumber:first").addClass("show");
	}
	
	// 검색창 함수
	function search() {
		//검색창 영역
		const input = document.querySelector(".finder_input");
		const finder = document.querySelector(".finder");
		const form = document.querySelector("#searchForm");

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
	}
	
	function validateSubmit() {
		var title = $("#b_title").val();
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

	<!-- 모달 영역 시작 -->
		<div class="modal hidden">
			<div class="form">
    			<form action="insertRegisterBook.do" onsubmit="return validateSubmit();" autocomplete="off" accept-charset="utf-8">
    				<input type="hidden" name="s_no" value="${study.s_no }">
    				<input type="hidden" name="b_writer" value="${login.mem_no }">
    				<input type="hidden" id="input_book_img" name="book_img" value="">
    				<div id="modal-top">
    					<label for="b_title">글 제목</label>
     					<input id="b_title" name="b_title" type="text"/>
    				</div>
    				<div id="modal-bottom">
    					<div id="modal-textarea">
    						<label for="content" >도서 설명글</label>
							<textarea id="content" rows="12" name="b_content"></textarea>
    					</div>
    					<div id="modal-content">
    						<label for="title">도서 이름</label>
      						<input id="title" type="text" name="book_title" value="" readonly="readonly" >
      				
      						<label for="author">저자</label>
      						<input id="author" type="text" name="book_author" value="" readonly="readonly">
      				
      						<label for="publish">출판사</label>
      						<input id="publish" type="text" name="book_publish" value="" readonly="readonly">
      				
      						<label for="link">링크&nbsp;</label>
      						<a id="link" href="" target="_blank"><img src='resources/img/link-icon.png'/><input id="book_url" type="hidden" name="book_url" value=""></a>
      						<button type="submit">등록</button>
    					</div>
    				</div>
      				
    			</form>
  			</div>
  			<div class="invite">
    			<img id="book_img" src="" onError="this.src='resources/img/no-image.png'" />
    			<div class="nope">다른 책 보러가기</div>
    			<div class="close" title="close"></div>
  			</div>
	</div>
	<!-- 모달 영역 종료 -->

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	<!-- 메인 섹션 시작 -->
	<div class="main-section">
	
		<!-- ----------------------------------------------------------------------------------- -->
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
								<input class="finder_input" id="bookName" type="text" placeholder="도서이름 또는 작가로 검색" name="book_title" />
							</div>
						</div>
					</div>
				</form>
				<!-- 검색창 form 종료 -->
				
			</div>
			<!--검색창 영역 종료 -->
			
		</div>
		<!-- 메인 섹션 상단 종료 -->
		
		<!-- ----------------------------------------------------------------------------------- -->
		
		<!-- 메인 섹션 중앙 시작 -->
		<div id="main-section-bottom">
			<div id='book-img-section'></div>
			<div id="paging-section"></div>
		</div>
		<!-- 메인 섹션 중앙 종료 -->
		
		<!-- ----------------------------------------------------------------------------------- -->

	</div>
	<!-- 메인 섹션 종료 -->
	
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>

</body>
</html>