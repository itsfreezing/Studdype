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
				alert(${dto.meet_no});
				var list = map.meetReplyList;
				
				var html = "<div class='meetReplyTitle'><span>댓글</span> "+list.length+"개 </div>"+"<ul class='meetReplyList'>";
				
				for( var i = 0; i < list.length; i++ ) {
					var replyDate = new Date(list[i].r_regdate);
					
					var hour = (replyDate.getHours() / 10 < 1) ? '0' + replyDate.getHours() : replyDate.getHours();
					var minute = (replyDate.getMinutes() / 10 < 1) ? '0' + replyDate.getMinutes() : replyDate.getMinutes();
					
					// date format 맞추기
					var dateFormat = replyDate.getFullYear() + "." + (replyDate.getMonth() + 1) + '.' + replyDate.getDate() + ' ' + hour + ':' + minute;
					
					var reply = "<li class='replyItem'>"+"<div class='replyarea showDiv'>"
								+ "<div class='reply_writer_box' style='padding-bottom: 15px;'>안녕</div></div></li></ul>";
								
					
			
				}
				html += reply;
				$(".replyBox").html(html);
			},
			error:function(request,status,error){
	      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     }
	
		});
});
</script>
</head>
<body>

</body>
</html>