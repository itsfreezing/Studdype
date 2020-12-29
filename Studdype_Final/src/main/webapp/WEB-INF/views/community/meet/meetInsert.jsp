<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>

	<script type="text/javascript">
	
	$(document).ready(function(){
		var start_year = "2015";				// 시작 할 년도
		var today = new Date(); 
		var today_year = today.getFullYear();	// 현재년도 
		var index = 0; 
		
		//	모임날짜 시작 할 년도 ~ 현재 년도
		for(var y=start_year; y<=today_year; y++){ 
			document.getElementById('meet_year').options[index] = new Option(y, y); 
			index++; 
		} 
		
		//	모임날짜 월
		index=0; 
		for(var m=1; m<=12; m++){ 
			document.getElementById('meet_month').options[index] = new Option(m, m); 
			index++; 
		} 
		lastday(); 
		
		//	모집시작일 시작 할 년도 ~ 현재 년도
		index=0;
		for(var y=start_year; y<=today_year; y++){ 
			document.getElementById('s_year').options[index] = new Option(y, y); 
			index++; 
		} 
		
		//	모집시작일 월
		index=0; 
		for(var m=1; m<=12; m++){ 
			document.getElementById('s_month').options[index] = new Option(m, m); 
			index++; 
		} 
		lastday(); 
		
		//	모집마감일 시작 할 년도 ~ 현재 년도
		index=0;
		for(var y=start_year; y<=today_year; y++){ 
			document.getElementById('e_year').options[index] = new Option(y, y); 
			index++; 
		} 
		
		//	모집마감일 월
		index=0; 
		for(var m=1; m<=12; m++){ 
			document.getElementById('e_month').options[index] = new Option(m, m); 
			index++; 
		} 
		lastday(); 
		
		//	년과 월에 따라 마지막 일 구하기(아직 적용 안 됨 보류)
		function lastday(){  
			var Year=document.getElementById('meet_year').value; 
			var Month=document.getElementById('meet_month').value; 
			var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
			var dayindex_len=document.getElementById('meet_day').length; 
			if(day>dayindex_len){ 
				for(var i=(dayindex_len+1); i<=day; i++){ 
					document.getElementById('meet_day').options[i-1] = new Option(i, i);
					document.getElementById('s_day').options[i-1] = new Option(i, i);
					document.getElementById('e_day').options[i-1] = new Option(i, i);
				} 
			} else if(day<dayindex_len){ 
				for(var i=dayindex_len; i>=day; i--){ 
					document.getElementById('meet_day').options[i]=null;
					document.getElementById('s_day').options[i]=null;
					document.getElementById('e_day').options[i]=null;
				} 
			} 
		} 
		
		//	시간 select option
		var minute = '';
		for (var i = 0; i < 60; i++) {
		  minute += "<option value = '" + i + "' >" + i + "</option>";
		}
		
		$('#minute').append(minute);
		
		var date1 = new Date();
		var m = date1.getMinutes();
		$("#minute").val(m);

		var hour = '';
		for (var j = 0; j < 24; j++) {
		  hour += "<option value = '" + j + "' >" + j + "</option>";
		}
		
		$('#hour').append(hour);
		
		var date2 = new Date();
		var h = date2.getHours();
		$("#hour").val(h);

		$("#hour option").filter(function() {
		    return $(this).text() == h;
		}).attr('selected', true);

		$("#minute option").filter(function() {
		    return $(this).text() == m;
		}).attr('selected', true);
		
	});
	</script>
	
</head>
<body>
		<jsp:include page="../../commond/studdypeHeader.jsp"></jsp:include>
	<jsp:include page="../../comunitycommon/studyleftnavi.jsp"></jsp:include>
	
     <!--main conternt 섹션-->
     <div class="main-section">
     
     	<!-- form의 action은 모임생성을 submit 하는 용도 -->
        <form action="meetinsert.do" method="post">
	        <table border="1" id="meetInsertTable">
	        	<tr>
	        		<th colspan="2">작성자:&nbsp;홍길동</th>
	        		<th colspan="4">모임날짜&nbsp;
	        			<select id="meet_year" onchange="lastday();"></select>년&nbsp; 
	        			<select id="meet_month" onchange="lastday();"></select>월&nbsp; 
	        			<select id="meet_day" onchange="lastday();"></select>일
	        		</th>
	        		<th colspan="4">모임시간&nbsp;
	        			<select id="hour"></select>시&nbsp;
						<select id="minute"></select>분
	        		</th>
	        	</tr>
	        	<tr>
	        		<th colspan="5">모집시작일&nbsp;
	        			<select id="s_year" onchange="lastday();"></select>년&nbsp; 
	        			<select id="s_month" onchange="lastday();"></select>월&nbsp; 
	        			<select id="s_day" onchange="lastday();"></select>일
	        		</th>
	        		<th colspan="5">모집마감일&nbsp;
	        			<select id="e_year" onchange="lastday();"></select>년&nbsp; 
	        			<select id="e_month" onchange="lastday();"></select>월&nbsp; 
	        			<select id="e_day" onchange="lastday();"></select>일
	        		</th>
	        	</tr>
	        	<tr>
	        		<th colspan="2">제목</th>
					<td colspan="8"><input type="text" placeholder="50자 내로 입력하세요." class="meetInsertInput"></td>	        	
	        	</tr>
	        	<tr>
	        		<th colspan="2">장소</th>
					<td colspan="8"><input type="text" class="meetInsertAddr"><input type="button" class="searchBtn" value="도로명 주소검색" onclick="location.href='meetinsert.do'"></td>
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