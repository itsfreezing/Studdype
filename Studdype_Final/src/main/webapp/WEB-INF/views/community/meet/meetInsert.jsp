<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Meet Insert Page</title>

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

<!-- Daum 도로명 주소 Api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<script type="text/javascript">
	
<!-- 도로명주소 검색 버튼 함수 --> 
function execPostcode(){ 
	daum.postcode.load(function(){ 
		new daum.Postcode({
			oncomplete: function(data) { 

				// 주소 변수
				var addr = ''; 
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
				if (data.userSelectedType === 'R') { 		// 사용자가 도로명 주소를 선택했을 경우 
					addr = data.roadAddress; 
				} else { 									// 사용자가 지번 주소를 선택했을 경우(J) 
					addr = data.jibunAddress; 
				}  
				 
				// 주소 정보를 해당 필드에 넣는다.				
				document.getElementById("address").value = addr; 

				// 커서를 상세주소 필드로 이동한다. 
				document.getElementById("detailAddress").focus(); 
			}
		}).open();
	});
}
// 모임 날짜 체크
function chkMeetDate(){

	var now = new Date();
	year = now.getFullYear();   // 현재 년도 4자리수로 가져오기
	month = now.getMonth()+1;	// 현재 월 가져오기
	
	if((month+"").length < 2){  // 월이 '1'로 찍히지 않고 '01'로 찍히도록 길이를 받아온다
		month = "0" +month;     // 길이가 1이라면 앞에 0을 붙여서 '07'형태로 나오게 한다
	}
	
	date = now.getDate();       // 현재 날짜 가져오기
	
	if((date+"").length < 2){   // 일이 '1'로 찍히지 않고 '01'로 찍히도록 길이를 받아온다
		date = "0" +date;       // 길이가 1이라면 앞에 0을 붙여서 '01'형태로 나오게 한다
	}
	
	today = year +""+ month +""+ date ;	// 오늘 날짜 ex) 20080801

	var meetDate = document.getElementById("meetDate").value;    // 입력된 모임날짜 받아오기
	var dateSplit = meetDate.split("-");         				 //입력값을 '-'을 기준으로 나누어 배열에 저장해 주는 함수 split

 

	year = dateSplit[0];  // 첫 번째 배열은 년
	month = dateSplit[1]; // 두 번째 배열은 월
	day = dateSplit[2];   // 세 번째 배열은 일

	InputDate = year +""+ month +""+ day; //입력된 값을 더해준다.

 

	if (parseInt(InputDate) < parseInt(today) ){        //int형으로 변환하여 비교한다
		alert("오늘 날짜보다 이전 날짜입니다.");
		document.getElementById("meetDate").value = ""; //이전 날짜라면 입력폼 리셋처리
	}
 
}

// 모집시작 날짜 체크
function chkStartDate(){

	var meetDate = document.getElementById("meetDate").value;    
	var meetDateSplit = meetDate.split("-");         			 
	
	year = meetDateSplit[0];  
	month = meetDateSplit[1]; 
	day = meetDateSplit[2];   

	InputMeetDate = year +""+ month +""+ day; 
	
	var startDate = document.getElementById("voteStartDate").value; 
	var startDateSplit = startDate.split("-");         				
	
	year = startDateSplit[0];  
	month = startDateSplit[1]; 
	day = startDateSplit[2];   

	InputStartDate = year +""+ month +""+ day; 

 	if ( meetDate == null || meetDate.trim() == '' ) {
 		alert("모임날짜를 입력 해주세요.");
 		document.getElementById("voteStartDate").value = ""; 
	}else if ( parseInt(InputMeetDate) == parseInt(InputStartDate) ){        
		alert("모집시작일이 모임날짜와 같은 날짜일 수 없습니다.\n다시 입력 해주세요.");
		document.getElementById("voteStartDate").value = ""; 
	} else if ( parseInt(InputMeetDate) < parseInt(InputStartDate) ) {
		alert("모집시작일이 모임날짜보다 느린 날짜일 수 없습니다.\n다시 입력 해주세요.");
		document.getElementById("voteStartDate").value = ""; 
	}
 
}

// 모집마감 날짜 체크
function chkEndDate(){

	var meetDate = document.getElementById("meetDate").value;    
	var meetDateSplit = meetDate.split("-");         			 
	
	year = meetDateSplit[0];  
	month = meetDateSplit[1]; 
	day = meetDateSplit[2];   

	InputMeetDate = year +""+ month +""+ day; 
	
	var startDate = document.getElementById("voteStartDate").value; 
	var startDateSplit = startDate.split("-");         				
	
	year = startDateSplit[0];  
	month = startDateSplit[1]; 
	day = startDateSplit[2];   

	InputStartDate = year +""+ month +""+ day; 
	
	var endDate = document.getElementById("voteEndDate").value; 
	var endDateSplit = endDate.split("-");         				
	
	year = endDateSplit[0];  
	month = endDateSplit[1]; 
	day = endDateSplit[2];   

	InputEndDate = year +""+ month +""+ day; 
	alert(InputStartDate);
	alert(InputEndDate);

 	if ( meetDate == null || meetDate.trim() == '' ) {
 		alert("모임날짜를 입력 해주세요.");
 		document.getElementById("voteEndDate").value = ""; 
	}else if ( startDate == null || startDate.trim() == '' ){        
		alert("모집시작일을 입력 해주세요.");
		document.getElementById("voteEndDate").value = ""; 
	}else if ( parseInt(InputEndDate) < parseInt(InputStartDate) ){        
		alert("모집마감일이 모집시작일 보다 빠른 날짜일 수 없습니다.\n다시 입력 해주세요.");
		document.getElementById("voteEndDate").value = ""; 
	}else if ( parseInt(InputEndDate) > parseInt(InputMeetDate) ){        
		alert("모집마감일이 모임날짜 보다 느린 날짜일 수 없습니다.\n다시 입력 해주세요.");
		document.getElementById("voteEndDate").value = ""; 
	}else if ( parseInt(InputEndDate) == parseInt(InputMeetDate) ){        
		alert("모집마감일이 모임날짜와 같은 날짜일 수 없습니다.\n다시 입력 해주세요.");
		document.getElementById("voteEndDate").value = ""; 
	}  
}


<!-- insert 하기전에 비어있는 input 태그가 없는지 확인 -->
function chkForm(){
	var form = $("#meetWriteForm");
	var meetTime = $("#meetTime");
	var meetEndDate = $("#voteEndDate");
	var title = $("#meetTitle");
	var address = $("#address");
	var detailAddress = $("#detailAddress");
	var content = $("#contentArea");
	
	if( meetTime.val() == null || meetTime.val().trim() == ''){
		alert("모임시간을 입력 해주세요.")
	}else if( meetEndDate.val() == null || meetEndDate.val().trim() == ''){
		alert("모집 마감일을 입력 해주세요.")
	}else if( title.val() == null || title.val().trim() == ''){
		alert("제목을 작성해주세요")
	}else if( address.val() == null || address.val().trim() == ''){
		alert("도로명 주소를 입력 해주세요.")
	}else if( detailAddress.val() == null || detailAddress.val().trim() == ''){
		alert("상세주소를 작성해주세요")
	}else if( content.val() == null || content.val().trim() == ''){
		alert("모임 상세내용을 작성해주세요.")
	}else{
		form.submit();
	}
};

</script>
	
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	
     <!--main content 섹션-->
     <div class="main-section">
     
     	<img src="./resources/assets/img/banner_meetInsert.png" id="meetInsertBanner">
        <form action="meetinsert.do" method="post" id="meetWriteForm">
        	<div id="firstRow">
        		<div class="insertText">모임날짜</div>
        		<div class="dateCol1"><input type="date" name="meet_date" id="meetDate" onchange="chkMeetDate();"></div>
        		<div class="insertText">모임시간</div>
        		<div class="dateCol2"><input type="time" name="meet_time" id="meetTime" onchange=""></div>
        	</div>
        	<div id="secondRow">
        		<div class="insertText">모집시작일</div>
        		<div class="dateCol1"><input type="date" name="vote_startdate" id="voteStartDate" onchange="chkStartDate();"></div>
        		<div class="insertText">모집마감일</div>
        		<div class="dateCol2"><input type="date" name="vote_enddate" id="voteEndDate" onchange="chkEndDate();"></div>
        	</div>
        	<div id="thirdRow">
        		<div class="insertText">제목</div>
        		<div class="longDiv"><input type="text" name="meet_title" placeholder="50자 내로 입력하세요." id="meetTitle"></div>
        	</div>
        	<div id="fourthRow">
        		<div class="insertText">장소</div>
        		<div class="longDiv"><input type="text" name="meet_addr" id="address" readonly></div>
        		<div id="addrBtn"><input type="button" id="addrBtn" value="도로명 주소검색" onclick="execPostcode();"></div>
        		<div id="addrDiv"><input type="text" name="meet_addr_detail" id="detailAddress" placeholder="나머지 주소를 입력해주세요."></div>
        	</div>
        	<div id="fifthRow">
        		<div id="fifthRow-left"><div class="insertText">상세내용</div><br><br><br><br><br><br><br><br><br><br><br><br></div>
        		<div id="fifthRow-right"><textarea id="contentArea" name="meet_content" placeholder="2000자 내로 입력하세요."></textarea></div>
        	</div>
	        <div id="sixthRow">
        		<input type="button" class="submitBtn" id="insertBtn_insert" onclick="chkForm();" value="등록하기">
        	</div>
        </form>
    </div>
    
<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>