<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/community/studyHome.css">

<script type="text/javascript">
//오른쪽 네비 고정 스크립트
$(window).scroll(function(){
    var div = document.querySelector('div');        
     var compStyle = window.getComputedStyle(div);
    var height = compStyle.height.substring(0,3);
    if($(document).scrollTop() > height){
        $('#studyRightInfo').addClass('fixed');
        $('.main-section').addClass('left')
    }else{
        $('#studyRightInfo').removeClass('fixed');
        $('.main-section').removeClass('left');
    }
});
</script>
</head>
<body>
	<div id="studyRightInfo">
		<div id="studyTitle">${ study.getS_name() } </div>
		<div id="studyCategory"><img src="./resources/assets/img/studyHome_category.png">${ category }</div>
		<div id="studyLeader"><img src="./resources/assets/img/studyHome_leader.png">${ leaderName }</div>
		<div id="studyMember"><img src="./resources/assets/img/studyHome_member.png">${ study.getS_currentcnt() } / ${ study.getS_maxcnt() } 명</div>
		<div id="studyLocation"><img src="./resources/assets/img/studyHome_location.png"> ${ siName } ${ guName }</div>
		<c:choose>
			<c:when test="${empty noticeList }">
				<div id="studyNotice"><img src="./resources/assets/img/studyHome_notice.png">공 지 사 항 이 없 습 니 다</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="0" end="${noticeList.size()-1 }" step="1">
					<div id="studyNotice"><img src="./resources/assets/img/studyHome_notice.png">
						<a href="noticedetail.do?b_no=${ noticeList.get(i).getB_no() }">${noticeList.get(i).getB_title() }</a>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>