<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
<script src="./resources/assets/calendar/main.js"></script>
<link rel="stylesheet" href="./resources/assets/calendar/main.css">
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var calendarEl = document.getElementById("calendar");
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : "dayGridMonth",
			locale: "ko",
		    headerToolbar: {
		        left: "prev,next today",
		        center: "title",
		        right: "dayGridMonth,timeGridWeek,timeGridDay"
		      },
		      dayMaxEvents: true,
			 eventClick: function(){
		    	  var url = "studdypehome.do";
		            var name = "popup test";
		            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		            window.open(url, name, option);
		      },
			events: function(data, successCallback, failureCallback){
				$.ajax({
					type: "post",
					url: "calendar.do",
					dataType: "json",
					success:
						function(data){
						var events = [ ];
						if(data != null){
							$.each(data.meetList, function(index, meetList) {
								var enddate = meetList.vote_enddate;
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
			},
		});
		calendar.render();
	});
</script>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>