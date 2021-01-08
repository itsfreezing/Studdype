<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" 
      xmlns:svg="http://www.w3.org/2000/svg">
<head>
<meta charset="UTF-8">
<title>Meet List Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- owl.carousel오류로 인해 최상단에 script 추가해야 함 -->
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">

<!-- commond css -->
<link rel="stylesheet" href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">

<!-- meetboard css -->
<link rel="stylesheet" href="./resources/css/community/meet.css">

<!-- searchBox font -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:700" rel="stylesheet">


<script type="text/javascript">

(function ($) {
	 $ (document) .ready (function () {
		 /* 슬라이더 */
		 $('.owl-carousel').owlCarousel({
		        items:1,                 	// 한번에 보여줄 아이템 수
		        loop:true,               	// 반복여부
		        //margin:35,               	// 오른쪽 간격
		        autoplay:true,				// 자동재생 여부
		        autoplayTimeout:1800,    	// 재생간격
		        autoplayHoverPause:false  	//마우스오버시 멈출지 여부
		    });    
	 		
		    $('.customNextBtn').click(function() {
		    	$('.owl-carousel').trigger('next.owl.carousel');
		    })
		    
		    $('.customPrevBtn').click(function() {
		    	$('.owl-carousel').trigger('prev.owl.carousel', [300]);
		    })
		 });
	 })(jQuery);

	$(function(){
		/* 부모 선택 후 흰색변경 JS */
		$(".current_page").parent().css('color','white');
		$(".current_page").css('border','1px solid #6434ef');
		$(".current_page").css('cursor','default');
		
	});	
	
	// 페이징---------------------- 
	// 페이지 이동 
	function movePage(pagenum){
		$("#pagenum").val(pagenum.text);
		var pageform = document.getElementById('pageform');
		pageform.submit();
	}
	
	// 다음 페이지그룹 
	function nextPageGroup(){
		if( ${endPage < totalPageNum}){
			$("#pagenum").val(${endPage+1});
			var pageform = document.getElementById('pageform');
			pageform.submit();
		};
	}
	
	// 이전 페이지 그룹 
	function prePageGroup(){
		if( ${startPage - 1 > 0}){
			$("#pagenum").val(${startPage-1});
			var pageform = document.getElementById('pageform');
			pageform.submit();
		};
	}
</script>
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
     <!--main conternt 섹션-->
     <div class="main-section">
        
		<!-- 모임관리 페이지 슬라이더 영역 -->
		<div class="owl-carousel hero-slider-area" id="mainBanner">
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage1.png">
			</div>
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage2.png">
			</div> 
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage3.png">
			</div>
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage4.png">
			</div>
		</div>
		<!-- 슬라이더 끝 -->        
      
       	<!-- searchDiv -->
       	<div id="bigBox">
	       	<div class="divBox">
		       	<div class="searchDiv">
				    <svg xmlns="http://www.w3.org/2000/svg" width="355.5" height="87.99">
				        <path class="right" fill="none" stroke="#6434ef" stroke-width="4" stroke-miterlimit="10" d="M177.75 85.99h133.5c23.334 0 42.25-18.916 42.25-42.25C352.944 20.528 333.967 2 310.748 2H177.75"/>
				        <path class="left" fill="none" stroke="#6434ef" stroke-width="4" stroke-miterlimit="10" d="M177.75 85.99H44.25C20.916 85.99 2 67.074 2 43.74 2.556 20.528 21.533 2 44.752 2H177.75"/>
				    </svg>
		   			<p></p>
		    		<input type="text" />
		
		    		<span>Search</span>
				</div>
			</div>
			<div id="listBtnDiv">
				<button class="submitBtn" id="listBtn_insertform" onclick="location.href='meetinsertform.do'" style="float: right; margin-top: 0;">모임 등록</button>   
			</div> 
       	</div>
       	
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="2">---- 모임이 존재하지 않습니다. ---- </td>
				</tr>
			</c:when>
			 <c:otherwise>
				<c:forEach var ="i" begin="0" end="${list.size()-1 }" step="1">
			        <table id="meetList" onclick="location.href='meetdetail.do?meetno=${list.get(i).getMeet_no() }'">
						<tr>
							<td id="date"> <fmt:formatDate value="${list.get(i).getMeet_regdate()}" pattern="yyyy.MM.dd"/> </td>
							<td id="location"><img src="./resources/assets/img/profile_placeholder.png">${ list.get(i).getMeet_addr() }&nbsp;${ list.get(i).getMeet_addr_detail() }</td>
						</tr>
						<tr>
							<td id="title" colspan="2">${ list.get(i).getMeet_title() }</td>
						</tr>
						<tr>
							<td id="writer">${writerMap.get( list.get(i).getMeet_no() ) }</td>
							<td id="recruitment">모집기간 <fmt:setLocale value="en_US" scope="session"/>
														<fmt:parseDate value='${ list.get(i).getVote_startdate() }' var='vote_startdate' pattern="yyyy-MM-dd HH:mm:ss"/>
														<fmt:formatDate value="${ vote_startdate }" pattern="yyyy.MM.dd"/> ~ 
														<fmt:parseDate value='${ list.get(i).getVote_enddate() }' var='vote_enddate' pattern="yyyy-MM-dd HH:mm:ss"/>
														<fmt:formatDate value="${ vote_enddate }" pattern="yyyy.MM.dd"/>
							</td>
						</tr>
					</table>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<!-- 페이징 -->
		<div class="pagin_div">
			<ul class="pagin">
				<li class="page_li"><a class="next_page" onclick="prePageGroup();"><</a></li>
			
				<!-- ----------------------------------- -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1"	varStatus="status">
					<c:choose>
						<c:when test="${currentPage == startPage + status.count -1 }">
							<li class="page_li li_hober"><a class="page_a current_page"
								onclick="movePage(this);">${startPage + status.count -1 }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page_li li_hober"><a class="page_a"	onclick="movePage(this);">${startPage + status.count -1 }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page_li"><a class="next_page"
					onclick="nextPageGroup();">></a></li>
			</ul>

			<form action="meetlist.do" method="post" id="pageform" name="pageform">
				<input type="hidden" name="pagenum" id="pagenum">
			</form>
		</div>
    </div>
   
    
    <jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
	
	<!-- search Box script -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js'></script>
    <script src="./resources/assets/js/searchScript.js"></script>
    
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/loadmore.js"></script>
    <script src="./resources/assets/js/prefixfree.min.js"></script>
    <script src="./resources/assets/js/main.js"></script>
</body>
</html>