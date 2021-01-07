<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meet Insert Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
	
// 도로명주소 검색 버튼 함수 
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
	
</script>
	
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	
     <!--main conternt 섹션-->
     <div class="main-section">
     
     	<!-- form의 action은 모임생성을 submit 하는 용도 -->
     	<img src="./resources/assets/img/banner_meetInsert.png" id="meetInsertBanner">
        <form action="meetinsert.do" method="post" autocomplete="off">
        	<div id="firstRow">
        		<div class="insertText">모임날짜</div>
        		<div class="dateCol1"><input type="date" name="meet_date"></div>
        		<div class="insertText">모임시간</div>
        		<div class="dateCol2"><input type="time" name="meet_time"></div>
        	</div>
        	<div id="secondRow">
        		<div class="insertText">모집시작일</div>
        		<div class="dateCol1"><input type="date" name="meet_startdate"></div>
        		<div class="insertText">모집마감일</div>
        		<div class="dateCol2"><input type="date" name="meet_enddate"></div>
        	</div>
        	<div id="thirdRow">
        		<div class="insertText">제목</div>
        		<div class="longDiv"><input type="text" name="meet_title" placeholder="50자 내로 입력하세요."></div>
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
        		<button type="submit" class="submitBtn" id="insertBtn_insert">등록하기</button>
        	</div>
        </form>
    </div>
    
    <jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>