<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gallery</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-awesome.min.css">
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
<script type="text/javascript">
$('.customNextBtn').click(function() {
	owl.trigger('next.owl.carousel');
});

$('.customPrevBtn').click(function() {
	owl.trigger('prev.owl.carousel', [ 300 ]);
});

$(document).on('click', '#btnSearch', function(e){
e.preventDefault();
var url = "${studyList}";
url = url + "?searchType=" + $('#searchType').val();
url = url + "&search=" + $('#search').val();
location.href = url;
console.log(url);
});
</script>
<style type="text/css">
/* Hover Blur Effect */
.text-white {
	color: #fff;
}

.hover-blur a {
	display: block;
	position: relative;
	overflow: hidden;
}

.hover-blur img {
	width: 100%;
	height: auto;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
}

.hover-blur:hover img {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-o-transform: scale(1.2);
	-ms-transform: scale(1.2);
	transform: scale(1.2);
	-webkit-filter: grayscale(0.6) blur(1px);
	filter: grayscale(0.6) blur(1px);
}

.hover-blur a h2 {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	margin-top: 0px;
	margin-bottom: 0px;
	height: 100%;
	width: 100%;
	padding: 45% 20px;
	text-align: center;
	background-color: rgba(0, 0, 0, 0.5);
	/*background dotted*/
	background-image: -webkit-repeating-radial-gradient(center center, rgba(0, 0, 0, .8),
		rgba(0, 0, 0, .8) 1px, transparent 1px, transparent 100%);
	background-image: -moz-repeating-radial-gradient(center center, rgba(0, 0, 0, .8),
		rgba(0, 0, 0, .8) 1px, transparent 1px, transparent 100%);
	background-image: -ms-repeating-radial-gradient(center center, rgba(0, 0, 0, .8),
		rgba(0, 0, 0, .8) 1px, transparent 1px, transparent 100%);
	background-image: repeating-radial-gradient(center center, rgba(0, 0, 0, .8),
		rgba(0, 0, 0, .8) 1px, transparent 1px, transparent 100%);
	-webkit-background-size: 3px 3px;
	-moz-background-size: 3px 3px;
	background-size: 3px 3px;
	-webkit-transition: all 0.5s linear;
	-moz-transition: all 0.5s linear;
	-o-transition: all 0.5s linear;
	-ms-transition: all 0.5s linear;
	transition: all 0.5s linear;
	-ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=0)";
	filter: alpha(opacity = 0);
	opacity: 0;
}

.hover-blur:hover a h2 {
	-ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=100)";
	filter: alpha(opacity = 100);
	opacity: 1;
}

.hover-blur .text-white {
	-webkit-transform: scale(0);
	-moz-transform: scale(0);
	-o-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
	-webkit-transition: all 0.5s linear;
	-moz-transition: all 0.5s linear;
	-o-transition: all 0.5s linear;
	-ms-transition: all 0.5s linear;
	transition: all 0.5s linear;
	-ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=0)";
	filter: alpha(opacity = 0);
	opacity: 0;
}

.hover-blur:hover .text-white {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-o-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
	-webkit-transition: all 0.5s linear;
	-moz-transition: all 0.5s linear;
	-o-transition: all 0.5s linear;
	-ms-transition: all 0.5s linear;
	transition: all 0.5s linear;
	-ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=1)";
	filter: alpha(opacity = 1);
	opacity: 1;
}
.gallery_Btn{
	float: right;
	margin-top : 15px;
	background-color: #EFF0F2;
	border: 1px solid #EFF0F2;
	width: 8%;
	height: 50px;
	font-size: 15px;
	padding: 1%;
	
	border-radius: 10px 10px;
	color: black;
	font-weight: bold;
	margin-left: 1%;
}
.gallery_Btn:hover{
	background-color: white;
	border: 1px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;

}
</style>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">

		<br> <br>
		<h1 style="text-align: center;">Gallery</h1>
		<br>
		<form action="galleryList.do" method="get" role="form">
			<div class="input-group"
				style="width: 50%; margin: auto; margin-bottom: 100px;">
				<span><img src="./resources/assets/img/logo_purple.png"class="logo"></span> 
					<input type="text" class="form-control" id="keywordInput" name="keyword" placeholder="스터디 제목을 검색하세요." value="${searchPagination.keyword }" style="width:100px; height:60px; margin-top:10px;"> <span>
					<button type="button" id="homeSearch" name="homeSearch" style="margin-top:10px; border:none; background-color: #f9fafc;">
						<img src="./resources/assets/img/icon_search_purple.png" style="width: 50px;">
					</button>
				</span>
			</div>
		</form>
		<script>
		 $(function(){
		        $('#homeSearch').click(function() {
		          self.location = "gallery.do" + '${pageMaker.makeQuery(1)}' +  "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      }); 
		</script>
		<br> <br>
		<div class="container-fluid">
			<div class="row">
				<!-- photo List start -->
				<c:forEach items="${galleryList }" var="galleryList" varStatus="status">
				<div class="col-lg-4 col-md-8">
					<div class=" hover-blur">
						<a href="galleryDetail.do?b_no=${galleryList.b_no }" title="">
						<img src="${attachImage.get(status.index).getF_url() }" alt="" style="width: 500px; height: 400px;"/>
							<h2>
								<span class="text-white">${galleryList.b_title} </span>
							</h2>
						</a>
						<h4 class="text-center">${galleryList.b_title}</h4>
					</div>
				</div>
				</c:forEach>
				<!-- photo List end -->

			</div>
		</div>
	<button onclick="location.href='gallerywriteform.do'" class="gallery_Btn">글쓰기</button>
		<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a href="gallery.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="i">
				<li><a href="gallery.do${pageMaker.makeSearch(i)}">${i}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="gallery.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
	</div>



	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>