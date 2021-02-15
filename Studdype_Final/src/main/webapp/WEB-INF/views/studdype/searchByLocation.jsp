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
<link rel="stylesheet" href="./resources/css/studdype/searchLocation/searchLocation.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

<script type="text/javascript">
	$(function(){
		// 위치 숨기기
		$(".justify-content-center").hide();
		
		// 시 미선택 시 구/군은 숨김 
		$("#selectLocationGu option").hide();
		
		if("${si}" != null) {
			$("#selectLocationSi option").each(function() {
				if($(this).val() == "${si}") {
					$(this).attr("selected", "selected");
					$("." + $("#selectLocationSi option:selected").val()).show();
				}
			});
		}
		
		if("${gu}" != null) {
			$("#selectLocationGu option").each(function() {
				if($(this).val() == "${gu}") {
					$(this).attr("selected", "selected");
				}
			});
		}
		
		// 시 option 선택 시 해당 시에 대한 구/군 리스트 보여주기 (전에 보여준 구/군은 다시 숨김)
		$(document).on("change", "#selectLocationSi", function() {
			var selectSi = $("#selectLocationSi option:selected").val();
			$("#selectLocationGu option").removeAttr("selected");
			$("#selectLocationGu option").hide();
			$("." + selectSi).show();
		});
		
	});

function search() {
	var locationSi = $("#selectLocationSi option:selected").text();
	var locationGu = $("#selectLocationGu option:selected").text();
	
	if(locationSi == "(시 단위)") {
		alert("지역 시를 선택하고 검색버튼을 눌러주세요.");
		return false;
	}else if(locationGu == "(구/군 단위)") {
		$("#type").val("si");
		return true;
	}else {
		$("#type").val("gu");
		return true;
	}
	
} 
</script>
</head>

<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	<div class="img" >
		<img src="./resources/img/location.png" style="width:100%;height:400px;">
		<div class="content">
			<h3>지역별 검색 </h3>
			<p style="font-size:13px;">지역별로 다양한 스터디를 참여해보세요</p>
			<p style="font-size:12pt;"></p>
		</div>
	</div>
	<!-- 스터디 영역 -->
	<div class="blogpost-area">
		<form id="location_search_area" action="studyListLocation.do" onsubmit="return search();">
			<div id="si">
				<label>스터디 지역(시)</label> 
				<input type="hidden" id="type" name="searchType" value="">
					<select class="form-control" name="si_no" id="selectLocationSi">
						<option>(시 단위)</option>
						<c:forEach var="locationsi" items="${sidtos}">
							<option value="${locationsi.si_no }">${locationsi.si_name }</option>
						</c:forEach>
				</select>
			</div>
						
			<div id="gu">
				<label style="margin-left:6.5%;">스터디 지역(구/군)</label> 
				<select class="form-control" name="gu_no" id="selectLocationGu" style="margin-left:7%;margin-top:-1%;">
					<option value="0">(구/군 단위)</option>
					<c:forEach var="locationgu" items="${ gudtos}">
						<option class="${locationgu.si_no }"
							value="${locationgu.gu_no }">${locationgu.gu_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-group">
				<button type="submit" class="Search" name="Search" style="border:none; background-color:white;" >
					<img src="./resources/assets/img/icon_search_purple.png" style="width: 50px;">
				</button>
			</div>  
		</form>
		<div class="container-fluid">
			<div class="row">
				<c:choose>
					<c:when test="${empty studyList}">
						<div id="no-studyList-area">
							<img src="./resources/img/no-list.png">
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${studyList}" var="studyDto">
							<div class="col-sm-3 p-5 blogs-load"
								onclick="location.href='studdypeDetailForm.do?s_no=${studyDto.getS_no()}'" style="cursor: pointer;">
								<div class="single-blog-post">
									<div class="blog-img-responsive-4by3">
										<!-- 스터디 이미지 -->
										<img src="${studyDto.getPhoto() }" alt="" class="img-fluid" style="width: 379px; height: 233px;" onError="this.src='./resources/img/no-image1.png'">
									</div>
									<!-- 제목/장소아이콘/장소/카테고리 -->
									<div class="blog-meta">
										<h3 style="white-space : nowrap; text-overflow : ellipsis; overflow:hidden;">${studyDto.s_name}</h3>
										<br> <span><img src="./resources/assets/img/profile_placeholder.png"
											style="width: 15px;"><b>${siList.get(studyDto.si_no) }&nbsp;
											${guList.get(studyDto.gu_no)}</b><a style="float:right;">${cateList.get(studyDto.cate_no)}</a> </span>
									</div>

									<p style="white-space : nowrap; text-overflow : ellipsis; overflow:hidden;">${studyDto.s_info }</p>
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
					</c:otherwise>
				</c:choose>
			</div>
		</div>
				
		<c:if test="${login != null }">
			<input type="button" value="스터디 생성" class="studyBtn" onclick="location.href='createStuddypeform.do'">
		</c:if>
				
	</div>		
	<!-- 스터디 리스트 끝 -->

	<!-- 스터디 리스트 페이징 -->
	<c:if test="${not empty studyList }">
	 <div class="pagin_div">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page_li"><a class="next_page" href="studyListLocation.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page_li li_hober"><a class="page_a current_page" href="studyListLocation.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page_li"><a class="next_page" href="studyListLocation.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
	</c:if>
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