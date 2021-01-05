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



<script type="text/javascript" >
<!-- 댓글 목록 가져오기 AJAX -->
function getReplyList() {

	var boardVal = {
			"b_no":${dto.b_no }
	};

	$.ajax({
		type:"post",
		url:"freeReplyList.do",
		data:JSON.stringify(boardVal),
		contentType:"application/json",
		dataType:"json",
		success:function(map){
			var list = map.replyList;
		
			var html = "<div class='replyTitle'><span>댓글</span> "+map.replyList.length+" 개 </div>"+
					"<ul class='replyList'>";
				
				for(var i = 0 ; i < map.replyList.length; i++){
					var replyDate = new Date(map.replyList[i].r_regdate);
					
					 var hour = (replyDate.getHours() / 10 < 1 ) ?  '0' + replyDate.getHours() : replyDate.getHours();
					 var minute =  (replyDate.getMinutes() / 10 < 1 ) ?  '0' + replyDate.getMinutes() : replyDate.getMinutes();
					
					//데이트 포멧 맞추기
					var dateFormat = replyDate.getFullYear() +'.'+ ( replyDate.getMonth()+1 ) +'.' + replyDate.getDate() +'  ' +
										hour+':'+ minute;					
					
					if( map.replyList[i].r_class == 0){
						
						var reply = "<li class='replyItem'>"+
										"<div class='reply_area'>"
										+"<div class='reply_writer_box' style='padding-bottom: 15px;'>"+ map.replyMember[map.replyList[i].r_no].mem_id+"(" + map.replyMember[map.replyList[i].r_no].mem_name+ ")"  +"</div>"
										+"<div class='reply_comment_box'>"+map.replyList[i].r_comment+"</div>"
										+"<div class='reply_info_box'>"+dateFormat;
						
						if(${login.mem_no} == map.replyList[i].r_writer ){
							reply += "   <button class='write_recomeent_btn'>답글쓰기</button>"+
										" <button class='write_recomeent_btn' onclick='updateReplyForm(this)' value="+map.replyList[i].r_no+">수정하기</button>" +
										" <button class='write_recomeent_btn' value="+map.replyList[i].r_no+" onclick='deleteReply(this);'>삭제하기</button></div></div></li><hr>"
						}else{
							reply += "   <button class='write_recomeent_btn'>답글쓰기</button></div></div></li><hr>";
						}
							
					}else if( map.replyList[i].r_class == -1){
						var reply = "<li class='replyItem'><div class='delete_reply'>삭제된 댓글 입니다.</div></li><hr>"
					}else{
						var reply = "<li class='replyItem'>"+
						"<div class='reply_area' style='margin-left:35px;'>"
							+"<div class='reply_writer_box'><img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>"+map.replyMember[map.replyList[i].r_no].mem_id+"(" + map.replyMember[map.replyList[i].r_no].mem_name+ ")"   +"</div>"
							+"<div class='reply_comment_box' style='margin-left:30px;'>"+map.replyList[i].r_comment+"</div>"
							+"<div class='reply_info_box' style='margin-left:30px;'>"+dateFormat;
						if(${login.mem_no} == map.replyList[i].r_writer ){
							reply +=	"   <button class='write_recomeent_btn' onclick='updateReplyForm(this)'  value="+map.replyList[i].r_no+">수정하기</button>" +
										" <button class='write_recomeent_btn' value="+map.replyList[i].r_no+" onclick='deleteReply(this);'>삭제하기</button></div></div></li><hr>"
						}else{
							reply += "</div></div></li><hr>";
						}
					}
					
					html += reply;
				}
				html += "</ul>";
				
			
			$(".replyBox").html(html);
			
		},
		error:function(){
			alert("댓글목록 ajax 실패 ㅠ..");
		}
		
		
	});
};

<!-- 댓글 삭제 AJAX -->
function deleteReply(btn){
	var r_no = btn.value //댓글 번호
	
	var replyVal = {
			"r_no":r_no
	};

	//댓글 삭제 
	$.ajax({
		type:"post",
		url:"freeReplyDelete.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success: function(res){
			if ( res > 0 ){
				getReplyList();
			}else{
				alert("[ERROR]: 댓글 삭제 실패!!");
				getReplyList();
			}
		} 
		,
		error:function(){
			alert("댓글 삭제 ajax 실패 ㅠ..");
		}
		
		
	});
	
};

<!-- 댓글 쓰기 AJAX -->
function insertReply(){
	var content = $("#write_content").val();
	var b_no = ${dto.b_no}
	var r_writer = ${login.mem_no}
	
	var replyVal = {
			"b_no" : b_no ,
			"r_writer":r_writer ,
			"r_comment" : content
	};

	//댓글 쓰기
	$.ajax({
		type:"post",
		url:"freeReplyWrite.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success: function(res){
			if ( res > 0 ){
				getReplyList();
			}else{
				alert("[ERROR]: 댓글 등록 실패!!");
				getReplyList();
			}
		} 
		,
		error:function(){
			alert("댓글 등록 ajax 실패 ㅠ..");
		}
		
		
	});
	
	
}


function updateReplyForm(btn){

	
	setTimeout(function(){  btn.className += ' update_btn';  //update_btn 클래스 추가
	var reply_area = $(".update_btn").parent().parent();
	var writer = reply_area.children(".reply_writer_box").text();
	var comment = reply_area.children(".reply_comment_box").text();

	var html = "<div class='update_reply_div'><table>" +
			"<tr> <td class='update_reply_writer'>" + writer + "</td></tr>" +
			"<tr><td><textarea class='update_reply_comment'>" + comment + "</textarea></td></tr></table>"+
			"<div class='update_reply_btnDiv'><button class='update_reply_btn' onclick='getReplyList();'>취소</button><button class='update_reply_btn' value="+btn.value+">수정</button></div></div>";
			
	reply_area.html(html);  }, 2000);
	
			



			//alert( $(".update_reply_writer").text() );
}


//페이지 로드 후에
$(document).ready( getReplyList() );






 
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

 	<div class="main-section3">
		<div class="titleDiv" >
			<span class="title">${dto.b_title }</span>
			<span class="regdate"><fmt:formatDate value="${dto.b_regdate }" pattern="YYYY.MM.dd HH:mm"/></span>
		</div>
		<div class="writerDiv">
			<span class="writer"> ${member.mem_id } (${member.mem_name })</span>
			<span class="cnt">조회수
				<span class="cnt2">${dto.b_cnt }</span>
			</span>
		</div>
		<div class="contentDiv">${dto.b_content }</div>
		<div class="btnDiv">
		</div>
		
		<div class="replyBox" >
			
			</div>
			
			<div class="replyWrite"  >
				<table >
				<tr>
					<td colspan="2"><p class="writerId">${login.mem_id } (${login.mem_name })</p></td>
				</tr>
				<tr>
					<td class="write_td" ><textarea class="write_content" id="write_content" placeholder="댓글을 남겨보세요"></textarea></td>
					<td class="write_btn_td" ><button class="reply_write_btn" onclick="insertReply();">등록</button></td>
				</tr>				
				</table>
			</div>
			
 	</div>
 	
 
	<input type="hidden" id="b_no" name="b_no" value="${dto.b_no }">
	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>