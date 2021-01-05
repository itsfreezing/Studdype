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
$(document).ready(function(){
});
	
</script>
	
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	
     <!--main conternt 섹션-->
     <div class="main-section">
     
     	<!-- form의 action은 모임생성을 submit 하는 용도 -->
        <form action="meetinsert.do" method="post">
	        <table border="1" id="meetInsertTable">
	        	
	        	<tr>
	        		<th colspan="2">작성자:&nbsp;홍길동</th>
	        		<th colspan="4">모임날짜&nbsp;
	        			<input type="date" name="meet_date">
	        		</th>
	        		<th colspan="4">모임시간&nbsp;
	        			<input type="time" name="meet_time">
	        		</th>
	        	</tr>
	        	
	        	<tr>
	        		<th colspan="5">모집시작일&nbsp;
	        			<input type="date" name="meet_startdate">
	        		</th>
	        		<th colspan="5">모집마감일&nbsp;
	        			<input type="date" name="meetenddate">
	        		</th>
	        	</tr>
	        	<tr>
	        		<th colspan="2">제목</th>
					<td colspan="8"><input type="text" placeholder="50자 내로 입력하세요." class="meetInsertInput"></td>	        	
	        	</tr>
	        	<tr>
				   <th colspan="2">장소</th>
				   <td colspan="8" >
					   <input type="text" id="address" class="meetInsertAddr" readonly ><input type="button" class="searchBtn" value="도로명 주소검색" onclick="execPostcode();">
					   <input type="text" id="detailAddress" class="meetInsertAddr" placeholder="나머지 주소를 입력해주세요.">
				   </td>
			   </tr>
	        	<tr>
					<th colspan="2">상세<br><br>내용</th>
					<td colspan="8"><textarea rows="30" class="meetInsertInput" placeholder="2000자 내로 입력하세요."></textarea></td>
				</tr>
	        </table>
	        <div>
        		<button type="submit" class="submitBtn" id="insertBtn_insert">등록하기</button>
        	</div>
        </form>
    </div>
    
    <jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>