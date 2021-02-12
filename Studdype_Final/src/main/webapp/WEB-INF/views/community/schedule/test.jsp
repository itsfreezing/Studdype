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
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<link rel="stylesheet" href="./resources/assets/calendar/main.css">
<script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
<script src="./resources/assets/calendar/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
							$('.calDescription').text(data.dataList.meet_content).css('float','left');
						}
			    	});
			       			 $("#modal-one").show();
			       			 $("#modal-one").fadeIn("slow");
				    		  $("#modal-show").fadeIn("slow");
			       			 $(".calTitle").text(eventObj.title);
			       			 $(".calDate").text("투표기간: "+moment(eventObj.start).format("YYYY-MM-DD")+"~"+moment(eventObj.end).format("YYYY-MM-DD"));
			    		

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
	width: 350px;
	height: 300px;
	position: absolute;
	border-radius: 5px;
	left: 50%;
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
 margin-left: 20px;
 }
 .calDate{
 margin-left: 20px;
 }
 hr{
 background-color: gray;
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
			<h2 class="calTitle"></h2>
			<hr>
			<p class="calDate" ></p>
			<hr>
			<p style="margin-left: 20px;">내용:</p>
			<p class="calDescription"></p>
		</div>
	</div>
	
	<br><br>
	</div>

	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>