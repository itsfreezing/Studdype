<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* 검색창 CSS */
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
</style>
<script type="text/javascript">
	$(function() {
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
		  
		  // 검색창 JS
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
	});
</script>
</head>
<body>
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
      
      <!-- 검색어 사용할거임 -->
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
</body>
</html>