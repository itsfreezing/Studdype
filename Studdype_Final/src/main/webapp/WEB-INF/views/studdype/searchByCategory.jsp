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
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">

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
	
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${studyList}";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&search=" + $('#search').val();
		location.href = url;
		console.log(url);
	});
	
	/* Demo purposes only */
	$(".hover").mouseleave(
	  function () {
	    $(this).removeClass("hover");
	  }
	);


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


/* Winona */
.button--winona {
	overflow: hidden;
	padding: 0;
	-webkit-transition: border-color 0.3s, background-color 0.3s;
	transition: border-color 0.3s, background-color 0.3s;
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--winona::after {
	content: attr(data-text);
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	color: #3f51b5;
	-webkit-transform: translate3d(0, 25%, 0);
	transform: translate3d(0, 25%, 0);
}
.button--winona > span {
	display: block;
}
.button--winona.button--inverted {
	color: #7986cb;
}
.button--winona.button--inverted:after {
	color: #fff;
}
.button--winona::after,
.button--winona > span {
	padding: 1em 2em;
	-webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
	transition: transform 0.3s, opacity 0.3s;
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--winona:hover {
	border-color: #3f51b5;
	background-color: rgba(63, 81, 181, 0.1);
}
.button--winona.button--inverted:hover {
	border-color: #21333C;
	background-color: #21333C;
}
.button--winona:hover::after {
	opacity: 1;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}
.button--winona:hover > span {
	opacity: 0;
	-webkit-transform: translate3d(0, -25%, 0);
	transform: translate3d(0, -25%, 0);
}
/* Common button styles */
.button {
	min-width: 150px;
	max-width: 250px;
	display: block;
	margin: 1em;
	padding: 1em 2em;
	border: none;
	background: none;
	color: inherit;
	vertical-align: middle;
	position: relative;
	z-index: 1;
	-webkit-backface-visibility: hidden;
	-moz-osx-font-smoothing: grayscale;
}
.button:focus {
	outline: none;
}
.button > span {
	vertical-align: middle;
}

/* Text color adjustments (we could stick to the "inherit" but that does not work well in Safari) */

.bg-1 .button {
	color: #37474f;
	border-color: #37474f;
}
.bg-2 .button {
	color: #ECEFF1;
	border-color: #ECEFF1;
}
.bg-3 .button {
	color: #fff;
	border-color: #fff;
}

/* Sizes */
.button--size-s {
	font-size: 14px;
}
.button--size-m {
	font-size: 16px;
}
.button--size-l {
	font-size: 18px;
}

/* Typography and Roundedness */
.button--text-upper {
	letter-spacing: 2px;
	text-transform: uppercase;
}
.button--text-thin {
	font-weight: 300;
}
.button--text-medium {
	font-weight: 500;
}
.button--text-thick {
	font-weight: 600;
}
.button--round-s {
	border-radius: 5px;
}
.button--round-m {
	border-radius: 15px;
}
.button--round-l {
	border-radius: 40px;
}

/* Borders */
.button--border-thin {
	border: 1px solid;
}
.button--border-medium {
	border: 2px solid;
}
.button--border-thick {
	border: 3px solid;
}

/* Individual button styles */

/* Winona */
.button--winona {
	overflow: hidden;
	padding: 0;
	-webkit-transition: border-color 0.3s, background-color 0.3s;
	transition: border-color 0.3s, background-color 0.3s;
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--winona::after {
	content: attr(data-text);
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	color: #3f51b5;
	-webkit-transform: translate3d(0, 25%, 0);
	transform: translate3d(0, 25%, 0);
}
.button--winona > span {
	display: block;
}
.button--winona.button--inverted {
	color: #7986cb;
}
.button--winona.button--inverted:after {
	color: #fff;
}
.button--winona::after,
.button--winona > span {
	padding: 1em 2em;
	-webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
	transition: transform 0.3s, opacity 0.3s;
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--winona:hover {
	border-color: #3f51b5;
	background-color: rgba(63, 81, 181, 0.1);
}
.button--winona.button--inverted:hover {
	border-color: #21333C;
	background-color: #21333C;
}
.button--winona:hover::after {
	opacity: 1;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}
.button--winona:hover > span {
	opacity: 0;
	-webkit-transform: translate3d(0, -25%, 0);
	transform: translate3d(0, -25%, 0);
}
.categoryImage {
	width: 100%;
	border: 1px solid;
	height: 400px;
}
.categoryImage > img {
width: 100%;
height: 400px;
}
.cateBtn2{
	text-align: center;
}


</style>

</head>

<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

<!-- 카테고리 사진 hover시 변경하기 -->
<div class="categoryImage">
	<img src="./resources/assets/img/img_startPage.png" id="changeImage">
	
</div>
	<!-- 스터디 영역 -->
		<!-- 카테고리 -->
		<h2 style="text-align: center;">Studdype Categories</h2>
				<div class="cateBtn2">
					<button class="button button--winona button--border-thin button--round-s" data-text="IT" id="catebtn1" onclick="location.href='studycategoryList.do?cate_no=1'" style="display: inline-block;"><span>IT</span></button>
					<button class="button button--winona button--border-thin button--round-s" data-text="자격증" id="catebtn2" onclick="location.href='studycategoryList.do?cate_no=2'" style="display: inline-block;"><span>자격증</span></button>
					<button class="button button--winona button--border-thin button--round-s" data-text="공무원" id="catebtn3" onclick="location.href='studycategoryList.do?cate_no=3'" style="display: inline-block;"><span>공무원</span></button>
					<button class="button button--winona button--border-thin button--round-s" data-text="Publish" id="catebtn4" onclick="location.href='studycategoryList.do?cate_no=4'" style="display: inline-block;"><span>Publish</span></button>
					<button class="button button--winona button--border-thin button--round-s" data-text="Publish" id="catebtn5" onclick="location.href='studycategoryList.do?cate_no=5'" style="display: inline-block;"><span>Publish</span></button>
					<button class="button button--winona button--border-thin button--round-s" data-text="Publish" id="catebtn6" onclick="location.href='studycategoryList.do?cate_no=6'" style="display: inline-block;"><span>Publish</span></button>
					<button class="button button--winona button--border-thin button--round-s" data-text="Publish" id="catebtn7" onclick="location.href='studycategoryList.do?cate_no=7'" style="display: inline-block;"><span>Publish</span></button>
					<button class="button button--winona button--border-thin button--round-s" data-text="기타" id="catebtn8" onclick="location.href='studycategoryList.do?cate_no=8'" style="display: inline-block;"><span>기타</span></button>
				</div>
<script type="text/javascript">


$("#catebtn1").on({
	'mouseover': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png').fadeIn( 'slow' );
	}
});

$("#catebtn1").on({
	'mouseout': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png').fadeOut( 'slow' );
	}
});

$("#catebtn2").on({
	'mouseover': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png').fadeIn( 'slow' );
	}
});

$("#catebtn2").on({
	'mouseout': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png').fadeOut( 'slow' );
	}
});


$("#catebtn3").on({
	'mouseover': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png').fadeIn( 'slow' );
	}
});

$("#catebtn3").on({
	'mouseout': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png').fadeOut( 'slow' );
	}
});


$("#catebtn4").on({
	'mouseover': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png').fadeIn( 'slow' );
	}
});

$("#catebtn4").on({
	'mouseout': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png').fadeOut( 'slow' );
	}
});


$("#catebtn5").on({
	'mouseover': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png').fadeIn( 'slow' );
	}
});

$("#catebtn5").on({
	'mouseout': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png').fadeOut( 'slow' );
	}
});


$("#catebtn6").on({
	'mouseover': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png').fadeIn( 'slow' );
	}
});

$("#catebtn6").on({
	'mouseout': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png').fadeOut( 'slow' );
	}
});


$("#catebtn7").on({
	'mouseover': 
	function() {
	$("#changeImage").attr("style","animation: fadein 2s");
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png');
	}
});

$("#catebtn7").on({
	'mouseout': 
	function() {
	$("#changeImage").attr("style","transition-duration: 1s");
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png');
	
	}
});


$("#catebtn8").on({
	'mouseenter': 
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_study1.png').fadeIn(600).css("display", "inline-block");

	}
});

$("#catebtn8").on({
	'mouseleave':
	function() {
	$("#changeImage").attr("src", './resources/assets/img/img_startPage.png').fadeIn(600).css("display", "inline-block");

	}
});
</script>

	<div class="blogpost-area">
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
								<h3>${studyDto.s_name}</h3>
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
