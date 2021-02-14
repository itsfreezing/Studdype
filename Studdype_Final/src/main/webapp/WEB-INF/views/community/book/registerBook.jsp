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
	var pageSize = 10; 		// 한 페이지 수 
	var pageGroupSize = 5; 	// 페이징 당 페이지 수 
	var listLength = 0;		// 전달받은 도서 수
	
	$(function() {
		
		// 카카오 도서 검색 api
		$("#searchForm").submit(function() {
			$("#book-img-section").empty();
			$(".recommend-img").empty();
			$(".categorySelected").removeClass("categorySelected");
			
			$.ajax({
				method:"GET",
				url:"https://dapi.kakao.com/v3/search/book?sort=accuracy&page=3&size=50&query="+$("#bookName").val()+"&target=title&target=person",
				headers:{ Authorization: "KakaoAK 6e0eb818150f47faddc3398e2aef87b6" },
				error:function() {
					alert("키워드를 입력하고 검색해주세요.");
					$("#book-img-section").empty();
					$(".recommend-img").empty();
					$(".categorySelected").removeClass("categorySelected");
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
		
		// 페이지 번호 클릭 이벤트 (페이징 처리)
		$(document).on("click", ".pageNumber", function() {
			var pageOrder = $(this).text();
			
			paging(listLength, pageOrder);
		});
		
		// 카테고리 버튼 클릭 이벤트
		$(".inputCategory").click(function() {
			$(".categorySelected").removeClass("categorySelected");
			$(this).addClass("categorySelected");
			
		});
		
		// 카테고리 책 클릭 시 모달 띄우기
		$(document).on("click", ".categoryDiv" , function() {
			$("#title").val($(this).children().eq(1).val());
			$("#author").val($(this).children().eq(2).val());
			$("#publish").val($(this).children().eq(3).val());
			$("#link").attr("href", $(this).children().eq(4).val());
			$("#book_img").attr("src", $(this).children().eq(0).attr("src"));
			$("#input_book_img").val($(this).children().eq(0).attr("src"));
			$("#book_url").val($(this).children().eq(4).val());
			
			$("#b_title").val("");
			$("#content").val("");
			
			$('.modal').removeClass('hidden');
		});
		
	}); // 즉시 실행 종료

	// 도서 리스트 영역별로 정보 append
	function appendBookList(bookList) {
		listLength = bookList.length; // 전달받은 도서 수
		$("#paging-section").empty();
		$(".recommend-img").empty();
		$(".categorySelected").removeClass("categorySelected");
		
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
		$(".divBox:gt(9)").hide();
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
			$(".showPaing").removeClass("showPaing");
			$("#"+clickPage).addClass("showPaing");
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
		$(".pageNumber:first").addClass("showPaing");
	}
	
	function validateSubmit() {
		var title = $("#b_title").val();
		var content = $("#content").val();
		
		if( (title.trim().length==0) || (title==null) || (title.trim()=='')) {
			alert("글제목을 작성해주세요. (공백, 띄어쓰기 제외)");
			return false;
		}else if(title.trim().length > 50) {
			alert("글제목은 50자 이내로 작성해주세요.");
			return false;
		}else if( (content.trim().length==0) || (content.trim()=='') || (conetnt==null) ) {
			alert("도서 설명을 작성해주세요.");
			return false;
		}else if(content.trim().length > 800) {
			alert("글 내용은 800자 이내로 작성해주세요.")
			return false;
		}else {
			return true;
		}
	}
	
	function categorySearch(cate_no) {
		console.log(cate_no);
		
		$("#book-img-section").empty();	// 검색창으로 나온 영역 비우기
		$("#paging-section").empty();
		
		var categoryVal = {
				"cate_no":cate_no
		}
		
		$.ajax({
			type:"post",
			url:"bookCategorySearch.do",
			data:JSON.stringify(categoryVal),
			contentType:"application/json",
			dataType:"json",
			success:function(map) {
				var html = "";
				// <img src="./resources/img/no-exsist-book.png">
				//	<p>등록된 도서가 없습니다.</p>
				// <img src="./resources/assets/img/recommend1.jpg">
				if(map.bookList.length == 0 ) {
					html = "<img id='no-categoryList' src='./resources/img/no-exsist-book.png'><p id='recommend-comment'>카테고리 추천 도서가 없습니다.</p>"
					$(".recommend-img").html(html);
					return false;
				}else {
					html += "<p id='recommend-comment'>카테고리 추천 도서</p>";
					for(var i = 0; i < map.bookList.length; i++) {
						html += "<div class='categoryDiv'>"+
						"<img src='"+map.bookList[i].book_img+"'>"+
						"<input type='hidden' value='"+map.bookList[i].book_title+"'>"+
						"<input type='hidden' value='"+map.bookList[i].book_author+"'>"+
						"<input type='hidden' value='"+map.bookList[i].book_publish+"'>"+
						"<input type='hidden' value='"+map.bookList[i].book_url+"'>"+
						"</div>";
					}
					
					$(".recommend-img").html(html);
				}
				
			},
			error:function() {
				alert("카테고리 검색 실패");
			}
		});
	}
</script>

</head>
<body>

	<!-- 모달 영역 시작 -->
		<div class="modal hidden">
			<form action="insertRegisterBook.do" onsubmit="return validateSubmit();" autocomplete="off" accept-charset="utf-8">
			<div class="form">
    				<input type="hidden" name="s_no" value="${study.s_no }">
    				<input type="hidden" name="b_writer" value="${login.mem_no }">
    				<input type="hidden" id="input_book_img" name="book_img" value="">
    				<div id="modal-top">
    					<label class="board-label" for="b_title">글 제목</label>
     					<input class="board-input" id="b_title" name="b_title" type="text"/>
    				</div>
    				<div id="modal-bottom">
    					<div id="modal-textarea">
    						<label class="board-label" for="content" >도서 설명글</label>
							<textarea id="content" rows="18" name="b_content"></textarea>
    					</div>
    				</div>
      				<button type="submit">등록</button>
  			</div>
  			<div class="invite">
    			<img id="book_img" src="" onError="this.src='resources/img/no-image.png'" />
    			<div id="modal-content">
    				<div class="content-div">
    					<label class="book-label" for="title">도서 이름</label>
      					<input class="book-input" id="title" type="text" name="book_title" value="" readonly="readonly" >
      				</div>
      				
      				<div class="content-div">
      					<label class="book-label" for="author">저자</label>
      					<input class="book-input" id="author" type="text" name="book_author" value="" readonly="readonly">
      				</div>
      				
      				<div class="content-div">
      					<label class="book-label" for="publish">출판사</label>
      					<input class="book-input" id="publish" type="text" name="book_publish" value="" readonly="readonly">
      				</div>
      				
      				<div class="content-div">
      					<label class="book-label" for="link">링크&nbsp;</label>
      					<a id="link" href="" target="_blank"><img src='resources/img/link-icon.png'/><input id="book_url" type="hidden" name="book_url" value=""></a>
      				</div>
    			</div>
    			<div class="nope">다른 책 보러가기</div>
    			<div class="close" title="close"></div>
  			</div>
  			</form>
	</div>
	<!-- 모달 영역 종료 -->

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	<!-- 메인 섹션 시작 -->
	<div class="main-section">
	<h3 style="margin-left:30px;">도서 검색</h3>
		<!-- ----------------------------------------------------------------------------------- -->
		<!-- 메인 섹션 상단 시작 -->
		<div id="main-section-top">
			<form autocomplete="off" id="searchForm">
				<div class="input-group" style="width: 50%; margin: auto; margin-bottom: 30px;">
					<input type="text" class="form-control" id="bookName" name="keyword" placeholder="도서이름 또는 작가로 검색" style="width:100px; height:60px; margin-top:10px;"> 
					<span><button type="submit" id="homeSearch">
						<img src="./resources/assets/img/icon_search_purple.png" style="width: 40px;">
					</button></span>
				</div>
			</form>
			<div id="category">
				<c:forEach  items="${cateList }" var="cate">
					<input type="button" class="inputCategory" onclick="categorySearch(${cate.getCate_no()});" value="${cate.getCate_name() }">
				</c:forEach>
			</div>
		</div>
		<!-- 메인 섹션 상단 종료 -->
		
		<!-- ----------------------------------------------------------------------------------- -->
		
		<!-- 메인 섹션 중앙 시작 -->
		<div id="main-section-bottom">
			<div id='book-img-section'></div>
			<div class="recommend-img"></div>
			<div id="paging-section"></div>
		</div>
		<!-- 메인 섹션 중앙 종료 -->
		
		<!-- ----------------------------------------------------------------------------------- -->

	</div>
	<!-- 메인 섹션 종료 -->
	
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>

</body>
</html>