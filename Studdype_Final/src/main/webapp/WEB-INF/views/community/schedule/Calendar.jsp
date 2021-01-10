<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CommunityHome</title>

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
    <link rel="stylesheet" href="./resources/assets/css/calendarmain.css">
    <script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/main.js"></script>
	<script src="./resources/assets/js/calendarmain.js"></script>
	<script src="./resources/assets/js/ko.js"></script>
	
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		  var initialLocaleCode = 'ko';
		  var localeSelectorEl = document.getElementById('locale-selector');
		  var calendarEl = document.getElementById('calendar');

		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    headerToolbar: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		    },
		    locale: initialLocaleCode,
		    buttonIcons: false, // show the prev/next text
		    weekNumbers: true,
		    navLinks: true, // can click day/week names to navigate views
		    editable: true,
		    dayMaxEvents: true, // allow "more" link when too many events
		    events: 'https://fullcalendar.io/demo-events.json?overload-day'
		  });

		  calendar.render();

		  // build the locale selector's options
		  calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
		    var optionEl = document.createElement('option');
		    optionEl.value = localeCode;
		    optionEl.selected = localeCode == initialLocaleCode;
		    optionEl.innerText = localeCode;
		    localeSelectorEl.appendChild(optionEl);
		  });

		  // when the selected option changes, dynamically change the calendar option
		  localeSelectorEl.addEventListener('change', function() {
		    if (this.value) {
		      calendar.setOption('locale', this.value);
		    }
		  });

		});

	</script>
	<style type="text/css">
	h1{
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
        <br><br><br><br>
        
		<div id='calendar'></div>




        <br><br><br><br><br><br><br><br><br>
    </div>
    
    <jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>