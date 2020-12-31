<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<!-- freeboard css -->
<link rel="stylesheet" href="./resources/css/community/freeboard.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<!--   페이징 자바스크립트 추후 수정<script type="text/javascript">
$(function(){
	$("#fo").submit(function(){
		var list = document.getElementsByName("type1");
		var cnt = 0;
		for(var i=0; i<list.length; i++){
			if(list[i].checked == true){
				cnt++;
			
			}
		}
		if(cnt==0){
			for(var i=0; i<list.length; i++){
				list[i].checked = true;
				console.log(list[i].checked);
			}
		}
	});
});
$(function(){
	$("#fo").submit(function(){
		var list = document.getElementsByName("type2");
		var cnt = 0;
		for(var i=0; i<list.length; i++){
			if(list[i].checked == true){
				cnt++;
			
			}
		}
		if(cnt==0){
			for(var i=0; i<list.length; i++){
				list[i].checked = true;
				console.log(list[i].checked);
			}
		}
	});
	
});
function movePage(pagenum){
	$("#pagenum").val(pagenum.text);
	var pageform = document.getElementById('pageform');
	pageform.submit();
	
}
function nextPageGroup(){
	if( ${endPage + 1 < totalPageNum}){
		$("#pagenum").val(${endPage+1});
		var pageform = document.getElementById('pageform');
		pageform.submit();
	}
	
}
function prePageGroup(){
	if( ${startPage - 1 > 0}){
		$("#pagenum").val(${startPage-1});
		var pageform = document.getElementById('pageform');
		pageform.submit();
	}
}	
</script> -->
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<h1>자유게시판</h1>
	
	
		<!-- 페이징 -->
		<div class="pagin_div">
			<ul class="pagin">
				<li class="page_li"><a class="next_page"
					onclick="prePageGroup();"><</a></li>

				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1"
					varStatus="status">
					<c:choose>
						<c:when test="${currentPage == startPage + status.count -1 }">
							<li class="page_li li_hober"><a class="page_a current_page"
								onclick="movePage(this);">${startPage + status.count -1 }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page_li li_hober"><a class="page_a"
								onclick="movePage(this);">${startPage + status.count -1 }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page_li"><a class="next_page"
					onclick="nextPageGroup();">></a></li>
			</ul>

			<form action="controller.do" method="post" id="pageform"
				name="pageform">
				<input type="hidden" name="command" value="alba"> <input
					type="hidden" name="pagenum" id="pagenum">
			</form>

		</div>
	</div>

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>