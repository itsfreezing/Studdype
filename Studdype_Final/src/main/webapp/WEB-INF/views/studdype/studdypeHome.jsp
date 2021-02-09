<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>main page</title>

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
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var owl = $('.owl-carousel');

		owl.owlCarousel({
			items : 1, // 한번에 보여줄 아이템 수
			loop : true, // 반복여부
			//margin:35,               // 오른쪽 간격
			autoplay : true, // 자동재생 여부
			autoplayTimeout : 5000, // 재생간격
			autoplayHoverPause : false
		//마우스오버시 멈출지 여부
		});

		$('.customNextBtn').click(function() {
			owl.trigger('next.owl.carousel');
			mee
		})

		$('.customPrevBtn').click(function() {
			owl.trigger('prev.owl.carousel', [ 300 ]);
		})
		
		// 해더 상단 영역 숨기기 (메뉴 넘어갈때는 이 코드 show()로 바꾸기)
		$(".justify-content-center").hide(); 
	});
/* 	
	$(document).on('pclick', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${studyList}";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&search=" + $('#search').val();
		location.href = url;
		console.log(url);
	}); */
</script>

<style type="text/css">
input#search {
	height: 55px;
	margin-top: 15px;
	border-top: none;
	border-right: none;
	border-left: none;
	border-bottom: 1px solid;
	background-color: F9FAFC;
	background-color: transparent;
}

input#search:focus {
	border-bottom: 3px solid #6610F2;
}

.feature-page.header-area {
	height: 80px;
}
<<<<<<< HEAD
.owl-dot{
	background-color:#c0d7e9 !important;
}
.owl-dot.active{
	background-color:white !important;
}
#mainBanner{
	box-shadow:none !important;
=======
.blogpost-area{
	background: #ffff;
	margin-left: 5%;
	margin-right: 5%;
>>>>>>> d817253ab7895cd7b0b82839f9a6760a19d040c1
}
</style>

</head>

<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<!-- 메인페이지 슬라이더 영역 -->
	<!-- 속성 검색 시 owl-carousel로 검색하면 찾기 쉬움! -->
	<div class="owl-carousel hero-slider-area" id="mainBanner"
		style="box-shadow: 5px 5px 5px;">
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage1.png">
		</div>
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage2.png">
		</div>
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage3.png">
		</div>
		<div class="hero-slider-info">
			<img src="./resources/assets/img/banner_mainPage4.png">
		</div>
	</div>
	<!-- 슬라이더 끝 -->

	<!-- 스터디 영역 -->
	<div class="blogpost-area">
		<!-- 검색창 -->
		<form action="studyList.do" method="get" role="form">
			<div class="input-group"
				style="width: 50%; margin: auto; margin-bottom: 100px;">
					<input type="text" class="form-control" id="keywordInput" name="keyword" placeholder="스터디 제목을 검색하세요." value="${searchPagination.keyword}" style="width:100px; height:60px; margin-top:10px;"> <span>
					<button type="button" id="homeSearch" name="homeSearch" style="margin-top:15px; border:none; background-color: #f9fafc;">
						<img src="./resources/assets/img/icon_search_purple.png" style="width: 50px;">
					</button>
				</span>
			</div>
		</form>
		<script>
		 $(function(){
		        $('#homeSearch').click(function() {
		          self.location = "studyList.do" + '${pageMaker.makeQuery(1)}' +  "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      }); 
		</script>

		<div class="container-fluid">
			<div class="row">

				<!-- 이미지 크기에 따라 스터디의 길이가 달라질 수 있음 -->
				<!-- div 태그 클릭시 해당 스터디홈으로 이동 -->
				<!-- list 시작 -->
				<c:forEach items="${studyList}" var="studyDto">
					<div class="col-sm-3 p-5 blogs-load"
						onclick="location.href='studdypeDetailForm.do?s_no=${studyDto.getS_no()}'" style="cursor: pointer;">
						<div class="single-blog-post">
							<div class="blog-img-responsive-4by3">
								<!-- 스터디 이미지 -->
								<img src="${studyDto.getPhoto() }" alt="" class="img-fluid" style="width: 379px; height: 233px;">
							</div>
							<!-- 제목/장소아이콘/장소/카테고리 -->
							<div class="blog-meta">
								<h3 style="white-space : nowrap; text-overflow : ellipsis; overflow:hidden;">${studyDto.s_name}</h3>
								<br> <span><img
									src="./resources/assets/img/profile_placeholder.png"
									style="width: 15px;"><b>${siList.get(studyDto.si_no) }&nbsp;
									${guList.get(studyDto.gu_no)}</b><a style="float:right;">${cateList.get(studyDto.cate_no)}</a> </span>
							</div>

							<p>${studyDto.s_info }</p>
							<!-- 최대인원수/팀장명 -->
							<div class="blog-comments">
								<span> <b>${leaderName.get(studyDto.leader_no)}</b> <a
									style="float: right;"><img
										src="./resources/assets/img/profile_user.png"
										style="width: 15px;">&nbsp;&nbsp;${studyDto.s_maxcnt}</a>
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 스터디 리스트 끝 -->

	<!-- 스터디 리스트 페이징 -->
	<div style="padding-left: 45%;">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href="studyList.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item"><a class="page-link" href="studyList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a class="page-link" href="studyList.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<!-- 스터디 리스트 페이징 끝 -->




	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>

	<script src="./resources/assets/js/popper.min.js"></script>
	<script src="./resources/assets/js/bootstrap.min.js"></script>
	<script src="./resources/assets/js/owl.carousel.min.js"></script>
	<script src="./resources/assets/js/modal-video.js"></script>
	<script src="./resources/assets/js/loadmore.js"></script>
	<script src="./resources/assets/js/prefixfree.min.js"></script>
	<script src="./resources/assets/js/main.js"></script>
</body>

</html>
