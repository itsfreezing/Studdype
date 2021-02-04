<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
<link rel="stylesheet" href="./resources/assets/calendar/main.css">
<script src="./resources/assets/calendar/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
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
/* 		    eventClick: function(calEvent, jsEvent) {
		        // Display the modal and set event values.
		        $(".modal").modal("show");
		        $(".modal")
		          .find("#title").val(calEvent.title);
		        $(".modal").find("#starts-at").val(calEvent.start);
		        $(".modal").find("#ends-at").val(calEvent.end);
		        $("#save-event").hide();
		        $("input").prop("readonly", true);
		      }); */
		    });
		});
		calendar.render();
	</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<div class="main-section">
	<br><br>
		<h1>calendar</h1>
	<div id='calendar'></div>

<!-- <div id='datepicker'></div>

<div class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4><input class="modal-title" type="text" name="title" id="title" placeholder="Event Title/Description" /></h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <label class="col-xs-4" for="starts-at">시작일: </label>
            <input type="text" name="starts_at" id="starts-at" />
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <label class="col-xs-4" for="ends-at">종료일: </label>
            <input type="text" name="ends_at" id="ends-at" />
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="save-event">Save</button>
      </div>
    </div>
    /.modal-content
  </div>
  /.modal-dialog
</div>
/.modal
	<br><br>
	</div> -->
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>