<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디띱 스터디</title>

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
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">

<link rel="stylesheet" href="./resources/css/studdype/studdypeDetail.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<script type="text/javascript">
	$(function() {
		$(".justify-content-center").hide(); 
		
		// 대표사진 불러오기 함수
		imageSetting();
		
	});
	
	// 대표사진 src 형식에 맞추기 함수
	function imageSetting() {
		var imgPath = $("#img_url").val();
		
		$("#mainPhoto").attr("src", imgPath);
		
		if(!$("#content-book").length) {
			$("#study-detail-section").css("border", "none");
		}
	}
	
	function studyApply() {
		var s_no = $("#s_no").val();
		
		return location.href="apply.do?s_no="+s_no;
	}
</script>
</head>
<body>
	
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
	
	<!-- 스터디 신청 시 필요한 스터디 번호 히든 처리 -->
	<input type="hidden" id="s_no" value="${study.getS_no() }">
	
 	<div id="main-location">
		<div id="main-content-section">
			<div id="study-photo-section">
				<input type="hidden" id="img_url" value="${study.getPhoto() }">
				<img id="mainPhoto" src="" onError="this.src='./resources/img/no-image1.png'">
			</div>
			<div id="study-content-section">
				<div id="content-title">
					<!-- 스터디 지역 -->
					<p id="study_location">[${studyCate.get(study.getCate_no())}] ${studySi.get(study.getSi_no()) } ${studyGu.get(study.getGu_no()) }</p>
					<!-- 스터디 이름 -->
					<p id="study_name">${study.getS_name() }</p>
					<!-- 스터디 한줄 소개 -->
					<p id="study_info">${study.getS_info() }</p>
				</div>
				
				<div id="content-detail">
					<!-- 스터디 상세 소개 -->
					<label class="label-title">스터디 소개</label>
					<pre id="pre-study-info">${study.getS_content() }</pre>
				</div>
				<div id="study-detail-section">
					<table class="table-style">
						<tr>
							<th colspan="4" style="text-align:center;"><label class="label-title">상세정보</label></th>
						</tr>
						<tr>
							<th>지역</th>
							<td>${studySi.get(study.getSi_no()) } ${studyGu.get(study.getGu_no()) }</td>
							<th>현재 인원/최대인원</th>
							<td>${study.getS_currentcnt() }/${study.getS_maxcnt() }</td>
							
						</tr>
						<tr>
							<th>팀장</th>
							<td>${leader.getMem_name() }
							(<c:choose>
								<c:when test="${leader.getMem_gender() eq 'M' }">
								남
								</c:when>
								<c:otherwise>
								여
								</c:otherwise>
							</c:choose>
							)
							</td>
							<th>팀장 이메일</th>
							<td>${leader.getMem_email() }</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>${studyCate.get(study.getCate_no())}</td>
							<th>팀장 번호</th>
							<td>${leader.getMem_phone() }</td>
						</tr>
						<tr>
							<th colspan="4"><p><b style="color:red; font-size:9pt;">스터디가 문의가 아닌 광고 등의 목적으로 연락처를 사용할 경우 법적 처벌을 받을 수 있습니다</b></p></th>
						</tr>
					</table>
				</div>
				<c:if test="${not empty mainBook }">
					<div id="content-book">
					<!-- 도서 정보 -->
					<p class="label-title">현재 스터디 대표 도서</p>
					<table id="mainBook_table">
						<col width="200px"><col width="100px">
						<tr>
							<th rowspan="5"><img id="mainBook" src="${mainBook.getBook_img() }"></th>
							<td id="book_title_td" colspan="2" tooltip='${mainBook.getBook_title() }' tooltip-persistent data-backdrop='static' >${mainBook.getBook_title()}</td>
						</tr>
						<tr>
							<th>저자&nbsp;</th>
							<td>${mainBook.getBook_author() }</td>
						</tr>
						<tr>
							<th>출판사&nbsp;</th>
							<td>${mainBook.getBook_publish() }</td>
						</tr>
						<tr>
							<th>링크&nbsp;</th>
							<td>
								<a href="${mainBook.getBook_url() }" target="_blank">
									<img style="width:20px; height:20px;" src='resources/img/link-icon.png'>
								</a>
							</td>
						</tr>
					</table>
					</div>
				</c:if>
			</div>
		</div>
		
	</div> 
	
	<div id="fixed-apply-seciton">
			<div id="apply-top-section">
				<div class="apply-section" id="fixed-study-name">
					<span>${study.getS_name() }</span>
				</div>
				<div class="apply-section" id="study-cnt">
					<label>현재인원/최대인원</label><br><span>${study.getS_currentcnt() }/${study.getS_maxcnt() }</span>
				</div>
			</div>
			<div id="apply-bottom-section">
				<button id="apply-button" onclick="studyApply();">스터디 신청</button>
			</div>
		</div>
	
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
	
</body>
</html>