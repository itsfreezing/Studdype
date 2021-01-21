<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
		<script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js'></script>
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>

    <script type="text/javascript">
/*           document.addEventListener("DOMContentLoaded", function() {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	initialView: "dayGridMonth",
        	    events: function(meetList, start, end, callback){
        	    	$.ajax({
        	    		url: "calendar.do",
        	    		contentType:"application/json",
        	    		dataType: "json",
        	    		type:"post",
        	    		data: {
        	    				start: moment(meetList.vote_startdate).format("YYYY-MM-DD"),
        	    				end: moment(meetList.vote_enddate).format("YYY-MM-DD"),
        	    				title: meetList.meet_title
        	    				}, 
        	    		success: function(data){
						console.log(data);
        	    		},
        	    		error: function(){
        	    			alert("통신실패");
        	    		}
        	    	});
        	    }
        	
        });
        calendar.render();
      }); */
      $(function(){
    	  alert("12");
		
    	  var calendarEl = document.getElementById('calendar');
          alert("78");
          var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth'
          });
          calendar.render();
       
      alert("34");
      });
    </script>
<style type="text/css">
h1 {
	text-align: center;
}
</style>


</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>


	<!--main conternt 섹션-->
	<div class="main-section">
		<h1>calendar</h1>
		<br> <br> <br> <br>
		<div id="calendar"></div>


		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
	</div>
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>