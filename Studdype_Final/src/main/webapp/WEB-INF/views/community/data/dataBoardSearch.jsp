<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습 자료실</title>

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
<link rel="stylesheet" href="./resources/css/community/mainsection.css">

<link rel="stylesheet" href="./resources/css/community/data/dataBoardSearch.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<script type="text/javascript">
	$(function() {
		/* 부모 선택 후 흰색변경 JS */
		$(".current_page").parent().css('color','white');
		$(".current_page").css('border','1px solid #6434ef');
		$(".current_page").css('cursor','default');
		
		// 공지사항 첨부파일 열기 함수
		$(".attach_file_img").click(function() {
			$(".open").removeClass("open");
			$(this).next().addClass("open");
		});
		
		// 첨부파일 닫기 함수
		$(".file_close").click(function() {
			$(".open").removeClass("open");
		});
		
		// 학습자료실 파일 다운로드 함수
		$(".data_file_attach_div").click(function() {
			var f_no = $(this).children().first().val();
			
			location.href="dataFileDownload.do?f_no="+f_no;
			
		});
		
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
	
	<div class="main-section">
		<h1 style="font-size:20px;" ><span class="text1">'${search.keyword }' </span>	
		<c:choose>
			<c:when test="${search.searchType eq 'title_content' }">
				제목 + 내용 검색결과입니다.
			</c:when>
			<c:when test="${search.searchType eq 'title' }">
				제목 검색결과입니다.
			</c:when>
			<c:when test="${search.searchType eq 'content' }">
				내용 검색결과입니다.
			</c:when>
			<c:when test="${search.searchType eq 'writer' }">
				작성자 검색결과입니다.
			</c:when>
		</c:choose>
		</h1>
		
		<!-- 보드 --> <!-- 게시글제목 / 작성자 / 작성시간 / 조회수  -->
		<table id="Boardlist">
			<col width="600px"><col width="100px"><col width="250px"><col width="150px"><col width="100px">
			<tr>
				<th>게시글 제목</th>
				<th>첨부</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${empty dataList }">
					<td colspan="5" style="text-align:center; font-weight:bold;">검 색 결 과 가 없 습 니 다</td>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="0" end="${dataList.size()-1 }" step="1">
						<tr class="data_tr">
							<td class="td_data_title"><a href="dataDetail.do?b_no=${dataList.get(i).getB_no() }">${dataList.get(i).getB_title() }</a>
							<c:if test="${replyCntMap.get(dataList.get(i).getB_no()) != 0}">
								<span class="td_reply_cnt">[${replyCntMap.get(dataList.get(i).getB_no()) }]</span>
							</c:if>
							</td>
							<td class="td_data_file">
								<c:if test="${not empty dataFileMap.get(dataList.get(i).getB_no()) }">
								<img class="attach_file_img" src="./resources/img/link-icon.png">
								<div class="file_entirety_div">
									<c:forEach var="j" begin="0" end="${dataFileMap.get(dataList.get(i).getB_no()).size()-1 }" step="1">
										<div class="data_file_attach_div file_div">
											<input type="hidden" value="${dataFileMap.get(dataList.get(i).getB_no()).get(j).getF_no() }">
											<img class="file_format_img" src="./resources/img/fileFormat/${dataFileFormatMap.get(dataList.get(i).getB_no()).get(j) }.png" onError="this.src='./resources/img/fileFormat/nomal.png'">
											<span class="file_name">${dataFileMap.get(dataList.get(i).getB_no()).get(j).getF_name() }</span>
										</div>
									</c:forEach>
									<div class="file_close">닫기</div>
								</div>
							</c:if>
							</td>
							<td class="td_data_writer">${memberMap.get(dataList.get(i).getB_no()).getMem_id() }(${memberMap.get(dataList.get(i).getB_no()).getMem_name()})</td>
							<td class="td_data_date"><fmt:formatDate value="${dataList.get(i).getB_regdate() }" pattern="YYYY.MM.dd"/></td>
							<td class="td_data_cnt">${dataList.get(i).getB_cnt() }</td>
						</tr>
					</c:forEach>
					
				</c:otherwise>
			</c:choose>
		</table>
		
		<!-- 글쓰기 -->
		<div style="width: 100%; height: 100px;">
			<button class="writeBtn" onclick="location.href='dataBoardWriteForm.do'">글 쓰기</button>
		</div>
		
		<!-- 검색 영역 -->
		<div class="search_div">
			<form action="data_search.do" method="post" id="search_form">
				<select name="searchType"  class="search_type_box" id="searchType">
					<option value="title_content">제목+내용</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" placeholder="검색어를 작성해주세요." class="search_content_box" id="search_keyword" name="keyword" >
				<input type="button" value="검색" onclick="search_chk();" class="search_btn">
			</form>
		</div>
		
		<!-- 페이징  영역-->
		<div class="pagin_div">
			<ul class="pagin">
				<!-- 이전 페이지 -->
				<li class="page_li"><a class="next_page" onclick="prePageGroup();"><</a>
				
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
				
				<!-- 다음 페이지 -->
				<li class="page_li"><a class="next_page" onclick="nextPageGroup();">></a></li>
			</ul>
			
			<!-- 페이지 전환 form -->
			<form action="dataBoard.do" method="post" id="pageform" name="pageform">
				<input type="hidden" name="pagenum" id="pagenum">
			</form>
				
		</div>		
		
	</div>
	
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
	
</body>
</html>