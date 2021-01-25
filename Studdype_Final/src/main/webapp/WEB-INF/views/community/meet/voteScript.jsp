<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
[tooltip]:hover:before {
    /* 여긴 건드리지 말 것 */
    opacity: 1;
    
    /* 변경가능 */
    background: #fff;
    margin-top: -70px;
    margin-left: -50px;     
}
</style>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script>

function getVoteResult() {
	var meetNum = {"meet_no":${dto.meet_no}};
	
	$.ajax({
		type:"post",
		url:"voteResult.do",
		data:JSON.stringify(meetNum),
		contentType:"application/json",
		dataType:"json",
		success:function(map){
			var total = map.totalResult // 총 투표수
			var no = parseInt((map.result_N)/(map.totalResult)*100);	// 참석 투표수/총 투표수*100
			var yes = parseInt((map.result_Y)/(map.totalResult)*100);	// 불참석 투표수/총 투표수*100
			var writer = map.meetWriter; // 모임 작성자
			var member = map.memberCnt;  // 투표 했으면: 1, 투표 안 했으면: 0
			var attendMap = map.attendMemberMap;
			var absentMap = map.absentMemberMap;
			var attendList = map.attendList;
			var absentList = map.absentList;
			var html = "";

			// 로그인 한 사람이 모임 작성자 이거나 투표했던 회원일 때
			if( member == 1 ){ 
				html += "<div class='voteResultForWriter'>"
							+"<div class='attend'>참석</div>"
							 	
				// '참석'에 투표한 사람이 없을 때
				if( yes == 0 || total == 0 ){
					result = "<div class='graph'><div style='width: 1px; background-color: #baabfb; data-toggle='modal' data-target='#attendModal''><br></div></div>"
							+"<div class='percentage'>0%</div>"
							+"<div class='modal fade' id='attendModal' role='dialog' aria-labelledby='introHeader' aria-hidden='true' tabindex='-1'>"
						  		+"<div class='modal-dialog'>"
				            		+"<div class='modal-content'>"
				            			+"<div class='modal-header'>"
				                			+"<h4 class=modal-title'>참석자 명단</h4>"
				               			+"</div>"
				                		+"<div class='modal-body'>투표 결과가 없습니다.</div>"
					                	+"<div class='modal-footer'>"
					                    	+"<button type='button' class='modalExitBtn' data-dismiss='modal'>닫기</button>"
					                	+"</div>"
				            		+"</div>"
				        		+"</div>"
				    		+"</div>";
				} else {
					result = "<div class='graph'>"
								+"<div style='width: " + yes + "%; background-color: #baabfb;' data-toggle='modal' data-target='#attendModal'><br></div>"
							+"</div>" 
							+"<div class='percentage'>" + yes + "%</div>"
							+"<div class='modal fade' id='attendModal' role='dialog' aria-labelledby='introHeader' aria-hidden='true' tabindex='-1'>"
							  	+"<div class='modal-dialog'>"
						            +"<div class='modal-content'>"
						            	+"<div class='modal-header'>참석자 명단</div>"
						                +"<div class='modal-body'>";
						                    for( var i = 0; i < attendList.length; i++ ){
						                	result += attendMap[ attendList[i].mem_no ].mem_id +"<br>";
						                    }
						       result += "</div>"
						                +"<div class='modal-footer'>"
						                    +"<button type='button' class='modalExitBtn' data-dismiss='modal'>닫기</button>"
						                +"</div>"
						            +"</div>"
						       +"</div>"
					    	+"</div>";
				}
				html += result
					 
				   html += "</div>"
							 +"<div class='voteResultForWriter'>"
						 		 +"<div class='attend'>불참석</div>"
						 		 
				 	// '불참석'에 투표한 사람이 없을 때
					if( no == 0 || total == 0 ){
						result = "<div class='graph'><div style='width: 1px; background-color: #b5b4bd; data-toggle='modal' data-target='#absentModal''><br></div></div>"
								+"<div class='percentage'>0%</div>"
							   	+"<div id='member_count_forWriter' tooltip='막대 그래프를 클릭 해보세요!' tooltip-persistent>참여인원: " + total + "명&nbsp;"
							  		+"<img src='./resources/assets/img/icon_questionMark.png'>"
							  	+"</div>"
						  	+"</div>"
							+"<div class='modal fade' id='absentModal' role='dialog' aria-labelledby='introHeader' aria-hidden='true' tabindex='-1'>"
						  		+"<div class='modal-dialog'>"
				            		+"<div class='modal-content'>"
				            			+"<div class='modal-header'>불참석자 명단</div>"
				                		+"<div class='modal-body'>투표 결과가 없습니다.</div>"
					                	+"<div class='modal-footer'>"
					                    	+"<button type='button' class='modalExitBtn' data-dismiss='modal'>닫기</button>"
					                	+"</div>"
				            		+"</div>"
				        		+"</div>"
				    		+"</div>";
					} else {
						result = "<div class='graph'>"
									+"<div style='width: " + no + "%; background-color: #b5b4bd;' data-toggle='modal' data-target='#absentModal'><br></div>"
								+"</div>" 
								+"<div class='percentage'>" + no + "%</div>"
								+"<div id='member_count_forWriter' tooltip='막대 그래프를 클릭 해보세요!' tooltip-persistent>참여인원: " + total + "명&nbsp;"
					  				+"<img src='./resources/assets/img/icon_questionMark.png'>"
					  			+"</div>"
					  		+"</div>"
							+"<div class='modal fade' id='absentModal' role='dialog' aria-labelledby='introHeader' aria-hidden='true' tabindex='-1'>"
							  	+"<div class='modal-dialog'>"
						            +"<div class='modal-content'>"
						            	+"<div class='modal-header'>불참석자 명단</div>"
						                +"<div class='modal-body'>";
						                    for( var i = 0; i < absentList.length; i++ ){
						                	result += absentMap[ absentList[i].mem_no ].mem_id +"<br>";
						                    }
						       result += "</div>"
						                +"<div class='modal-footer'>"
						                    +"<button type='button' class='modalExitBtn' data-dismiss='modal'>닫기</button>"
						                +"</div>"
						            +"</div>"
						      	+"</div>"
					    	+"</div>";
					}
					html += result
					
				  	$("#vote").html(html);
			  	
			} else {
				html += "<div class='btn-group' data-toggle='buttons'>"
							+"<label class='btn btn-success'>참석"
								+"<input type='radio' name='vote' class='attend' value='Y' autocomplete='off'>"
								+"<span class='glyphicon glyphicon-ok'></span><br>"
							+"</label>"
							+"<label class='btn btn-danger'>불참석"
								+"<input type='radio' name='vote' class='attend' value='N' autocomplete='off'>"
								+"<span class='glyphicon glyphicon-ok'></span>"
							+"</label>"
						+"</div>"
						+"<br>"
						+"<input type='button' value='투표하기' class='submitBtn vote' onclick='takeVote(this);'>"
			}
				$("#vote").html(html);
			},
			error:function(request,status,error){ // 통신 실패 
	      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     	}
		
	});
}

function takeVote(btn){
	var attend = $(".attend:checked").val();
	
	if( attend == null ){
		alert("참석여부를 선택 해주세요!");
		return false;
	}
	
	var meet_no = ${dto.meet_no};
	var mem_no = ${login.mem_no};
	
	var voteVal = {
			"meet_no":meet_no,
			"mem_no":mem_no,
			"vote_attend":attend
	};
	
	$.ajax({
		type:"post",
		url:"takeVote.do",
		data:JSON.stringify(voteVal),
		contentType:"application/json",
		dataType:"json",
		success:function(res){
			$(".attend").val(""); // radio checked 값 비우기
			if( res > 0 ) {
				getVoteResult();
			} else {
				alert("[ERROR]: 투표하기에 실패하였습니다.");
				getVoteResult();
			}
		},
		error:function(request,status,error){ // 통신 실패 
      		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

$(document).ready(getVoteResult());

</script>
</head>
<body>

</body>
</html>