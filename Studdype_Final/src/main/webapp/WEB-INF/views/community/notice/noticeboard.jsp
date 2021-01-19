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
<title>CommunityHome</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
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
<script src="./resources/assets/js/main.js"></script>



<script type="text/javascript">


	
}

</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<h1 >공지사항 게시판</h1>


		<!-- 보드 --> <!-- 게시글제목 / 작성자 / 작성시간 / 조회수  -->
		<table class="boardlist">
			<col width="600px"><col width="250px"><col width="200px"><col width="150px">
			<tr class="headtr">
				<th>게시글 제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>조회수</th>
			</tr>
		
			
			<c:choose>
				<c:when test="${empty list }">
					<td colspan="4">공 지 사 항 이 없 습 니 다</td>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
						<tr>
							<td class="tdtitle">
								<a href="noticedetail.do?b_no=${list.get(i).getB_no() }">${list.get(i).getB_title() }
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
			<button class="writeBtn" onclick="location.href='noticewriteform.do'">글 쓰기</button>
		</div>
		
	</div>

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>