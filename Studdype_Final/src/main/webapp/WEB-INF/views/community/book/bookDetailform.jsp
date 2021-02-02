<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터띱 도서 게시판</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/mainstyle.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">

<link rel="stylesheet" href="./resources/css/community/book/bookDetailform.css">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main2.js"></script>

<script type="text/javascript">
<!-- 댓글 목록 가져오기 AJAX -->
function getReplyList() {
	var boardVal = {
			"b_no":${detailBookDto.getB_no() }
	};

	$.ajax({
		type:"post",
		url:"bookReplyList.do",
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
					//댓글이 부모댓글이면
					if( map.replyList[i].r_class == 0){
						var reply = "<li class='replyItem'>"+
										"<div class='reply_area showDiv'>"
										+"<div class='reply_writer_box' style='padding-bottom: 15px;'>"+ map.replyMember[map.replyList[i].r_no].mem_id+"(" + map.replyMember[map.replyList[i].r_no].mem_name+ ")"  +"</div>"
										+"<div class='reply_comment_box'>"+map.replyList[i].r_comment+"</div>"
										+"<div class='reply_info_box'>"+dateFormat;
						
						//로그인 아이디와 댓글 작성자가 같으면
						if(${login.mem_no} == map.replyList[i].r_writer ){
							reply += "   <button class='write_recomeent_btn' onclick='writeRecommentForm(this);'>답글쓰기</button>"+
										" <button class='write_recomeent_btn' onclick='updateReplyForm(this);' value="+map.replyList[i].r_no+">수정하기</button>" +
										" <button class='write_recomeent_btn' value="+map.replyList[i].r_no+" onclick='deleteReply(this);'>삭제하기</button></div></div>"+
										
										//댓글 수정 html 추가부분
										"<div class='update_reply_div hideDiv recomment_div' ><table>" +
										"<tr> <td class='update_reply_writer'>" + map.replyMember[map.replyList[i].r_no].mem_id+"(" + map.replyMember[map.replyList[i].r_no].mem_name + ")</td></tr>" +
										"<tr><td><textarea class='update_reply_comment'>" + map.replyList[i].r_comment + "</textarea></td></tr></table>"+
										"<div class='update_reply_btnDiv'><button class='update_reply_btn' onclick='getReplyList();'>취소</button><button onclick='updateReply(this);' class='update_reply_btn' value="+map.replyList[i].r_no+">수정</button></div></div>"+
										//댓글 답글달기 html 추가부분
										"<div class='hideDiv write_recomment_div recomment_div' style='margin-left:35px;' ><table>" +
										"<tr> <td class='update_reply_writer'><img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>"+$("#mem_id").val() +"("+$("#mem_name").val() +")</td></tr>" +
										"<tr><td><textarea class='update_reply_comment' placeholder='댓글을 남겨보세요'></textarea></td></tr></table>"+
										"<div class='update_reply_btnDiv'><button class='update_reply_btn' onclick='getReplyList();'>취소</button><button onclick='writeRecomment(this);' class='update_reply_btn' value="+map.replyList[i].r_no+">작성</button></div></div>"+
										"</li><hr>";
						//로그인 아이디와 댓글 작성자가 다르면
						}else{
							reply += "   <button class='write_recomeent_btn' onclick='writeRecommentForm(this);'>답글쓰기</button></div></div>"+
										//댓글 답글달기 html 추가부분
										"<div class='hideDiv write_recomment_div recomment_div' style='margin-left:35px;' ><table>" +
										"<tr> <td class='update_reply_writer'><img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>"+$("#mem_id").val() +"("+$("#mem_name").val() +")</td></tr>" +
										"<tr><td><textarea class='update_reply_comment' placeholder='댓글을 남겨보세요'></textarea></td></tr></table>"+
										"<div class='update_reply_btnDiv'><button class='update_reply_btn' onclick='getReplyList();'>취소</button><button onclick='writeRecomment(this);' class='update_reply_btn' value="+map.replyList[i].r_no+">작성</button></div></div>"+
										"</li><hr>";
						}
					
					//댓글이 부모댓글인데 삭제된 댓글이면
					}else if( map.replyList[i].r_class == -1){
						var reply = "<li class='replyItem'><div class='delete_reply'>삭제된 댓글 입니다.</div></li><hr>";
						
					//댓글이 부모 댓글이 아니면	
					}else{
						var reply = "<li class='replyItem'>"+
						"<div class='reply_area showDiv' style='margin-left:35px;'>"
							+"<div class='reply_writer_box'><img class='reply_arrow' src='./resources/img/reply_arrow_gray.png'>"+map.replyMember[map.replyList[i].r_no].mem_id+"(" + map.replyMember[map.replyList[i].r_no].mem_name+ ")"   +"</div>"
							+"<div class='reply_comment_box' style='margin-left:30px;'>"+map.replyList[i].r_comment+"</div>"
							+"<div class='reply_info_box' style='margin-left:30px;'>"+dateFormat;
						//로그인된 아이디와 댓글 작성자가 같으면
						if(${login.mem_no} == map.replyList[i].r_writer ){               
							reply +=	"   <button class='write_recomeent_btn' onclick='updateReplyForm(this);'  value="+map.replyList[i].r_no+">수정하기</button>" +
										" <button class='write_recomeent_btn' value="+map.replyList[i].r_no+" onclick='deleteReply(this);'>삭제하기</button></div></div>"+
										
										//댓글 수정 html 추가부분
										"<div class='update_reply_div hideDiv recomment_div'><table>" +
										"<tr> <td class='update_reply_writer'>" + map.replyMember[map.replyList[i].r_no].mem_id+"(" + map.replyMember[map.replyList[i].r_no].mem_name + ")</td></tr>" +
										"<tr><td><textarea class='update_reply_comment'>" + map.replyList[i].r_comment + "</textarea></td></tr></table>"+
										"<div class='update_reply_btnDiv'><button class='update_reply_btn' onclick='getReplyList();'>취소</button><button onclick='updateReply(this);' class='update_reply_btn' value="+map.replyList[i].r_no+">수정</button></div></div>"+
										"</li><hr>"
						//로그인된 아이디와 댓글 작성자가 다르면
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
		url:"bookReplyDelete.do",
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
	
	if(content.length > 500){
		alert("500자 이하로 댓글을 작성해주세요!");
		return false;
	}
	
	var b_no = ${detailBookDto.getB_no()};
	var r_writer = ${login.mem_no};
	
	var replyVal = {
			"b_no" : b_no ,
			"r_writer":r_writer ,
			"r_comment" : content
	};

	//댓글 쓰기
	$.ajax({
		type:"post",
		url:"bookReplyWrite.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success: function(res){
			$(".write_content").val(""); //댓글 입력창 비우기
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

//수정하기 누를시  hide/show 관리하는 함수
function updateReplyForm(btn){
	
	/*
		1. reply_area 리스트와 update_reply_div 리스트들을 가져온 후 
		   class이름들을 초기화 해준다.
		2. 그 후 btn으로 넘어온 element값을 이용해 replyItem(<li>)태그를 선택한다.
		3. replyItem의 자식선택자를 이용해 showDiv 와 hideDiv 클래스를 적절하게 추가/제거 해준다.
		4. btn을 이용해 추가한 클래스를 제거한다.
	*/
	
	//  1번
	var replyAreaList = $(".reply_area");
	var updateReplyDivList = $(".update_reply_div");
	var writeRecommentDiv = $(".write_recomment_div");
	$(".write_recomment_hr").remove(); //답글쓰기 hr삭제
	
		
	for(var i = 0 ; i < replyAreaList.length ; i++){
		replyAreaList.eq(i).attr("class","reply_area showDiv")
	}
	for(var i = 0 ; i < updateReplyDivList.length ; i++){
		updateReplyDivList.eq(i).attr("class","update_reply_div hideDiv recomment_div")
	}
	for(var i = 0 ; i < writeRecommentDiv.length ; i++){
		writeRecommentDiv.eq(i).attr("class","write_recomment_div hideDiv recomment_div")
	}
	
	//2번
	btn.className += ' update_btn';  //update_btn 클래스 추가
	var replyItem = $(".update_btn").parent().parent().parent();
	
	
	//3번
	replyItem.children((".reply_area")).removeClass('showDiv');
	replyItem.children((".reply_area")).addClass('hideDiv');
	replyItem.children((".update_reply_div")).removeClass('hideDiv');
	replyItem.children((".update_reply_div")).addClass('showDiv');

	
	//4번
	btn.className = 'write_recomeent_btn'; //추가한 클래스 원상복구


}

<!-- 댓글 수정하기 AJAX -->
function updateReply(btn){
	
	btn.className += ' update_btn';  //update_btn 클래스 추가
	var updateReplyDiv = $(".update_btn").parent().parent();
	
	var r_no = btn.value;
	var r_comment = updateReplyDiv.find(".update_reply_comment").val();
	
	if(r_comment.length > 500){
		alert("500자 이하로 댓글을 작성해주세요!");
		return false;
	}
	var replyVal = {
			"r_no" : r_no ,
			"r_comment" : r_comment
	};

	//댓글 수정
	$.ajax({
		type:"post",
		url:"bookReplyUpdate.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success: function(res){
			if ( res > 0 ){
				getReplyList();
			}else{
				alert("[ERROR]: 댓글 수정 실패!!");
				getReplyList();
			}
		} 
		,
		error:function(){
			alert("댓글 등록 ajax 실패 ㅠ..");
		}
		
		
	});
	
	btn.className = 'update_reply_btn'; //추가한 클래스 원상복구
	
}

<!-- 답글쓰기 눌렀을시 hide/show 관리하는 함수 -->
function writeRecommentForm(btn){
	/*
	1. reply_area 리스트와 update_reply_div 리스트들을 가져온 후 
	   class이름들을 초기화 해준다.
	2. 그 후 btn으로 넘어온 element값을 이용해 replyItem(<li>)태그를 선택한다.
	3. replyItem의 자식선택자를 이용해 showDiv 와 hideDiv 클래스를 적절하게 추가/제거 해준다.
	4. btn을 이용해 추가한 클래스를 제거한다.
	*/

	//  1번 초기화
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

	//2번
	btn.className += ' write_recomment_btn';  //update_btn 클래스 추가
	var replyItem = $(".write_recomment_btn").parent().parent().parent();


	//3번
	replyItem.children((".write_recomment_div")).removeClass('hideDiv');	
	replyItem.children((".write_recomment_div")).addClass('showDiv');
	
	//hr태그 추가
	$("<hr class='write_recomment_hr'>").insertAfter(replyItem.children((".reply_area")))
	
	//4번
	btn.className = 'write_recomeent_btn'; //추가한 클래스 원상복구
}

<!-- 댓글 답글쓰기 AJAX -->
function writeRecomment(btn){
	btn.className += ' write_recomment_btn';  //update_btn 클래스 추가
	var updateReplyDiv = $(".write_recomment_btn").parent().parent();
	
	
	var r_no = btn.value; //부모 댓글 번호
	var b_no = ${detailBookDto.getB_no()}; //글번호
	var r_writer = ${login.mem_no};//댓글작성자
	var r_comment = updateReplyDiv.find(".update_reply_comment").val(); //댓글 내용
	if(r_comment.length > 500){
		alert("500자 이하로 댓글을 작성해주세요!");
		return false;
	}
	
	var replyVal = {
			"r_no" : r_no, //부모 댓글
			"b_no" : b_no , //게시글 번호
			"r_writer":r_writer , //댓글 작성자
			"r_comment" : r_comment //댓글 내용
	};

	//댓글 답글 쓰기
	$.ajax({
		type:"post",
		url:"bookRecommentWrite.do",
		data:JSON.stringify(replyVal),
		contentType:"application/json",
		dataType:"json",
		success: function(res){
			
			if ( res > 0 ){
				getReplyList();
			}else{
				alert("[ERROR]: 댓글 답글 등록 실패!!");
				getReplyList();
			}
		} 
		,
		error:function(){
			alert("댓글 등록 ajax 실패 ㅠ..");
		}
		
		
	});
	
	btn.className = 'write_recomment_btn'; //추가한 클래스 원상복구
}

	var b_no = 0;
	$(function() {
		b_no = $("#b_no").val();	
		getReplyList();
	});
	
	// 도서 게시글 삭제 함수
	function deleteBook() {
		location.href="deleteBook.do?b_no="+b_no;
	}
	
	function updateBookForm() {
		location.href="updateBookForm.do?b_no="+b_no;
	}
	
	function returnList() {
		location.href="searchBook.do";
	}
</script>
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	<!-- 메인섹션 시작 -->
	<div class="main-section">
		<c:choose>
			<c:when test="${empty detailBookDto }">
				<p>페이지 오류</p>
				<button onclick="returnList()">돌아가기</button>
			</c:when>
			<c:otherwise>
				<!-- 메인 섹션 상단(글제목영역) -->
				<div id="main-section-top">
					<table>
						<col width="800">
						<col width="250">
						<col width="150">
						<tr>
							<th><input type="text" readonly="readonly"
								value="${detailBookDto.getB_title() }"></th>
							<th><input type="text" readonly="readonly"
								value="${writerNameMap.get(detailBookDto.getB_writer()).getMem_id()}(${writerNameMap.get(detailBookDto.getB_writer()).getMem_name() })"></th>
							<th><fmt:formatDate value="${detailBookDto.getB_regdate() }" pattern="YYYY.MM.DD HH.MM"/></th>
						</tr>
					</table>
				</div>

				<!-- 메인 섹션 중앙(도서 정보) -->
				<div id="main-section-mid">
					<div id="book-content">
						<input type="hidden" id="b_no" value="${detailBookDto.getB_no() }">
						<table id="info-table">
							<col width="100">
							<tr>
								<td colspan="2"><img id="book-img" src="${detailBookDto.getBook_img() }"></td>
							</tr>
							<tr>
								<th>도서 이름&nbsp;</th>
								<td><input type="text" readonly="readonly" value="${detailBookDto.getBook_title()}">
									<c:if test="${detailBookDto.getBook_ismain() eq 'Y' }">
										<span id="isMain">&nbsp;대표도서</span>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>저자&nbsp;</th>
								<td><input type="text"
									readonly="readonly" value="${detailBookDto.getBook_author() }"></td>
							</tr>
							<tr>
								<th>출판사&nbsp;</th>
								<td><input type="text"
									readonly="readonly" value="${detailBookDto.getBook_publish() }"></td>
							</tr>
							<tr>
								<th>링크&nbsp;</th>
								<td><a href="${detailBookDto.getBook_url() }"target="_blank">
									<img id="link" src='resources/img/link-icon.png' /></a>
									<input type="hidden" value="${detailBookDto.getBook_url() }">
								</td>
							</tr>
						</table>
					</div>		
					<div id="book_textarea">
						<table>
							<tr>
								<th>도서 설명</th>
							</tr>
							<tr>
								<th><textarea style="width: 100%;" rows="10" id="book_board_content"
									readonly="readonly">${detailBookDto.getB_content() }</textarea></th>
							</tr>
						</table>
					</div>
				</div>
			</c:otherwise>

		</c:choose>
		<div id="button-area">
			<c:if test="${login.getMem_no() eq detailBookDto.getB_writer() }">
				<button onclick="updateBookForm();">수정</button>
				<button onclick="deleteBook();">삭제</button>
			</c:if>
				<button onclick="location.href='searchBook.do'">목록</button>
		</div>
		
		<!-- 댓글 리스트 부분 -->
		<div class="replyBox" >
			
		</div>
		
		<!-- 댓글 작성 부분 -->	
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
	<!-- 메인섹션 종료 -->

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>

</body>
</html>