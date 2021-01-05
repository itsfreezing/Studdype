<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>

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
.main-section {
	
}

#main-section-top {
	display: block;
	position: relative;
	width: 100%;
	border:1px solid black;
}

#main-section-bottom {
	display:block;
	position:relative;
	width:100%;
	border:1px solid red;
}

/* 검색 체크 css************************************************************ */
.switch-button {
	width: 400px;
	height: 40px;
	text-align: center;
	position: absolute;
	left: 50%;
	transform: translate3D(-50%, -50%, 0);
	will-change: transform;
	z-index: 197 !important;
	cursor: pointer;
	transition: 0.1s ease all;
	border: 1px solid white;
	background-color: #868e96;
}

.switch-button-case {
	display: inline-block;
	background: none;
	width: 49%;
	height: 100%;
	color: white;
	position: relative;
	border: none;
	transition: 0.1s ease all;
	text-transform: uppercase;
	letter-spacing: 5px;
	padding-bottom: 1px;
	font-weight: bolder;
}

.switch-button-case:hover {
	color: grey;
	cursor: pointer;
}

.switch-button-case:focus {
	outline: none;
}

.switch-button .active {
	color: #151515;
	background-color: white;
	position: absolute;
	left: 0;
	top: 0;
	width: 50%;
	height: 100%;
	z-index: -1;
	transition: 0.1s ease-out all;
}

.switch-button .active-case {
	color: #151515;
}

/* ************************************************************ */
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
}

form {
  transition: all 0.5s;
  position: absolute;
  top: 33%;
  margin-top:2%;
  transform: translateY(-50%);
}

.finder {
  border: 1px solid #fff;
  background-color: #f6f5f0;
  border-radius: 15px;
  padding: 8px;
  box-shadow: 9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px rgba(255, 255, 255, 0.5);
}

.finder_outer {
  display: flex;
  width: 500px;
  padding: 1.5rem 2rem;
  border-radius: 10px;
  box-shadow: inset 10px 10px 15px -10px #c3c3c3, inset -10px -10px 15px -10px #ffffff;
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
  width:100%;
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

@keyframes spinner {
  0% {
    transform: rotateZ(45deg);
  }
  100% {
    transform: rotateZ(405deg);
  }
}
/* ************************************************************ */
</style>
<script type="text/javascript">
	$(function() {

		// 버튼 이벤트 영역
		var switchButton = document.querySelector('.switch-button');
		var switchBtnRight = document
				.querySelector('.switch-button-case.right');
		var switchBtnLeft = document.querySelector('.switch-button-case.left');
		var activeSwitch = document.querySelector('.active');

		function switchLeft() {
			switchBtnRight.classList.remove('active-case');
			switchBtnLeft.classList.add('active-case');
			activeSwitch.style.left = '0%';
		}

		function switchRight() {
			switchBtnRight.classList.add('active-case');
			switchBtnLeft.classList.remove('active-case');
			activeSwitch.style.left = '50%';
		}

		switchBtnLeft.addEventListener('click', function() {
			switchLeft();
		}, false);

		switchBtnRight.addEventListener('click', function() {
			switchRight();
		}, false);
		
		///////////////////////////////////////////////////////////////////////
		
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

		$("#register-search").click(function() {
			$("#main-section-bottom").hide();
		});

		$("#new-search").click(function() {
			$("#main-section-bottom").show();
		});
	});
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

<!-- 메인 섹션----------------------------------------------------------------------------- -->
	<div class="main-section">
	
	<!--메인 상단 세션 --------------------------------------------------------------------- -->
		<div id="main-section-top">
		<!-- 검색 체크 영역 -->
		<!-- ----------------------------------------------------------------- -->
			<div class="switch-button">
				<span class="active"></span>
				<button class="switch-button-case left active-case"
					id="register-search">등록된 도서 검색</button>
				<button class="switch-button-case right" id="new-search">새
					도서 검색</button>
			</div>
		<!-- ----------------------------------------------------------------- -->
		
		<!-- 검색창 영역 -->
		<!-- ----------------------------------------------------------------- -->
			<div class="search-container">
		<!-- ----------------------------------------------------------------- -->
				<form autocomplete="off">
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
			<br><br><br><br><br><br><br>
		<!-- -------------------------------------------------------------------- -->
		</div>
	
		<!-- 리스트영역 -------------------------------------------------------------------- -->
		<div id="main-section-bottom">
			<h1>검색 리스트 영역</h1>
		</div>
	</div>

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>