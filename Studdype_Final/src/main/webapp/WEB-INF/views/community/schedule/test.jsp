<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="./resources/css/community/header&footer.css">
     <link rel="stylesheet" href="./resources/css/community/leftnavi.css">
    <link rel="stylesheet" href="./resources/css/community/mainsection.css">
    <link rel="stylesheet" href="./resources/css/mainstyle.css">
    <link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/main2.js"></script>
<link rel="stylesheet" href="./resources/assets/calendar/main.css">
<script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
<script src="./resources/assets/calendar/main.js"></script>
<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			  var calendarEl = document.getElementById('calendar');

			  var calendar = new FullCalendar.Calendar(calendarEl, {
			    initialView: 'dayGridMonth',
			    initialDate: '2021-02-07',
			    eventLimit: true,
			    headerToolbar: {
			      left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek,timeGridDay'
			    },
			    eventClick: function(info) {
			        var eventObj = info.event;
			    	$.ajax({
			    		type: "get",
			    		url: "selectcalendar.do",
			    		contentType:"application/json",
						dataType: "json",
						data: {
							'meet_title': eventObj.title,
							'vote_startdate': moment(eventObj.start).format("YYYY-MM-DD"),
							'vote_enddate': moment(eventObj.end).format("YYYY-MM-DD")
							
						},
			    		success:function(data){
							$('.calDescription').text(data.dataList.meet_content).css({'float':'left','font-family':'Jua'});
							$('.calDday').text(moment(data.dataList.meet_time).format("YYYY-MM-DD HH : MM")).css('font-family','Jua');
						}
			    	});
			       			 $("#modal-one").show();
			       			 $("#modal-one").fadeIn("slow");
				    		  $("#modal-show").fadeIn("slow");
			       			 $(".calTitle").text(eventObj.title).css('font-family','Jua');
			       			 $(".calDate").text(moment(eventObj.start).format("YYYY-MM-DD")+" ~ "+moment(eventObj.end).format("YYYY-MM-DD")).css('font-family','Jua');
			       			$("#modal-inside")

			    		$(".close").click(function() {
			    		  $("#modal-one").fadeOut("slow");
			    		  $("#modal-show").fadeOut("slow");
			    		});
			        
			      },
				events: function(data, successCallback, failureCallback){
					$.ajax({
						type: "post",
						url: "calendar.do",
						contentType:"application/json",
						dataType: "json",
						success:
							function(data){
							var events = [ ];
							if(data != null){
								$.each(data.meetList, function(index, meetList) {
									var enddate = meetList.vote_enddate;
									var description = meetList.meet_content;
									if(enddate==null) {
										enddate=meetList.startdate;
									}
									var startdate=moment(meetList.vote_startdate).format("YYYY-MM-DD");
									var enddate=moment(enddate).format("YYYY-MM-DD");
									var ctitle=meetList.meet_title;
									events.push({
															title: ctitle,
															start: startdate,
															end: enddate
															
														});
								});	//each 끝
							}	//if 끝
							successCallback(events);
						}
					});
				}
			  });

			  calendar.render();
			});
		

	</script>
	<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	
 	#modal-one{
	display: none;
	position: absolute;
	width: 100%;
	height: 2000px;
	background-color: rgb(0,0,0,0.6);
	z-index: 2000;
	left: 0;
	top: 0;
	}
	#modal-show{
	width: 600px;
	height: 550px;
	position: absolute;
	border-radius: 5px;
	left: 40%;
	top: 45%;
	 background: #fefefe;
	} 

  .close {
  cursor: pointer;
  color: #FFF;
  width: 50px;
  height: 50px;
  text-align: center;
  line-height: 50px;
  position: absolute;
  right: 0;
  color: #999;
  font-size: 40px;
}
.close span {
  transform: rotate(45deg);
  display: block;
}

.calDescription  {
	margin-left: 20px;
}
 .calTitle{
 margin: 20px;
font-family: Noto Sans;
 }
 .calDate{
 margin-right: 15px;
 font-family: Noto Sans;
 float: right;
 }
  .calDday{
 margin-right: 15px;
 font-family: Noto Sans;
 float: right;
 }
.feature-page.header-area {
	background-image: url(./resources/assets/img/features/gam.png)!important;
}
.modalhead{
	color: black;
    text-align: center;
    font-size: 30px;
    font-family: Jua;
    margin-bottom: 50px;
}
.modalheadimage{
	margin-left: 46%;
    margin-top: 10%;
    width: 50px;
}
#modalheaddiv{
	margin-bottom: 20px;
}
	</style>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	 <jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	<div class="main-section">
	<br><br>
		<h1>calendar</h1>
	<div id='calendar'></div>
	
 	<div id="modal-one">
		<div id="modal-show">
			<div class="close"><span>&#43;</span></div>
				<div id="modalheaddiv">
					<img class="modalheadimage" src="./resources/assets/img/category_schedule.png">
					<p class="modalhead">모임일정 상세보기</p>
				</div>
				<h2 class="calTitle"></h2>
			<hr>
			<div>
				<span style="margin-left: 15px; font-size: 17px; font-weight: bold; display: inline-block;  font-family: Jua;">투표기간</span>
				<span class="calDate"></span>
			</div>
			<div>
				<span style="margin-left: 15px; font-size: 17px; font-weight: bold; display: inline-block; font-family: Jua;">모임날짜</span>
				<span class="calDday"></span>
			</div>
			<hr>
			<p style="margin-left: 15px; font-weight: bold; font-size: 17px; font-family: Jua;">모임일정</p>
			<p class="calDescription"></p>
			
		</div>
	</div>
	
	<br><br>
	</div>

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>