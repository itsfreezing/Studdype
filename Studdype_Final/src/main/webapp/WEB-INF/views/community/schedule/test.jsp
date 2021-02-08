<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
<link rel="stylesheet" href="./resources/assets/calendar/main.css">
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
			    eventClick: function(event, jsEvent, view) {
			        var eventObj = event;
						
			          alert('title: ' + eventObj.title+ '\n'+ 'startDate: '+eventObj.start+'\n'+'endDate: '+eventObj.end+'\n'+eventObj.description);
			        showEvent(event);
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
									if(enddate==null) {
										enddate=meetList.startdate;
									}
									var startdate=moment(meetList.vote_startdate).format("YYYY-MM-DD");
									var enddate=moment(enddate).format("YYYY-MM-DD");
									var ctitle=meetList.meet_title;
									var content = meetList.meet_content;
									events.push({
															title: ctitle,
															description: content,
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
		
		var showEvent = function (event, element, view) {

		    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID




		    if (event.end === null) {
		        event.end = event.start;
		    }


		    modalTitle.html('일정 정보');
		    editTitle.val(event.title);
		    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
		    editDesc.val(event.description);
	
		    addBtnContainer.hide();
		    modifyBtnContainer.show();
		    eventModal.modal('show');

		    //업데이트 버튼 클릭시
		    $('#updateEvent').unbind();
		    $('#updateEvent').on('click', function () {

		        if (editStart.val() > editEnd.val()) {
		            alert('끝나는 날짜가 앞설 수 없습니다.');
		            return false;
		        }

		        if (editTitle.val() === '') {
		            alert('일정명은 필수입니다.')
		            return false;
		        }

		        var statusAllDay;
		        var startDate;
		        var endDate;
		        var displayDate;

		        if (editAllDay.is(':checked')) {
		            statusAllDay = true;
		            startDate = moment(editStart.val()).format('YYYY-MM-DD');
		            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
		            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
		        } else {
		            statusAllDay = false;
		            startDate = editStart.val();
		            endDate = editEnd.val();
		            displayDate = endDate;
		        }

		        eventModal.modal('hide');

		        event.allDay = statusAllDay;
		        event.title = editTitle.val();
		        event.start = startDate;
		        event.end = displayDate;
		        event.type = editType.val();
		        event.backgroundColor = editColor.val();
		        event.description = editDesc.val();

		        $("#calendar").fullCalendar('updateEvent', event);

		    });
		};
	</script>
	<style type="text/css">

	</style>
</head>
<body>

	<div class="main-section">
	<br><br>
		<h1>calendar</h1>
	<div id='calendar'></div>
	
	 <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc" readonly="readonly"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
	

	<br><br>
	</div>
	<jsp:include page="../../commond/commondFooter.jsp"></jsp:include>
</body>
</html>