<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스터띱 자유게시판</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/mainstyle.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">

<!--  freeboard mainsection css -->
<link rel="stylesheet" href="./resources/css/community/freeboard/mainsection.css">

<!-- freeboard css -->
<link rel="stylesheet" href="./resources/css/community/freeboard/freeboard.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>



<script type="text/javascript">
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
	}
	
	}
	// 이전 페이지 그룹 
	function prePageGroup(){
		if( ${startPage - 1 > 0}){
			$("#pagenum").val(${startPage-1});
			var pageform = document.getElementById('pageform');
			pageform.submit();
		}
	}
function search_chk(){
	var keyword = $("#search_keyword");
	if( keyword.val() == null || keyword.val().trim() == "" ){
		alert("검색어를 입력해주세요.");
	}else{
		$("#search_form").submit();
	}
	
}

</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<h1 >자유게시판</h1>


		<!-- 보드 --> <!-- 게시글제목 / 작성자 / 작성시간 / 조회수  -->
		<table class="boardlist">
			<col width="600px"><col width="250px"><col width="200px"><col width="150px">
			<tr class="headtr">
				<th>게시글 제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>조회수</th>
			</tr>
			<c:if test="${not empty noticeList }">
				<c:forEach var="i" begin="0" end="${noticeList.size()-1 }" step="1">
						<tr class="notice_tr">
							<td class="notice_title"><div class="notice_tag">공지</div>
								<a href="noticedetail.do?b_no=${noticeList.get(i).getB_no() }">${noticeList.get(i).getB_title() }
								<c:if test="${noticeReplyCntMap.get(noticeList.get(i).getB_no())!=0}">
									<span class="reply_cnt">[${noticeReplyCntMap.get(list.get(i).getB_no())}]</span>
								</c:if>								
								</a>
							</td>
							<td class="tdwriter">${noticeMemberMap.get( noticeList.get(i).getB_no()).getMem_id() }(${noticeMemberMap.get( noticeList.get(i).getB_no()).getMem_name()})</td>
							<td class="tddate"><fmt:formatDate value="${noticeList.get(i).getB_regdate()}" pattern="YYYY.MM.dd"/></td>
							<td class="tdcnt">${noticeList.get(i).getB_cnt() }</td>
						</tr>
					</c:forEach>
			</c:if>
			
			<c:choose>
				<c:when test="${empty list }">
					<td colspan="4">게 시 글 이 없 습 니 다</td>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
						<tr>
							<td class="tdtitle">
								<a href="freedetail.do?b_no=${list.get(i).getB_no() }">${list.get(i).getB_title() }
								<c:if test="${replyCntMap.get(list.get(i).getB_no())!=0}">
									<span class="reply_cnt">[${replyCntMap.get(list.get(i).getB_no())}]</span>
								</c:if>								
								</a>
							</td>
							<td class="tdwriter">${memberMap.get( list.get(i).getB_no()).getMem_id() }(${memberMap.get( list.get(i).getB_no()).getMem_name()})</td>
							<td class="tddate"><fmt:formatDate value="${list.get(i).getB_regdate()}" pattern="YYYY.MM.dd"/></td>
							<td class="tdcnt">${list.get(i).getB_cnt() }</td>
						</tr>
					</c:forEach>
					
				</c:otherwise>
			</c:choose>
			
			
			
		</table>

		<div style="width: 100%; height: 100px;">
			<button class="writeBtn" onclick="location.href='freewriteform.do'">글 쓰기</button>
		</div>
		<!-- 검색 부분 -->
		<div class="search_div">
			<form action="free_search.do" method="post" id="search_form" >
				
				<select name="searchType"  class="search_type_box" id="searchType">
					<option value="title_content">제목+내용</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" placeholder="검색어를 입력해주세요." class="search_content_box" id="search_keyword" name="keyword">
				<input type="button" value="검색" onclick="search_chk();"  class="search_btn">
			</form>
		</div>

		<!-- 페이징 -->
		<c:if test="${not empty list }">
				<div class="pagin_div">
					<ul class="pagin">
						<li class="page_li"><a class="next_page" onclick="prePageGroup();"><</a></li>
				
			
						<!-- ----------------------------------- -->
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1"	varStatus="status">
							<c:choose>
								<c:when test="${currentPage == startPage + status.count -1 }">
									<li class="page_li li_hober"><a class="page_a current_page"	onclick="movePage(this);">${startPage + status.count -1 }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page_li li_hober"><a class="page_a"	onclick="movePage(this);">${startPage + status.count -1 }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li class="page_li"><a class="next_page" onclick="nextPageGroup();">></a></li>
					</ul>

					<form action="freeboard.do" method="post" id="pageform" name="pageform">
						<input type="hidden" name="pagenum" id="pagenum">
					</form>

				</div>
			</c:if>

	</div>


	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>