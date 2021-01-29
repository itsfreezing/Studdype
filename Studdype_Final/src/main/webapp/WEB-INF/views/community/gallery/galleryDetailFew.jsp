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
<title>CommunityHome</title>

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
<link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond"
	rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel= "stylesheet">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

<style type="text/css">
/* 갤러리 뷰 css 시작 */
.row {
	margin: 15px;
}
#fewsize{
	width: 350px;
	height: 300px;
	margin: 15px;
}
/* 갤러리 뷰 css 끝 */

/* 댓글 css 시작 */
hr {
	margin-top: 20px;
	margin-bottom: 20px;
	border: 0;
	border-top: 1px solid #FFFFFF;
}

a {
	color: #82b440;
	text-decoration: none;
}

.blog-comment::before, .blog-comment::after, .blog-comment-form::before,
	.blog-comment-form::after {
	content: "";
	display: table;
	clear: both;
}

.blog-comment {
	padding-left: 15px;
	padding-right: 15px;
}

.blog-comment ul {
	list-style-type: none;
	padding: 0;
}

.blog-comment img {
	opacity: 1;
	filter: Alpha(opacity = 100);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
}

.blog-comment img.avatar {
	position: relative;
	float: left;
	margin-left: 0;
	margin-top: 0;
	width: 65px;
	height: 65px;
	border: 1px solid
}

.blog-comment .post-comments {
	border: 1px solid #eee;
	margin-bottom: 20px;
	margin-left: 85px;
	margin-right: 0px;
	padding: 10px 20px;
	position: relative;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	background: #fff;
	color: #6b6e80;
	position: relative;
}

.blog-comment .meta {
	font-size: 13px;
	color: #aaaaaa;
	padding-bottom: 8px;
	margin-bottom: 10px !important;
	border-bottom: 1px solid #eee;
}

.blog-comment>ul.comments>li>ul {
	list-style-type: none;
	padding: 0;
	margin-left: 85px;
}

.blog-comment-form {
	padding-left: 15%;
	padding-right: 15%;
	padding-top: 40px;
}
</style>

<script type="text/javascript">
$(document).on("click", '[data-toggle="lightbox"]', function(event) {
	  event.preventDefault();
	  $(this).ekkoLightbox();
	});
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<br>
		<h1 style="text-align: center;">${detail.b_title}</h1>
		<h2>by.${galleryWriter }</h2>
		<div class="container mt-5">
				<div class="row">
				<c:forEach items="${fileDetail}" var="fileDetail">
					<a href="${fileDetail.f_url }" data-toggle="lightbox" data-gallery="gallery" class="col-md-4">
						<img id="fewsize" src="${fileDetail.f_url }" class="img-fluid rounded" alt></a>
				</c:forEach>
				</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<!-- 갤러리 뷰 끝 -->

		<!-- 갤러리 내용 시작 -->
		<div class="galleryContent">${detail.b_content }</div>
		<!-- 갤러리 내용 끝 -->
		

		<hr>
		<!-- 갤러리 댓글 시작 -->
		<br> <br>
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-md-12">
					<div class="blog-comment">
						<h3 class="text-success">Comments</h3>
						<hr />
						<ul class="comments">
							<li class="clearfix"><img
								src="https://bootdey.com/img/Content/user_1.jpg" class="avatar"
								alt="">
								<div class="post-comments">
									<p class="meta">
										Dec 18, 2014 <a href="#">JohnDoe</a> says : <i
											class="pull-right"><a href="#"><small>Reply</small></a></i>
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Etiam a sapien odio, sit amet</p>
								</div></li>
							<li class="clearfix"><img
								src="https://bootdey.com/img/Content/user_2.jpg" class="avatar"
								alt="">
								<div class="post-comments">
									<p class="meta">
										Dec 19, 2014 <a href="#">JohnDoe</a> says : <i
											class="pull-right"><a href="#"><small>Reply</small></a></i>
									</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Etiam a sapien odio, sit amet</p>
								</div>

								<ul class="comments">
									<li class="clearfix"><img
										src="https://bootdey.com/img/Content/user_3.jpg"
										class="avatar" alt="">
										<div class="post-comments">
											<p class="meta">
												Dec 20, 2014 <a href="#">JohnDoe</a> says : <i
													class="pull-right"><a href="#"><small>Reply</small></a></i>
											</p>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit. Etiam a sapien odio, sit amet</p>
										</div>
										<ul class="comments">
											<li class="clearfix"><img
												src="https://bootdey.com/img/Content/user_3.jpg"
												class="avatar" alt="">
												<div class="post-comments">
													<p class="meta">
														Dec 20, 2014 <a href="#">JohnDoe</a> says : <i
															class="pull-right"><a href="#"><small>Reply</small></a></i>
													</p>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Etiam a sapien odio, sit amet</p>
												</div></li>
										</ul></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 갤러리 댓글 끝 -->
			<div class="galleryBtnDiv">
			<c:choose>
				<c:when test="${dto.b_writer == login.mem_no }">
					<input type="button" class="galleryBtn" value="삭제" onclick="location.href='galleryDelete.do?b_no=${detail.b_no}'" />
					<input type="button" class="galleryBtn"  value="수정" onclick="location.href='galleryupdateform.do?b_no=${detail.b_no}'" />
					<input type="button" class="galleryBtn" value="목록" onclick="location.href='gallery.do'">
				</c:when>
				<c:otherwise>
					<input type="button" class="free_Btn" value="목록" onclick="location.href='gallery.do'">
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	</div>


	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>