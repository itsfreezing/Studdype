<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meet Detail Page</title>

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
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>

    <!-- kakao map API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04bc0d5da72e456d3406d52a61067ecd"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
	
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			        });
			        infowindow.open(map, marker);
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});   
		});
	</script>
	
<<<<<<< HEAD
=======
>>>>>>> 5bf1b79b42db84f7bd726a9887b431be39617a02
>>>>>>> 75f8ca6a16ee21380499de3313bc063597cd1de4
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
	
     <!--main conternt 섹션-->
     <div class="main-section">
     	
     	<!-- 모임 상세페이지 -->
     	<!-- form의 action은 updateform으로 넘어가는 용도 -->
        <form action="meetupdateform.do" method="post">
	        <table border="1" id="meetInsertTable">
	        	<tr>
	        		<th colspan="2">작성자:&nbsp;홍길동</th>
	        		<th colspan="4">모임날짜:&nbsp;2021년&nbsp;1월&nbsp;1일</th>
	        		<th colspan="4">모임시간:&nbsp;오후2시</th>
	        	</tr>
	        	<tr>
	        		<th colspan="5">모집시작일:&nbsp;2020년&nbsp;12월&nbsp;25일</th>
	        		<th colspan="5">모집마감일:&nbsp;2020년&nbsp;12월&nbsp;31일</th>
	        	</tr>
	        	<tr>
	        		<th colspan="10">제목:&nbsp;홍길동의 스터디 첫 정모</th>
	        	</tr>
	        	<tr>
<<<<<<< HEAD
	        		<td colspan="10" id="map"></td>
	        	</tr>
	        	<tr>
=======
<<<<<<< HEAD
=======
	        		<td colspan="10" id="map"></td>
	        	</tr>
	        	<tr>
>>>>>>> 5bf1b79b42db84f7bd726a9887b431be39617a02
>>>>>>> 75f8ca6a16ee21380499de3313bc063597cd1de4
	        		<th colspan="10">장소:&nbsp;스타벅스 대치사거리점</th>
	        	</tr>
	        	<tr>
					<td colspan="5">
						<textarea rows="30" class="meetInsertInput" readonly>인기만점 홍길동의 2021 스터디 첫 정모 참가인원 모집합니다! 오른쪽 투표함에서 참가/불참가 투표 부탁드리며, 참석 결정 하신 분들은 혹시 못오게 되시면 댓글로 미리 말씀 부탁드립니다!
						</textarea>
					</td>
					
					<!-- 투표 -->
					<th colspan="5" id="vote_text" align="center">참가여부<br><br><br>
						<input type="radio" name="fruit" value="apple">참석<br><br>
      					<input type="radio" name="fruit" value="banana">불참석<br><br> 						
			        	<input type="button" value="투표하기" class="submitBtn vote" onclick="">
					</th>
	        </table>
	        <div>
		        <button class="submitBtn" id="detailBtn_updateform">수정</button>&nbsp;&nbsp;
		        <input type="button" value="삭제" class="submitBtn" id="detailBtn_delete" onclick="location.href='meetlist.do'">
		    </div>
        </form>
    </div>
    
    <jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>