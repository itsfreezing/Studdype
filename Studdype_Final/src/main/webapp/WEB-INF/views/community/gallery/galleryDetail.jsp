<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<style type="text/css">
/* 갤러리 뷰 css 시작 */
.carousel {
  position: relative;
}
.carousel-item img {
  object-fit: cover;
}
#carousel-thumbs {
  background: rgba(255,255,255,.3);
  bottom: 0;
  left: 0;
  padding: 0 50px;
  right: 0;
}
#carousel-thumbs img {
  border: 5px solid transparent;
  cursor: pointer;
}
#carousel-thumbs img:hover {
  border-color: rgba(255,255,255,.3);
}
#carousel-thumbs .selected img {
  border-color: #fff;
}
.carousel-control-prev,
.carousel-control-next {
  width: 50px;
}
@media all and (max-width: 767px) {
  .carousel-container #carousel-thumbs img {
    border-width: 3px;
  }
}
@media all and (min-width: 576px) {
  .carousel-container #carousel-thumbs {
    position: absolute;
  }
}
@media all and (max-width: 576px) {
  .carousel-container #carousel-thumbs {
    background: #ccccce;
  }
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
.blog-comment::before,
.blog-comment::after,
.blog-comment-form::before,
.blog-comment-form::after{
    content: "";
	display: table;
	clear: both;
}

.blog-comment{
    padding-left: 15px;
	padding-right: 15px;
}

.blog-comment ul{
	list-style-type: none;
	padding: 0;
}

.blog-comment img{
	opacity: 1;
	filter: Alpha(opacity=100);
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

.blog-comment .post-comments{
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

.blog-comment > ul.comments > li > ul {
	list-style-type: none;
	padding: 0;
	margin-left: 85px;
}

.blog-comment-form{
	padding-left: 15%;
	padding-right: 15%;
	padding-top: 40px;
}

</style>

<script type="text/javascript">
$('#myCarousel').carousel({
	  interval: false
	});
	$('#carousel-thumbs').carousel({
	  interval: false
	});

	$('[id^=carousel-selector-]').click(function() {
	  var id_selector = $(this).attr('id');
	  var id = parseInt( id_selector.substr(id_selector.lastIndexOf('-') + 1) );
	  $('#myCarousel').carousel(id);
	});
	// Only display 3 items in nav on mobile.
	if ($(window).width() < 575) {
	  $('#carousel-thumbs .row div:nth-child(4)').each(function() {
	    var rowBoundary = $(this);
	    $('<div class="row mx-0">').insertAfter(rowBoundary.parent()).append(rowBoundary.nextAll().addBack());
	  });
	  $('#carousel-thumbs .carousel-item .row:nth-child(even)').each(function() {
	    var boundary = $(this);
	    $('<div class="carousel-item">').insertAfter(boundary.parent()).append(boundary.nextAll().addBack());
	  });
	}
	// Hide slide arrows if too few items.
	if ($('#carousel-thumbs .carousel-item').length < 2) {
	  $('#carousel-thumbs [class^=carousel-control-]').remove();
	  $('.machine-carousel-container #carousel-thumbs').css('padding','0 5px');
	}
	// when the carousel slides, auto update
	$('#myCarousel').on('slide.bs.carousel', function(e) {
	  var id = parseInt( $(e.relatedTarget).attr('data-slide-number') );
	  $('[id^=carousel-selector-]').removeClass('selected');
	  $('[id=carousel-selector-'+id+']').addClass('selected');
	});
	// when user swipes, go next or previous
	$('#myCarousel').swipe({
	  fallbackToMouseEvents: true,
	  swipeLeft: function(e) {
	    $('#myCarousel').carousel('next');
	  },
	  swipeRight: function(e) {
	    $('#myCarousel').carousel('prev');
	  },
	  allowPageScroll: 'vertical',
	  preventDefaultEvents: false,
	  threshold: 75
	});
	$('#myCarousel .carousel-item img').on('click', function(e) {
	  var src = $(e.target).attr('data-remote');
	  if (src) $(this).ekkoLightbox();
	});

</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<br>
		<h1>제목 들어갈 곳</h1>
		<h2>by.writer</h2>
		<div class="container mt-5">
			<div class="carousel-container position-relative row">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-slide-number="0">
							<img src="https://source.unsplash.com/Pn6iimgM-wo/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/Pn6iimgM-wo/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="1">
							<img src="https://source.unsplash.com/tXqVe7oO-go/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/tXqVe7oO-go/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="2">
							<img src="https://source.unsplash.com/qlYQb7B9vog/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/qlYQb7B9vog/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="3">
							<img src="https://source.unsplash.com/QfEfkWk1Uhk/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/QfEfkWk1Uhk/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="4">
							<img src="https://source.unsplash.com/CSIcgaLiFO0/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/CSIcgaLiFO0/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="5">
							<img src="https://source.unsplash.com/a_xa7RUKzdc/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/a_xa7RUKzdc/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="6">
							<img src="https://source.unsplash.com/uanoYn1AmPs/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/uanoYn1AmPs/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="7">
							<img src="https://source.unsplash.com/_snqARKTgoc/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/_snqARKTgoc/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="8">
							<img src="https://source.unsplash.com/M9F8VR0jEPM/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/M9F8VR0jEPM/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
						<div class="carousel-item" data-slide-number="9">
							<img src="https://source.unsplash.com/Q1p7bh3SHj8/1600x900/"
								class="d-block w-100" alt="..."
								data-remote="https://source.unsplash.com/Q1p7bh3SHj8/"
								data-type="image" data-toggle="lightbox"
								data-gallery="example-gallery">
						</div>
					</div>
				</div>

				<!-- Carousel Navigation -->
				<div id="carousel-thumbs" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="row mx-0">
								<div id="carousel-selector-0"
									class="thumb col-4 col-sm-2 px-1 py-2 selected"
									data-target="#myCarousel" data-slide-to="0">
									<img src="https://source.unsplash.com/Pn6iimgM-wo/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-1"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="1">
									<img src="https://source.unsplash.com/tXqVe7oO-go/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-2"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="2">
									<img src="https://source.unsplash.com/qlYQb7B9vog/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-3"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="3">
									<img src="https://source.unsplash.com/QfEfkWk1Uhk/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-4"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="4">
									<img src="https://source.unsplash.com/CSIcgaLiFO0/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-5"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="5">
									<img src="https://source.unsplash.com/a_xa7RUKzdc/600x400/"
										class="img-fluid" alt="...">
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row mx-0">
								<div id="carousel-selector-6"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="6">
									<img src="https://source.unsplash.com/uanoYn1AmPs/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-7"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="7">
									<img src="https://source.unsplash.com/_snqARKTgoc/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-8"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="8">
									<img src="https://source.unsplash.com/M9F8VR0jEPM/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div id="carousel-selector-9"
									class="thumb col-4 col-sm-2 px-1 py-2"
									data-target="#myCarousel" data-slide-to="9">
									<img src="https://source.unsplash.com/Q1p7bh3SHj8/600x400/"
										class="img-fluid" alt="...">
								</div>
								<div class="col-2 px-1 py-2"></div>
								<div class="col-2 px-1 py-2"></div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-thumbs"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carousel-thumbs"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	<!-- 갤러리 뷰 끝 -->
	
	<!-- 갤러리 내용 시작 -->
	
	<!-- 갤러리 내용 끝 -->


	<hr>
	<!-- 갤러리 댓글 시작 -->
	<br><br>
	<div class="container bootstrap snippet">
    <div class="row">
		<div class="col-md-12">
		    <div class="blog-comment">
				<h3 class="text-success">Comments</h3>
                <hr/>
				<ul class="comments">
				<li class="clearfix">
				  <img src="https://bootdey.com/img/Content/user_1.jpg" class="avatar" alt="">
				  <div class="post-comments">
				      <p class="meta">Dec 18, 2014 <a href="#">JohnDoe</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
				      <p>
				          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				          Etiam a sapien odio, sit amet
				      </p>
				  </div>
				</li>
				<li class="clearfix">
				  <img src="https://bootdey.com/img/Content/user_2.jpg" class="avatar" alt="">
				  <div class="post-comments">
				      <p class="meta">Dec 19, 2014 <a href="#">JohnDoe</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
				      <p>
				          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				          Etiam a sapien odio, sit amet
				      </p>
				  </div>
				
				  <ul class="comments">
				      <li class="clearfix">
				          <img src="https://bootdey.com/img/Content/user_3.jpg" class="avatar" alt="">
				          <div class="post-comments">
				              <p class="meta">Dec 20, 2014 <a href="#">JohnDoe</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
				              <p>
				                  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				                  Etiam a sapien odio, sit amet
				              </p>
				          </div>
                <ul class="comments">
				      <li class="clearfix">
				          <img src="https://bootdey.com/img/Content/user_3.jpg" class="avatar" alt="">
				          <div class="post-comments">
				              <p class="meta">Dec 20, 2014 <a href="#">JohnDoe</a> says : <i class="pull-right"><a href="#"><small>Reply</small></a></i></p>
				              <p>
				                  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				                  Etiam a sapien odio, sit amet
				              </p>
				          </div>
				      </li>
				  </ul>
				      </li>
				  </ul>
				</li>
				</ul>
			</div>
		</div>
	</div>
</div>
	<!-- 갤러리 댓글 끝 -->
	

	</div>

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>