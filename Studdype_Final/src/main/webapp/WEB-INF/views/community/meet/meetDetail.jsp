<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Meet Detail Page</title>

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
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<link rel="stylesheet" href="./resources/css/community/meet.css">

<!-- kakao map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04bc0d5da72e456d3406d52a61067ecd&libraries=services"></script>

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<script>

<!-- kakao map API script -->
$(function(){
	var mapContainer = document.getElementById('map'), 	  // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도 생성  
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색
	geocoder.addressSearch('${dto.meet_addr}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
			
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
});

$(document).ready(
		
		<!-- 모임게시판 댓글 목록 가져오기 ajax -->
		function getMeetReplyList() {
			
			var boardVal = { "b_no":${dto.meet_no}}; // b_no에 모임번호 넣기
			
			$.ajax({
				type:"post",
				url:"meetReplyList.do",
				data:JSON.stringify(boardVal),
				contentType:"application/json",
				dataType:"json",
				success:function(map){
					var list = map.meetReplyList;	  // 댓글 리스트
					var member = map.meetReplyMember; // 멤버 정보
					var html = "<div class='replyTitle'>"
									+"<span>댓글 </span>" + list.length + "개"
							  +"</div>"
							  +"<ul class='replyList'>";
					
					for( var i = 0; i < list.length; i++ ) {
						var replyDate = new Date(list[i].r_regdate);
						
						var hour = ( replyDate.getHours() / 10 < 1 ) ? '0' + replyDate.getHours() : replyDate.getHours();
						var minute = ( replyDate.getMinutes() / 10 < 1 ) ? '0' + replyDate.getMinutes() : replyDate.getMinutes();
						
						// date format 맞추기
						var dateFormat = replyDate.getFullYear() + "." + (replyDate.getMonth() + 1) + '.' + replyDate.getDate() + ' ' + hour + ':' + minute;
						
						// 댓글이 부모댓글 일 때
						if( list[i].r_class == 0 ) {
							var reply = "<li class='replyItem'>"
											+"<div class='reply_area showDiv'>"
												+"<div class='reply_writer_box' style='padding-bottom: 15px;'>"
													+ member[list[i].r_no].mem_id
												+"</div>"
												+"<div class='reply_comment_box'>"
													+ list[i].r_comment
												+"</div>"
												+"<div class='reply_info_box'>" + dateFormat;
						
						
										// 로그인 아이디와 댓글 작성자가 같을 때
										if( ${login.mem_no} == list[i].r_writer ){
											alert(list[0].r_no);
											reply += "<button class='write_recomment_btn' onclick='writeRecommentForm(this);'>"
														+"<img src='./resources/assets/img/icon_recomment.png'>"
													+"</button>"
													+"<button class='write_recomment_btn' onclick='updateReplyForm(this);' value=" + list[i].r_no + ">"
														+"<img src='./resources/assets/img/icon_update.png'>"
													+"</button>"
													+"<button class='write_recomment_btn' value=" + list[i].r_no + " onclick='deleteReply(this);'>"
														+"<img src='./resources/img/remove_file.png'>"								
													+"</button>"
												+"</div>"
											+"</div>"
							
											// 댓글 수정 html 추가부분
											+"<div class='update_reply_div hideDiv recomment_div'>"
												+"<table>"
													+"<tr>"
														+"<td class='update_reply_writer'>" + member[list[i].r_no].mem_id + "</td>"
													+"</tr>"
													+"<tr>"
														+"<td><textarea class='update_reply_comment'>" + list[i].r_comment + "</textarea></td>"
													+"</tr>"
												+"<table>"
												+"<div class='update_reply_btnDiv'>"
													+"<button class='update_reply_btn' onclick='getReplyList();'>취소</button>"
													+"<button class='update_reply_btn' onclick='updateReply(this);' value=" + list[i].r_no + ">수정</button>"
												+"</div>"
											+"</div>"
											// ---------------------------- 댓글 수정 html 추가부분
											
											// 댓글 답글달기 html 추가부분
											+"<div class='hideDiv write_recomment_div recomment_div' style='margin-left: 35px;'>"
												+"<table>"
													+"<tr>"
														+"<td class='update_reply_writer'>"
															+"<img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>" + $("#mem_id").val()
														+"</td>"
													+"</tr>"
													+"<tr>"
														+"<td><textarea class='update_reply_comment' placeholder='댓글을 남겨보세요.'></textarea></td>"
													+"</tr>"
												+"</table>"
												+"<div class='update_reply_btnDiv'>"
													+"<button class='update_reply_btn' onclick='getReplyList();'>취소</button>"
													+"<button class='update_reply_btn' onclick='writeRecomment(this);' value=" + list[i].r_no + ">작성</button>"
												+"</div>"
											+"</div>"
										+"</li>"
										+"<hr>";
											// ---------------------------- 댓글 답글달기 html 추가부분
										
										// ---------------------------- 로그인 아이디와 댓글 작성자가 같을 때
										
										// 로그인 아이디와 댓글 작성자가 다를 때
										} else {
											reply += "<button class='write_recomment_btn' onclick='writeRecommentForm(this);'>"
														+"<img src='./resources/assets/img/icon_recomment.png'>"
													+"</button>"
												+"</div>"
											+"</div>"
											
											// 댓글 답글달기 html 추가부분
											+"<div class='hideDiv write_recomment' style='margin-left: 35px;'>"
												+"<table>"
													+"<tr>"
														+"<td class='update_reply_writer'>"
															+"<img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>" + $("mem_id").val()
														+"</td>"
													+"</tr>"
													+"<tr>"
														+"<td><textarea class='update_reply_comment' placeholder='댓글을 남겨보세요'></textarea></td>"
													+"</tr>"
												+"</table>"
												+"<div class='update_reply_btnDiv'>"
													+"<button class='update_reply_btn' onclick='getReplyList();'>취소</button>"
													+"<button class='update_reply_btn' onclick='writeRecomment(this); value=" + list[i].r_no + "'>작성</button>"
												+"</div>"
											+"</div>"
										+"</li>"
										+"<hr>";
											// ---------------------------- 댓글 답글달기 html 추가부분
										}
										// ---------------------------- 로그인 아이디와 댓글 작성자가 다를 때
										
						// ---------------------------- 댓글이 부모댓글 일 때
						
						// 댓글이 부모댓글인데 삭제 된 댓글일 때
						} else if( list[i].r_class == -1 ) {
							 var reply = "<li class='replyItem'>"
											+"<div class='delete_reply'>삭제 된 댓글입니다.</div>"
										+"</li>"
										+"</hr>";
						// ---------------------------- 댓글이 부모댓글인데 삭제 된 댓글일 때
										
						// 댓글이 부모댓글이 아닐 때
						} else {
							 var reply = "<li class='replyItem'>"
							 				+"<div class='reply_area showDiv' style='margin-left: 35px;'>"
							 					+"<div class='reply_writer_box'>"
							 						+"<img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>" + member[list[i].r_no].mem_id
							 					+"</div>"
							 					+"<div class='reply_comment_box' style='margin-left: 30px;'>" + list[i].r_comment + "</div>"
							 					+"<div class='reply_info_box' style='margin-left: 30px;'>" + dateFormat;
							 					
					 					// 로그인 된 아이디와 댓글 작성자가 같을 때
					 					if( ${login.mem_no} == list[i].r_writer ) {
					 						reply += "<button class='write_recomment_btn' onclick='updateReplyForm(this);' value=" + list[i].r_no + ">수정하기</button>"
					 								+"<button class='write_recomment_btn' value=" + list[i].r_no + " onclick='deleteReply(this);'>삭제하기</button>"
					 							+"</div>"
					 						+"</div>"
					 					// ---------------------------- 로그인 된 아이디와 댓글 작성자가 같을 때
					 						
					 						// 댓글 수정 html 추가부분
					 						+"<div class='update_reply_div hideDiv recomment_div'>"
						 						+"<table>"
						 							+"<tr>"
						 								+"<td class='update_reply_writer'>" + member[list[i].r_no].mem_id + "</td>"
						 							+"</tr>"
						 						+"</table>"
						 						+"<div class='update_reply_btnDiv'>"
						 							+"<button class='update_reply_btn' onclick='getReplyLIst();'>취소</button>"
						 							+"<button class='update_reply_btn' onclick='updateReply(this);' value=" + list[i].r_no + ">수정</button>"
						 						+"</div>"
						 					+"</div>";
						 					// ---------------------------- 댓글 수정 html 추가부분
						 					
				 					// 로그인 된 아이디와 댓글 작성자가 다를 때
				 					} else {
				 						reply += "</div>"
			 								+"</div>"
			 							+"</li>"
			 							+"<hr>";
				 					}
					 				// ---------------------------- 로그인 된 아이디와 댓글 작성자가 다를 때
						}
						// ---------------------------- 댓글이 부모댓글이 아닐 때
						
						html += reply;
					}
					html += "</ul>";
					$(".replyBox").html(html);
				},
				error:function(request,status,error){ // 통신 실패 
		      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		     	}
			})
	});
	
<!-- 댓글 삭제 ajax -->
function deleteReply(btn){
	alert(qwerqwerqwer);
};

<!-- 모임 삭제 전 확인 알림창 -->
function deleteBtn(){
	if (confirm("모임을 정말 삭제 하시겠습니까??") == true){ //확인
		alert("모임이 삭제 되었습니다!");
		document.meetDetailForm.submit();
	}else{   										//취소
	    alert("모임 삭제가 취소되었습니다!")
		return;
	}
}
</script>	

</head>
<body>
	<!-- 모임 댓글 관련 스크립트 -->
	<%-- <jsp:include page="../../community/meet/meetReplyScript.jsp"></jsp:include> --%>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	<!--main content 섹션-->
	<div class="main-section">
		
		<form name="meetDetailForm" action="meetdelete.do" method="post">
		<input type="hidden" name="meet_no" value="${dto.meet_no }">		
		
			<!-- 모임 상세보기 -->
			<div id="topDiv">
				<div id="topDiv-left">
					<div id="writerDiv"><img src="./resources/assets/img/meetWriter.png">&nbsp;&nbsp; ${member.mem_id } </div>
					<div id="cntDiv"><img src="./resources/assets/img/meetCnt.png">&nbsp;&nbsp; ${dto.meet_cnt } </div>
				</div>
				<div id="topDiv-right">
					<div id="titleDiv"> ${ dto.meet_title } </div>
				</div>
			</div>
			<div id="contentDiv">
				<div id="contentDiv-left">
					
					<!-- jstl:fmt = 날짜를 String값으로 받아서 Date형으로 parse 해준 뒤 화면에 뿌릴 때에는 다시 String 형으로 format -->
					<div class="meetDetailDiv"><img src="./resources/assets/img/meetDate.png">&nbsp;&nbsp;<fmt:setLocale value="en_US" scope="session"/>
																										  <fmt:parseDate value='${ dto.meet_date }' var='meet_date' pattern="yyyy-MM-dd HH:mm:ss"/>
																										  <fmt:formatDate value="${ meet_date }" pattern="YYYY'년'MM'월'dd'일'"/></div>
					<div class="meetDetailDiv"><img src="./resources/assets/img/meetTime.png">&nbsp;&nbsp;<fmt:parseDate value='${ dto.meet_time }' var='meet_time' pattern="yyyy-MM-dd HH:mm:ss"/>
																										  <fmt:formatDate value="${ meet_time }" pattern="HH:mm"/></div>
					<div class="meetDetailDiv"><img src="./resources/assets/img/meetAddr.png">&nbsp;&nbsp;${dto.meet_addr }&nbsp;${dto.meet_addr_detail }</div>
					<div class="meetDetailDiv"><img src="./resources/assets/img/meetVote.png">&nbsp;&nbsp;<fmt:parseDate value='${ dto.vote_startdate }' var='vote_startdate' pattern="yyyy-MM-dd HH:mm:ss"/>
																										  <fmt:formatDate value="${ vote_startdate }" pattern="yyyy.MM.dd"/> ~ 
																										  <fmt:parseDate value='${ dto.vote_enddate }' var='vote_enddate' pattern="yyyy-MM-dd HH:mm:ss"/>
																										  <fmt:formatDate value="${ vote_enddate }" pattern="yyyy.MM.dd"/>
					</div>
					<!-- ---------------------------------- -->
					
					<div id="meetContentDiv">${dto.meet_content }</div>
				</div>
				<div id="contentDiv-right"> 
					
					<!-- br 태그를 추가하지 않으면 지도가 화면에 보이지 않음 -->
					<div id="map" >
						<br><br><br><br><br><br><br><br><br><br><br><br><br>
						<br><br><br><br><br><br><br><br><br><br><br><br><br>
						<br><br><br><br><br><br>
					</div> 
				</div> 
			</div>
			
			<!-- 자신이 생성한 모임일때만 수정/삭제 버튼 보이게 -->
			<div>
			<c:choose>
				<c:when test="${ dto.meet_writer == login.mem_no }">
					<input type="button" value="수정" class="submitBtn" id="detailBtn_updateform" onclick="location.href='meetupdateform.do?meet_no=${dto.meet_no}'">&nbsp;&nbsp; 
					<input type="button" value="삭제" class="submitBtn" id="detailBtn_delete" onclick="deleteBtn();">&nbsp;&nbsp;
					<input type="button" value="목록" class="submitBtn" id="detailBtn_list1" onclick="location.href='meetlist.do'">
				</c:when>
				<c:otherwise>						
					<input type="button" value="목록" class="submitBtn" id="detailBtn_list2" onclick="location.href='meetlist.do'">
				</c:otherwise> 
			</c:choose>
			</div>
			<!-- ---------------------------------- -->
				
			
			<!-- 투표 영역 -->
			<div id="vote">
				
				<!--투표_참가여부 -->
				<div id="voteDiv">참가여부<br><br>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-success">
							<input type="radio" name="options" id="option2" autocomplete="off">
							<span class="glyphicon glyphicon-ok"></span>
						</label>
						<label class="btn btn-danger">
							<input type="radio" name="options" id="option2" autocomplete="off">
							<span class="glyphicon glyphicon-ok"></span>
						</label>
					</div>
					<br>
					<input type="button" value="투표하기" class="submitBtn vote" onclick="">
				</div>
				<!-- ---------------------------------- -->
				
				<!-- 투표_투표현황 -->
				<div id="voteList">
					<div id="div1"><div class="attend">참석</div><div class="graph">---------</div><div class="percentage">82%</div></div>
					<div id="div2"><div class="attend">불참석</div><div class="graph">---------</div><div class="percentage">18%</div></div>
					<div id="member_count">참여인원: 13명&nbsp;<img src="./resources/assets/img/icon_questionMark.png"></div>
				</div>
				<!-- ---------------------------------- -->
				
			</div>
			
			<!-- 댓글 영역 -->
			<div class="replyBox"></div>
		</form>		
	</div>
<input type="hidden" id="mem_id" name="mem_id" value="${login.mem_id }">
<input type="hidden" id="mem_name" name="mem_name" value="${login.mem_name }">
<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>