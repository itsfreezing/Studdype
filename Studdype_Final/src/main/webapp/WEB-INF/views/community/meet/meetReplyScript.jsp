<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
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
};

$(document).ready(getMeetReplyList());

<!-- 댓글 삭제 ajax -->
function deleteReply(btn){
	var r_no = btn.value // 댓글 번호
	var replyVal = { "r_no":r_no };
	$.ajax({
		type:"post",
		url:"meetReplyDelete.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success:function(res){
			if ( res > 0 ) {
				getMeetReplyList();
			} else {
				alert("[ERROR]: 댓글을 삭제하는것을 실패하였습니다.");
				getMeetReplyList();
			}
		},
		error:function(request,status,error){ // 통신 실패 
      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};

</script>
</head>
<body>

</body>
</html>