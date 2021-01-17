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
									
					// 로그인 아이디와 댓글 작성자가 같을 때
					if( ${login.mem_no} == list[i].r_writer ){
						  reply += "<div class='reply_area showDiv'>"
									  +"<div class='reply_writer_box' style='padding-bottom: 15px;'>"
										  +"<img src='./resources/assets/img/icon_crown.png'>" + member[list[i].r_no].mem_id
									  +"</div>"
									  +"<div class='reply_comment_box'>"
										  + list[i].r_comment
									  +"</div>"
									  +"<div class='reply_info_box'>" + dateFormat
										  +"<button class='write_recomeent_btn' onclick='writeRecommentForm(this);'>"
											  +"<img src='./resources/assets/img/icon_recomment.png'>"
										  +"</button>"
										  +"<button class='write_recomeent_btn' onclick='updateReplyForm(this);' value=" + list[i].r_no + ">"
											  +"<img src='./resources/assets/img/icon_update.png'>"
										  +"</button>"
										  +"<button class='write_recomeent_btn' value=" + list[i].r_no + " onclick='deleteReply(this);'>"
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
									  +"</table>"
									  +"<div class='update_reply_btnDiv'>"
										  +"<button class='update_reply_btn' onclick='getMeetReplyList();'>취소</button>"
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
										  +"<button class='update_reply_btn' onclick='getMeetReplyList();'>취소</button>"
										  +"<button class='update_reply_btn' onclick='writeRecomment(this);' value=" + list[i].r_no + ">작성</button>"
									  +"</div>"
								  +"</div>"
							  +"</li>"
							  +"<hr>";
							  // ---------------------------- 댓글 답글달기 html 추가부분
								
					// ---------------------------- 로그인 아이디와 댓글 작성자가 같을 때
								
					// 로그인 아이디와 댓글 작성자가 다를 때
					} else {
						  reply += "<div class='reply_area showDiv'>"
								  	  +"<div class='reply_writer_box' style='padding-bottom: 15px;'>"
									  	  + member[list[i].r_no].mem_id
								  	  +"</div>"
									  +"<div class='reply_comment_box'>"
										  + list[i].r_comment
									  +"</div>"
									  +"<div class='reply_info_box'>" + dateFormat
										  +"<button class='write_recomeent_btn' onclick='writeRecommentForm(this);'>"
											  +"<img src='./resources/assets/img/icon_recomment.png'>"
										  +"</button>"
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
										      +"<td><textarea class='update_reply_comment' placeholder='댓글을 남겨보세요'></textarea></td>"
										  +"</tr>"
									  +"</table>"
									  +"<div class='update_reply_btnDiv'>"
										  +"<button class='update_reply_btn' onclick='getMeetReplyList();'>취소</button>"
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
					 			  	  
					 					
					// 로그인 된 아이디와 댓글 작성자가 같을 때
					if( ${login.mem_no} == list[i].r_writer ) {
							reply += "<div class='reply_area showDiv' style='margin-left: 35px;'>"
	 									+"<div class='reply_writer_box'>"
					 						+"<img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>"
					 						+"<img src='./resources/assets/img/icon_crown.png'>"+ member[list[i].r_no].mem_id
				 						+"</div>"
				 						+"<div class='reply_comment_box' style='margin-left: 30px;'>" + list[i].r_comment + "</div>"
 										+"<div class='reply_info_box' style='margin-left: 30px;'>" + dateFormat
											+"<button class='write_recomeent_btn' onclick='updateReplyForm(this);' value=" + list[i].r_no + ">"
												+"<img src='./resources/assets/img/icon_update.png'>"
											+"</button>"
											+"<button class='write_recomeent_btn' value=" + list[i].r_no + " onclick='deleteReply(this);'>"
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
										+"</table>"
										+"<div class='update_reply_btnDiv'>"
											+"<button class='update_reply_btn' onclick='getMeetReplyList();'>취소</button>"
											+"<button class='update_reply_btn' onclick='updateReply(this);' value=" + list[i].r_no + ">수정</button>"
										+"</div>"
									+"</div>"
									+"</li>"
									+"<hr>";
									// ---------------------------- 댓글 수정 html 추가부분
									
					// ---------------------------- 로그인 된 아이디와 댓글 작성자가 같을 때
						
					// 로그인 된 아이디와 댓글 작성자가 다를 때
					} else {
							reply += "<div class='reply_area showDiv' style='margin-left: 35px;'>"
		 								+"<div class='reply_writer_box'>"
					 						+"<img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>" + member[list[i].r_no].mem_id
					 					+"</div>"
					 					+"<div class='reply_comment_box' style='margin-left: 30px;'>" + list[i].r_comment + "</div>"
					 					+"<div class='reply_info_box' style='margin-left: 30px;'>" + dateFormat +"</div>"
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

<!-- 댓글 버튼 누르면 작성 textarea로 이동 -->
function scroll($) {
	$(".scroll").click(function(event){            
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
	})
};

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

<!-- 댓글 쓰기 ajax -->
function insertReply(){
	var content = $("#write_content").val();  
	
	if ( content.length > 500 ) {
		alert("500자 이하로 댓글을 작성 해주세요!");
		return false;
	}
	
	var b_no = ${dto.meet_no};
	var r_writer = ${login.mem_no};
	
	var replyVal = {
			"b_no":b_no,
			"r_writer":r_writer,
			"r_comment":content
	};
	
	$.ajax({
		type:"post",
		url:"meetReplyWrite.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success:function(res){
			$(".write_content").val(""); // 댓글 입력창 비우기
			if ( res > 0 ){
				getMeetReplyList();
			} else {
				alert("[ERROR]: 댓글 등록을 실패하였습니다.");
				getMeetReplyList();
			}
		},
		error:function(request,status,error){ // 통신 실패 
      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};

<!-- 수정하기 누를시  hide/show 관리하는 함수 -->
function updateReplyForm(btn){

	/*
	1. reply_area 리스트와 update_reply_div 리스트들을 가져온 후 class이름들을 초기화 해준다.
	2. 그 후 btn으로 넘어온 element값을 이용해 replyItem(<li>)태그를 선택한다.
	3. replyItem의 자식선택자를 이용해 showDiv 와 hideDiv 클래스를 적절하게 추가/제거 해준다.
	4. btn을 이용해 추가한 클래스를 제거한다.
	*/
	
	// 1.
	var replyAreaList = $(".reply_area");
	var updateReplyDivList = $(".update_reply_div");
	var writeRecommentDiv = $(".write_recomment_div");
	$(".write_recomment_hr").remove(); // 답글쓰기 hr 삭제
	
	for ( var i = 0; i < replyAreaList.length; i++ ) {
		replyAreaList.eq(i).attr("class","reply_area showDiv")
	}
	
	for ( var i = 0; i < updateReplyDivList.length; i++ ) {
		updateReplyDivList.eq(i).attr("class","update_reply_div hideDiv recomment_div")
	}
	
	for ( var i = 0; i < writeRecommentDiv.length; i++ ) {
		writeRecommentDiv.eq(i).attr("class","write_recomment_div hideDiv recomment_div")
	}
	
	// 2.
	btn.className += ' update_btn';
	var replyItem = $(".update_btn").parent().parent().parent();
	
	// 3. 
	replyItem.children((".reply_area")).removeClass('showDiv');
	replyItem.children((".reply_area")).addClass('hideDiv');
	replyItem.children((".update_reply_div")).removeClass('hideDiv');
	replyItem.children((".update_reply_div")).addClass('showDiv');
	
	// 4.
	btn.className = 'write_recomeent_btn';
}

<!-- 댓글 수정하기 ajax -->
function updateReply(btn) {
	
	btn.className += ' update_btn';
	var updateReplyDiv = $(".update_btn").parent().parent();
	
	var r_no = btn.value;
	var r_comment = updateReplyDiv.find(".update_reply_comment").val();
	
	if( r_comment.length > 500 ) {
		alert("500자 이하로 댓글을 작성 해주세요!");
		return false;
	}
	
	var replyVal = {
			"r_no":r_no,
			"r_comment":r_comment
	};
	
	$.ajax({
		type:"post",
		url:"meetReplyUpdate.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success:function(res){
			if ( res > 0 ) {
				getMeetReplyList();
			} else {
				alert("[ERORR]: 댓글 수정을 실패하였습니다.")
				getMeetReplyList();
			}
		},
		error:function(request,status,error){ // 통신 실패 
      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	btn.className = 'update_reply_btn';
}

<!-- 답글쓰기 눌렀을시 hide/show 관리하는 함수 -->
function writeRecommentForm(btn){
	
	/*
	1. reply_area 리스트와 update_reply_div 리스트들을 가져온 후 class이름들을 초기화 해준다.
	2. 그 후 btn으로 넘어온 element값을 이용해 replyItem(<li>)태그를 선택한다.
	3. replyItem의 자식선택자를 이용해 showDiv 와 hideDiv 클래스를 적절하게 추가/제거 해준다.
	4. btn을 이용해 추가한 클래스를 제거한다.
	*/

	// 1.
	var replyAreaList = $(".reply_area");
	var writeRecommentDiv = $(".write_recomment_div");
	var updateReplyDivList = $(".update_reply_div");
	$(".write_recomment_hr").remove(); //답글쓰기 hr삭제
	
	for(var i = 0 ; i < replyAreaList.length ; i++){
		replyAreaList.eq(i).attr("class","reply_area showDiv")
	}
	for(var i = 0 ; i < writeRecommentDiv.length ; i++){
		writeRecommentDiv.eq(i).attr("class","write_recomment_div hideDiv recomment_div")
	}
	for(var i = 0 ; i < updateReplyDivList.length ; i++){
		updateReplyDivList.eq(i).attr("class","update_reply_div hideDiv recomment_div")
	}

	// 2.
	btn.className += ' write_recomment_btn';  
	var replyItem = $(".write_recomment_btn").parent().parent().parent();


	// 3.
	replyItem.children((".write_recomment_div")).removeClass('hideDiv');	
	replyItem.children((".write_recomment_div")).addClass('showDiv');
	
	// hr태그 추가
	$("<hr class='write_recomment_hr'>").insertAfter(replyItem.children((".reply_area")))
	
	// 4.
	btn.className = 'write_recomeent_btn'; //추가한 클래스 원상복구
}

<!-- 댓글 답글쓰기 ajax -->
function writeRecomment(btn){
	
	btn.className += ' write_recomment_btn';  
	var updateReplyDiv = $(".write_recomment_btn").parent().parent();
	
	
	var r_no = btn.value; //부모 댓글 번호
	var b_no = ${dto.meet_no}; //글번호
	var r_writer = ${login.mem_no};//댓글작성자
	var r_comment = updateReplyDiv.find(".update_reply_comment").val(); //댓글 내용
	if( r_comment.length > 500 ) {
		alert("500자 이하로 댓글을 작성해주세요!");
		return false;
	}
	
	var replyVal = {
			"r_no" : r_no, //부모 댓글
			"b_no" : b_no , //게시글 번호
			"r_writer":r_writer , //댓글 작성자
			"r_comment" : r_comment //댓글 내용
	};
	alert(r_no);
	alert(b_no);
	alert(r_writer);
	alert(r_comment);

	//댓글 답글 쓰기
	$.ajax({
		type:"post",
		url:"meetRecommentWrite.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success: function(res) {
			
			if ( res > 0 ) {
				getMeetReplyList();
			} else {
				alert("[ERROR]: 댓글 답글 등록 실패!!");
				getMeetReplyList();
			}
		} 
		,
		error:function(request,status,error){ // 통신 실패 
      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	btn.className = 'write_recomment_btn'; //추가한 클래스 원상복구
}

$(document).ready(getMeetReplyList());
</script>
</head>
<body>

</body>
</html>