<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/infoStyle.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"  href="./resources/assets/css/owl.carousel.min.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script type="text/javascript">
 
$(function(){
	$(".hero-text").html("<hr id='infoHR'><h1>회사소개</h1>");
	$(".feature-page.header-area").css({"background-image":"url('resources/assets/img/studdypeInfo.png')"});	

	var owl = $('#carousel');

	owl.owlCarousel({
		item : 3,
		loop : true, // 반복여부
		margin : 20,
		pagination: true
	});

	$('#right-em').click(function() {
		owl.trigger('next.owl.carousel');
	})

	$('#left-em').click(function() {
		owl.trigger('prev.owl.carousel', [ 300 ]);
	})
});
</script>

</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
<a class="navbar-brand" href="studyList.do"><img src="./resources/assets/img/logo_white.png" alt="" id="logo"></a>
<div class="main-section">
	<div class="title">
		<span>
			<em></em>
		</span>
	<h2>StuDdype 이야기</h2>
	</div>
	<div id="content">
		<div id="content-left">
			<img src="./resources/assets/img/studdypeGif.gif">
		</div>
		<div id="content-right">
			프로젝트 팀을 꾸리고 어떤 주제로 프로젝트를 진행하는 것이 좋을지에 대해서 회의를 지속적으로 했습니다. 
			각자 하고 싶어하는 주제가 있는지 먼저 공유를 하고 그 안에서 파이널 프로젝트로 좋을 것 같은 주제로 선정을 하게 되었습니다. 
			세미 프로젝트를 해봤기 때문에 파이널 프로젝트에서는 조금 더 난이도가 있는 주제가 필요했습니다. 
			그러던 중 <b>비대면 스터디 플랫폼</b>과 <b>배달팁 절약 플랫폼</b>으로 추려졌고 두가지 중에 다수결 투표를 통해 <b>비대면 스터디 플랫폼</b>이 선정되었습니다. 
			그래서 <b>커넥츠</b>를 참고하며 파이널 프로젝트를 시작하게 되었습니다.
			<br><br><br>
			팀은 7명으로 구성되어 있고 프로젝트 시작 전 파트를 크게는 <b>메인 페이지</b>, <b>커뮤니티 페이지</b>로 나누고 
			세분화하된 역할을 각 팀원 당 맡아 시작하게 되었습니다. 그리고 매 주 금요일마다 회의를 통해 한 주의 작업 진행도와 
			건의사항 등을 공유하면서 서로에게 피드백을 지속적으로 해주면서 프로젝트를 진행해 나아갔습니다. 진행 중에 어려움이 있을 시에는
			학원 강사님과 팀원 중 능숙한 팀원 도움을 받아 어려움을 해결해 나아갔습니다. 
			프로젝트 작업 막바지에는 자신의 파트를 완료한 팀원이 아직 남은 부분을 도우며 함께 프로젝트를 완성했습니다. 
		</div>
	</div>
</div>
<div class="main-section2">
	<div id="container-carousel">
		<div class="title">
			<span>
				<em></em>
			</span>
		<h2>StuDdype 팀 소개</h2>
		</div>
		<div id="carousel" class="owl-carousel owl-theme owl-loaded owl-drag">
			<div>
				<a href="#0"><img src="./resources/assets/img/profile1.png"></a>
			</div>
			<div>
				<img src="./resources/assets/img/profile3.png">
			</div>
			<div>
				<img src="./resources/assets/img/profile2.png">
			</div>
			<div>
				<img src="./resources/assets/img/profile4.png">
			</div>
			<div>
				<img src="./resources/assets/img/profile5.png">
			</div>
			<div>
				<img src="./resources/assets/img/profile6.png">
			</div>
			<div>
				<img src="./resources/assets/img/profile7.png">
			</div>
		</div>
		<div>
			<span id="arrow-span">
				<em id="left-em">prev</em>
				<em id="right-em">next</em>
			</span>
		</div>
	</div>
</div>
	
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