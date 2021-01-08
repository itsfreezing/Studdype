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
<link href="https://fonts.googleapis.com/css?family=Quicksand:400,700" rel="stylesheet">


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
       		
       	<!-- css 안먹어서 style 직접 기재 --> 
		<div id="BIGBOX" style="display: inline-block; width: 50%;">
		<!-- partial:index.partial.html --> 
		<svg class="close-search" width="100%" viewBox="120 265 800 70" >               
		 <defs>
		      <g id="searchGroup" fill="#7362DE">
		        <g id="se">
		       <rect id="hit" width="545" height="60" y="6" fill="transparent"/>
		          <path d="M.49,54.88a2.19,2.19,0,0,1,3.12-.28c3.12,2.3,8.07,5.23,13.76,5.23a13.58,13.58,0,0,0,8.54-2.75,6.82,6.82,0,0,0,3.39-5.51c-.09-2.11-.91-3.58-3.21-5.5C24.17,44.6,21,43.5,16.55,42.76l-.18-.09c-4-.73-7.62-1.65-10.19-3.49a9.36,9.36,0,0,1-4.86-8.07A11.13,11.13,0,0,1,6.18,22.3a19.29,19.29,0,0,1,11-3c5.78,0,9.91,2.66,13.4,4.86a2.34,2.34,0,0,1,.64,3.12,2.21,2.21,0,0,1-3,.65c-3.3-2.21-6.6-4.5-11-4.5A13.48,13.48,0,0,0,8.66,26a6.74,6.74,0,0,0-2.85,5.14c0,1.83.83,3.12,2.57,4.5a22.86,22.86,0,0,0,9.18,3.12h.18A31,31,0,0,1,28.66,42.4a11.2,11.2,0,0,1,5.05,9.17c0,3.76-2.11,6.79-5.14,9.09a18.37,18.37,0,0,1-11.2,3.58c-7.24-.1-12.93-3.49-16.61-6.43A2.07,2.07,0,0,1,.49,54.88Z"/>
		          <path d="M45.54,41.85c0-12.48,9.73-22.58,21.84-22.58C79,19.27,88.12,28.45,89,40.19v.37a2.08,2.08,0,0,1-2.2,2H50c.46,9.82,8.17,17.25,17.43,17.25a16.91,16.91,0,0,0,14.5-8.16,2.14,2.14,0,0,1,2.94-.74,2.33,2.33,0,0,1,.73,3.12A21.42,21.42,0,0,1,67.38,64.24C55.27,64.24,45.54,54.14,45.54,41.85Zm4.68-3.58H84.27A17.36,17.36,0,0,0,67.38,23.68,17.56,17.56,0,0,0,50.22,38.27Z"/>
		        </g>
		        <g id="rch">
		          <path d="M161.44,21.57a2.2,2.2,0,0,1,2.29-2.21,2.16,2.16,0,0,1,2.11,2.21v9.91a7.29,7.29,0,0,1,.64-1.1c3.4-5.33,9.37-11,18-11a2.18,2.18,0,0,1,2.2,2.21,2.23,2.23,0,0,1-2.2,2.2c-5.87,0-9.91,3.3-13,7.34A40.37,40.37,0,0,0,166,41.57a1.35,1.35,0,0,0-.19.73V62a2.16,2.16,0,0,1-2.11,2.21A2.2,2.2,0,0,1,161.44,62Z"/>
		          <path d="M196.22,41.66c0-12.48,10.27-22.39,23.12-22.39a23.17,23.17,0,0,1,14.32,5,2.06,2.06,0,0,1,.27,3,2.25,2.25,0,0,1-3,.37,18.44,18.44,0,0,0-11.56-4c-10.46,0-18.72,8.17-18.72,18.08,0,10.1,8.26,18.17,18.72,18.17a19,19,0,0,0,11.56-3.94,2.26,2.26,0,0,1,3,.36,2.17,2.17,0,0,1-.46,3.21,23.18,23.18,0,0,1-14.13,4.78C206.49,64.24,196.22,54.33,196.22,41.66Z"/>
		          <path d="M284.86,37c0-7.89-6.42-13.21-14.32-13.21S256.32,29.09,256.32,37V62.31c0,.18-.09.27-.09.37s-.09.27-.19.36a2.07,2.07,0,0,1-1.37,1.1.31.31,0,0,1-.19.1H254a2.51,2.51,0,0,1-1.75-.74,2.75,2.75,0,0,1-.36-.73,1.89,1.89,0,0,1-.1-.74V2.2a2.25,2.25,0,0,1,4.5,0V25.88a18.57,18.57,0,0,1,14.22-6.61c10.37,0,18.82,7.34,18.82,17.71V62a2.25,2.25,0,0,1-4.5,0Z"/>
		        </g>
		        <g id="letterA" stroke="#7362DE">
		          <rect id="field" x="102.03" y="21.49" width="41" height="41" rx="20.5" ry="20.5" fill="none"  stroke-linecap="round" stroke-linejoin="round" stroke-width="4.5"/>
		          <line id="tail" x1="143.28" y1="62.59" x2="143.28" y2="21.82" fill="none"  stroke-linecap="round" stroke-linejoin="round" stroke-width="4.5"/>
		          <g id="magnifier" opacity="0.5">
		            <circle cx="121.92" cy="41.93" r="11" fill="none"  stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
			      <line x1="131.24" y1="48.22" x2="139.99" y2="53.95" fill="none"  stroke-miterlimit="10" stroke-width="3"/>
			   	  </g>
				</g>
		  		</g>    
		<g id="close" stroke="#7362DE" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" opacity="0.5">
		  <circle cx="12.5" cy="12.5" r="11" fill="transparent" />
		        <line x1="8.78" y1="8.62" x2="16.46" y2="16.61" fill="none" />
		        <line x1="16.46" y1="8.62" x2="8.78" y2="16.61" fill="none" />
		      </g>  
		  </defs>
		 <g transform="translate(-30, 0)">
		      <use class="wholeSearch" xlink:href="#searchGroup" x="300" y="270"/>
		      <use class="close" xlink:href="#close" x="511" y="300"/>
		  </g>
		 </svg>
		<input id="searchInput" autocomplete="off" maxlength="32"></input>
		</div>
		<div style="display: inline-block; width: 28%;">
			<button class="submitBtn" id="listBtn_insertform" onclick="location.href='meetinsertform.do'" style="right: -12%; margin-top: 0;">모임 등록</button>   
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