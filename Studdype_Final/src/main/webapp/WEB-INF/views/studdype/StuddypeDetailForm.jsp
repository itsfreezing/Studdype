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

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
[tooltip]:before {
    /* 여긴 건드리지 말 것 */
    content: attr(tooltip);
    position: absolute;
    opacity: 0;
    
    /* 변경가능 */
    transition: all 0.15s ease;
    padding: 10px;
    color: black;
    border-radius: 10px;
    box-shadow: 2px 2px 1px silver;    
    text-align:center;
    font-size:12pt;
    z-index:3;
}

[tooltip]:hover:before {
    /* 여긴 건드리지 말 것 */
    opacity: 1;
    
    /* 변경가능 */
    background: #fff;
    border:1px solid black;
    margin-top: 40px;
    margin-left: 1px;    
}

#main-location {
    position: relative;
    width: 100%;
    font-family: Noto Sans;
    background: #ebebeb;
    padding-top: 20px;
    padding-bottom: 20px;
}

/* 스터디 소개 전체 영역 */
#main-content-section {
	position:relative;
	width:50%;
	left:25%;
	margin:1%;
	background:#fff;
	font-family: "Noto Sans KR", sans-serif !important;
}

/* 스터디 대표사진 영역 */
#study-photo-section {
	position:relative;
	width:100%;
	text-align:center;
}

#mainPhoto {
	width:100%;
	height:400px;
	background:#fff;
}

/* 스터디 소개 영역 */
#study-content-section {
	position:relative;
	width:100%;
	padding:2% 5% 2% 5%;
}

#content-title {
	text-align:center;
	border-bottom:1px solid rgba(0,0,0,0.2);
	padding-bottom:2%;
}

#study_location {
	font-size:12pt;
	color:rgba(138, 109, 255, 1);
	font-weight:650;
}

#study_name {
	font-size:35pt;
	font-weight:600;
}

#study_info {
	font-size:15pt;
	font-weight:600;
}

#content-detail {
	margin-top:2%;
	padding-bottom:3%;
	border-bottom:1px solid rgba(0,0,0,0.2);
}

#content-detail label {
	position:relative;
	left:45%;
}

#study-detail-section {
	border-bottom:1px solid rgba(0,0,0,0.2);
}

.table-style {
	width:100%;
	border-collapse: separate;
	border-spacing: 0 20px;
	text-align:center;
}

#content-detail pre{
	margin-top:10px;
	width:100%;
	font-size:14pt;
	font-weight:700;
	font-family: "Noto Sans KR", sans-serif !important;
}

#content-book {
	padding-top:2%;
	text-align:center;
	padding-bottom:2%;
}
#content-book p {
	margin-top:10px;
}

/* 스터디 신청영역 */
#fixed-apply-seciton {
	position:fixed;
	top:35%;
	left:80%;
	width:13%;
	height:auto;
	border-radius:5px;
	background:#fff;
}

/* 신청 정보 영역(상단) */
#apply-top-section {
	width:100%;
	height:auto;
	padding:5%;
	text-align:center;
}

/* 신청 영역(하단) */
#apply-bottom-section {
	width:100%;
	height:auto;
	padding:0% 5% 5% 5%;
}

.apply-section {
	position:relative;
	display:inline-block;
	width:100%;
	font-size:15pt;
	font-weight:bolder;
}

#fixed-study-name {
	height:60%;
	border-bottom:1px solid gray;
	padding-bottom:10px;
}

#study-cnt {
	padding-top:10%;
	height:40%;
	text-align:center;
}

#apply-button {
	width:100%;
	height:30px;
	background:rgba(138, 109, 255, 1);
	cursor:pointer;
	font-weight:bolder;
	color:#fff;
	border:none;
}

#link {
	width:20px;
	height:20px;
}

.label-title {
	color:rgba(138, 109, 255, 0.8); 
	font-weight:700;
}

#mainBook_table {
	position:relative;
	width:100%;
}

#mainBook_table td {
	text-align:left;
}

#book_title_td {
	font-size:20pt; 
	font-weight:bold;
	white-space : nowrap;
	text-overflow : ellipsis;
	overflow:hidden;
}

</style>

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
				<img id="mainPhoto" src="" onError="this.src='./resources/img/no-study-image.png'">
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
	
	<jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
	
</body>
</html>