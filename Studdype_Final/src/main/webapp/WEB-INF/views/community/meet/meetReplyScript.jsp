<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script>
<!-- 모임게시판 댓글 목록 가져오기 ajax -->
$(document).ready(
	function getMeetReplyList() {
		
		// b_no에 모임번호 넣기
		var boardVal = { "b_no":${dto.meet_no}};
		
		$.ajax({
			type:"post",
			url:"meetReplyList.do",
			data:JSON.stringify(boardVal),
			contentType:"application/json",
			dataType:"json",
			success:function(map){
				<!-- ------------ -->
				alert(${dto.meet_no});
				var list = map.meetReplyList;
				<!-- ------------ -->
				alert(list.length);
				var html = "<div class='replyTitle'>"
								+"<span>댓글</span>" + list.length + "개"
						  +"</div>"
						  +"<ul class='replyList'>";
				
				for( var i = 0; i < list.length; i++ ) {
					var replyDate = new Date(list[i].r_regdate);
					
					var hour = ( replyDate.getHours() / 10 < 1 ) ? '0' + replyDate.getHours() : replyDate.getHours();
					var minute = ( replyDate.getMinutes() / 10 < 1 ) ? '0' + replyDate.getMinutes() : replyDate.getMinutes();
					
					// date format 맞추기
					var dateFormat = replyDate.getFullYear() + "." + (replyDate.getMonth() + 1) + '.' + replyDate.getDate() + ' ' + hour + ':' + minute;
					
					// 댓글이 부모댓글 일 때
					if( map.replyList[i].r_class == 0 ) {
						
						var reply = "<li class='replyItem'>"
										+"<div class='reply_area showDiv'>"
											+"<div class='reply_writer_box' style='padding-bottom: 15px;'>"
												+ map.replyMember[map.replyList[i].r_no].mem_id
											+"</div>"
											+"<div class='reply_comment_box'>"
												+ map.replyList[i].r_comment
											+"</div>"
											+"<div class='reply_info_box'>" + dataFormat;
					}
					// ---------------------------- 댓글이 부모댓글 일 때 
					
									// 로그인 아이디와 댓글 작성자가 같을 때
									if( ${login.mem_no} == map.replyList[i].r_writer ){
										reply += "<button class='write_recomment_btn' onclick='writeRecommentForm(this);'>"
													+"<img src='./resources/assets/img/icon_recomment.png'>"
												+"</button>"
												+"<button class='write_recomment_btn' onclick='updateReplyForm(this);' value=" + map.replyList[i].r_no + ">"
													+"<img src='./resources/assets/img/icon_update.png'>"
												+"</button>"
												+"<button class='write_recomment_btn' value=" + map.replyList[i].r_no + "onclick='deleteReply(this);'>"
													+"<img src='./resources/img/remove_file.png'>"								
												+"</button>"
											+"</div>"
										+"</div>"
						
										// 댓글 수정 html 추가부분
										+"<div class='update_reply_div hideDiv recomment_div'>"
											+"<table>"
												+"<tr>"
													+"<td class='update_reply_writer'>" + map.replyMember[map.replyList[i].r_no].mem_id + "</td>"
												+"</tr>"
												+"<tr>"
													+"<td><textarea class='update_reply_comment'>" + map.replyList[i].r_comment + "</textarea></td>"
												+"</tr>"
											+"<table>"
											+"<div class='update_reply_btnDiv'>"
												+"<button class='update_reply_btn' onclick='getReplyList();'>취소</button>"
												+"<button class='update_reply_btn' onclick='updateReply(this);' value=" + map.replyList[i].r_no + ">수정</button>"
											+"</div>"
										+"</div>"
						
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
												+"<button class='update_reply_btn' onclick='writeRecomment(this);' value=" + map.replyList[i].r_no + ">작성</button>"
											+"</div>"
										+"</div>"
									+"</li>"
									+"<hr>";
									}
									// ---------------------------- 로그인 아이디와 댓글 작성자가 같을 때
					
					
					var reply = "<li class='replyItem'>"+"<div class='replyarea showDiv'>"
								+ "<div class='reply_writer_box' style='padding-bottom: 15px;'>안녕</div></div></li></ul>";
								
					
			
				}
				html += reply;
				$(".replyBox").html(html);
			},
			error:function(request,status,error){ // 통신 실패 
	      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     	}
	
		});
});
</script>
</head>
<body>

</body>
</html>