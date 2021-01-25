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
<link rel="stylesheet" href="./resources/css/mainstyle.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">

<link rel="stylesheet" href="./resources/css/community/book/registerBook.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<script type="text/javascript">
	var bookList = [];		// 전달받은 도서 정보 리스트
	var pageSize = 12; 		// 한 페이지 수 
	var pageGroupSize = 5; 	// 페이징 당 페이지 수 
	var listLength = 0;		// 전달받은 도서 수
	
	$(function() {
		
		// 카카오 도서 검색 api
		$("#searchForm").submit(function() {
			$("#book-img-section").empty();
			$.ajax({
				method:"GET",
				url:"https://dapi.kakao.com/v3/search/book?sort=accuracy&page=3&size=50&query="+$("#bookName").val()+"&target=title&target=person",
				data:{ query: $("#bookName").val() },
				headers:{ Authorization: "KakaoAK 6e0eb818150f47faddc3398e2aef87b6" },
				error:function() {
					alert("도서 검색 실패!");
				},
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
			return false;
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
			<form autocomplete="off" id="searchForm">
				<div class="input-group" style="width: 50%; margin: auto; margin-bottom: 100px;">
					<input type="text" class="form-control" id="bookName" name="keyword" placeholder="도서이름 또는 작가로 검색" style="width:100px; height:60px; margin-top:10px;"> 
					<span><button type="submit" id="homeSearch" style="margin-top:10px; border:none; background-color: #f9fafc; cursor:pointer">
						<img src="./resources/assets/img/icon_search_purple.png" style="width: 55px;">
					</button></span>
				</div>
			</form>
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