<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CommunityHome</title>

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
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond"
	rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel= "stylesheet">

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

<style type="text/css">
/* 갤러리 뷰 css 시작 */
.row {
	margin: 15px;
}
#fewsize{
	width: 350px;
	height: 300px;
	margin: 15px;
}
/* 갤러리 뷰 css 끝 */

.replyItem{
		list-style: none;
}

.replyWrite{
	border-bottom: 1px solid #ccc;
	padding-top: 20px;
	padding-bottom: 30px;
}
.replyWrite table{
	width: 100%;
	margin-top: 15px;
}

.write_td{
	width: 90%;	
}

.write_btn_td{
	width: 5%;
}

.write_content{
	width: 100%;
	height: 100px;
	resize: none;
	border: 1px solid #808080;
	border-radius: 5px 5px;
	padding: 20px;
	
}

.reply_write_btn{
	width: 100px;
	height: 105px;
	background-color: white;
	border: 1px solid #808080;
	font-size: 25px;
		border-radius: 5px 5px;
	color: #808080;
	cursor: pointer;
	padding: 0px;
	
}

.reply_write_btn:hover {
	background-color: #6434ef;
	color: white;	
	transition: 0.3s;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.replyBox{
	margin-top: 20px;
	
}

.replyTitle{
	margin-bottom: 30px;
	font-size: 20px;
}

.replyTitle span{
	font-size: 25px;
	font-weight: bold;
}


.reply_arrow{
	width:30px; 
	height:auto;
	padding-right: 5px;
	padding-bottom: 15px;
	
}

.reply_writer_box{
	font-weight: bold;
}

.reply_comment_box{
	padding-bottom: 15px;
	word-break:break-all;
}

.reply_info_box{
	color:rgb(170,170,170);
	
}

.write_recomeent_btn{
	font-size: 15px;
	color:rgb(170,170,170);
	background: white;
	border: none;
	cursor: pointer;
}

.write_recomeent_btn:hover{
	font-weight: bold;
	color: black;
}

.writerId{
	font-weight: bold;
}

/* 댓글 수정 css */
.recomment_div{
	width: 80%;
	border: 1px solid rgb(180,180,180);
}
.recomment_div table{
	width: 100%;
	
	margin-top: 15px;
	
}

.recomment_div table tr td{
	padding-bottom: 15px;
	padding-right: 15px;
	padding-left: 15px;
}
.recomment_div table tr{
	margin-left: 20px;
	margin-right:20px;
}
.update_reply_btnDiv{
	height: 60px;
	border-top: 1px solid rgba(0,0,0,.1);
}

.update_reply_comment{
	width: 98%;
	height: 100px;
	resize: none;	
	border: none;	
	padding: 20px;	
	padding-left: 10px;
	padding-right: 10px;
	margin-left: 15px;
	margin-right: 15px;
	word-break:break-all;
	
	
}

.update_reply_comment:focus{
	border: 1px solid #ccc;
	border-radius: 5px 5px;
}

.update_reply_writer{
	font-weight: bold;
}

.update_reply_btn{
	float: right;
	cursor: pointer;
	height: 100%;
	background-color:white;
	border: none;
	border-left: 1px solid rgba(0,0,0,.1);
	font-weight: bold;
	width: 100px;
}

.update_reply_btn:hover{
	background-color:  #6434ef;
	color:white;
	transition: 0.3s;
}

.showDiv{
	display: block;
}

.hideDiv{
	display: none;
}

.free_Btn{
	float: right;
	margin-top : 15px;
	background-color: #EFF0F2;
	border: 1px solid #EFF0F2;
	width: 8%;
	height: 50px;
	font-size: 15px;
	padding: 1%;
	
	border-radius: 10px 10px;
	color: black;
	font-weight: bold;
	margin-left: 1%;
}
.free_Btn:hover{
	background-color: white;
	border: 1px solid #6434ef;
	font-weight:bold;
	color: #6434ef;
	cursor: pointer;
	transition: 0.5s;

}
</style>

<script type="text/javascript">
$(document).on("click", '[data-toggle="lightbox"]', function(event) {
	  event.preventDefault();
	  $(this).ekkoLightbox();
	});
	
<!-- 댓글 목록 가져오기 AJAX -->
function getReplyList() {
	var boardVal = {
			"b_no":${detail.b_no}
	};
	
	$.ajax({
		type:"post",
		url:"photoReplyList.do",
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

function insertReply(){
	var content = $("#write_content").val();
	
	if(content.length > 500){
		alert("500자 이하로 댓글을 작성해주세요!");
		return false;
	}
	
	var b_no = ${detail.b_no};
	var r_writer = ${login.mem_no};
	
	var replyVal = {
			"b_no" : b_no ,
			"r_writer":r_writer ,
			"r_comment" : content
	};

	//댓글 쓰기
	$.ajax({
		type:"post",
		url:"photoReplyWrite.do",
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
		url:"photoReplyUpdate.do",
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
	var b_no = ${detail.b_no}; //글번호
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
		url:"photoRecommentWrite.do",
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
<!-- 댓글 삭제 AJAX -->
function deleteReply(btn){
	var r_no = btn.value //댓글 번호
	
	var replyVal = {
			"r_no":r_no
	};

	//댓글 삭제 
	$.ajax({
		type:"post",
		url:"photoReplyDelete.do",
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
	
}

//페이지 로드 후에
$(document).ready( getReplyList() );

function showAttach(){
	var uploadFileDiv = $(".upload_file_box_detail");
	
	for(var i = 0 ; i < uploadFileDiv.length ; i++){
		uploadFileDiv.eq(i).toggle();
	}
}
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<br>
		<h1 style="text-align: center;">${detail.b_title}</h1>
		<h2>by.${galleryWriter }</h2>
		<div class="container mt-5">
				<div class="row">
				<c:forEach items="${fileDetail}" var="fileDetail">
					<a href="${fileDetail.f_url }" data-toggle="lightbox" data-gallery="gallery" class="col-md-4">
						<img id="fewsize" src="${fileDetail.f_url }" class="img-fluid rounded" alt></a>
				</c:forEach>
				</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<!-- 갤러리 뷰 끝 -->

		<!-- 갤러리 내용 시작 -->
		<div class="galleryContent">${detail.b_content }</div>
		<!-- 갤러리 내용 끝 -->
		

		<hr>
		<!-- 갤러리 댓글 시작 -->
		<br> <br>
		<div class="replyBox" ></div>
		
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
		
		
		<!-- 갤러리 댓글 끝 -->
			<div class="galleryBtnDiv">
			<c:choose>
				<c:when test="${dto.b_writer == login.mem_no }">
					<input type="button" class="galleryBtn" value="삭제" onclick="location.href='galleryDelete.do?b_no=${detail.b_no}'" />
					<input type="button" class="galleryBtn"  value="수정" onclick="location.href='galleryupdateform.do?b_no=${detail.b_no}'" />
					<input type="button" class="galleryBtn" value="목록" onclick="location.href='gallery.do'">
				</c:when>
				<c:otherwise>
					<input type="button" class="free_Btn" value="목록" onclick="location.href='gallery.do'">
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	


	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>