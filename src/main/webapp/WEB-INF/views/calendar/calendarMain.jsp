<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- fullcalendar css -->
<link rel='stylesheet'
	href='${pageContext.request.contextPath }/resources/fullcalendar/main.css' />

<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- fullcaledar js -->
<script src='${pageContext.request.contextPath }/resources/fullcalendar/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/ko.js'></script>

<script>
var cal;
document.addEventListener('DOMContentLoaded', function() {
	  
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
	 headerToolbar: {
        left: 'prev,next',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      }, 
      themeSystem: 'bootstrap',
      initialDate: new Date(),		//현재날짜 설정
      locale : "ko",				//언어설정
      navLinks: true, 				//can click day/week names to navigate views
      editable: false, 
      eventLimit: true,
      selectable: true,
      dayMaxEvents: true, 			// allow "more" link when too many events
      businessHours: true, 			// display business hours
      dayHeaderContent: function (date) {
          let weekList = ["일", "월", "화", "수", "목", "금", "토"];
              return weekList[date.dow];
      },
      select : function(info){
    	$("#eventModal").modal("show");
    	$("#eventModal").find("#startDate").val(info.startStr);
    	$("#eventModal").find("#endDate").val(info.endStr);
      },
      //백그라운드 클릭시
      dateClick: function(info) {
			$("#eventModal").modal("show");
			var date = info.dateStr
			$("#startDate").val(date);
			$("#endDate").val(date);
			
			var calendarName = $("#calendarName").val();
			$("#title").val(calendarName);
      },
      //이벤트 클릭시 
      eventClick: function(info){
	  		$("#eventUpdateModal").modal("show");
			$("#updateNo").val(info.event.id);
			$("#deleteNo").val(info.event.id);
			$("#updateSubject").val(info.event.title);
			$("#updateStartDate").val(info.event.startStr);
			//종료일 설정
			if(!info.event.enddateStr){
				$("#updateEndDate").val(info.event.startStr);
			} else {
				$("#updateEndDate").val(info.event.endStr);				
			}
			console.log(info);
		
      },
      //title 설정
      titleFormat : function(date) {
      	return date.date.year +"년 "+(date.date.month +1)+"월";
      }
    });
    

    <c:forEach items="${calendarList}" var="cal">
	    calendar.addEvent({
	    	id : ${cal.calNo},
			title : '${cal.subject}', 
			start : '${cal.startDate}', 
			end : '${cal.endDate}',
			description : '${cal.id}'
		});
    </c:forEach>
    
    calendar.render();
    
    cal = calendar;
    
    $('#eventModal').on('hidden.modal', function(){
		$("#title").val('');
		$("#startDate").val('');
		$("#endDate").val('');
	});
    
    $('#eventUpdateModal').on('hidden.modal', function(){
		$("#updateNo").val('');
		$("#deleteNo").val('');
		$("#updateTitle").val('');
		$("#updateStartDate").val('');
		$("#updateEndDate").val('');
	});


	$("#calAddFrm").submit(e => {	
		var title = $("#title").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		
		if (startDate > endDate) {
	        alert('끝나는 날짜가 앞설 수 없습니다.');
	        return false;
	    }
	    if (title === '') {
	        alert('일정명은 필수입니다.');
	        return false;
	    }
	});
	
	$("#calUpdateFrm").submit(e => {
		var title = $("#updateTitle").val();
		var startDate = $("#updateStartDate").val();
		var endDate = $("#updateEndDate").val();
		
		if (startDate > endDate) {
	        alert('끝나는 날짜가 앞설 수 없습니다.');
	        return false;
	    }
		
	    if (title === '') {
	        alert('일정명은 필수입니다.');
	        return false;
	    }		
	});
	
	$("#delete").click(e => {		
		$("#calDeleteFrm").submit();
	});
});

//datepicker 
//달력 뜰 수 있게
$(function() {
$.datepicker.setDefaults({
	dateFormat : 'yy-mm-dd',
	startDate: '7d', 
	endDate: '6m',	
	showOtherMonths : true,
	showMonthAfterYear : true,
	changeYear : true,
	changeMonth : true,
	yearSuffix: "년",
	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	dayNamesMin: ['일','월','화','수','목','금','토'],
	dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']

});

$("#startDate").datepicker();
$("#endDate").datepicker();
$("#updateStartDate").datepicker();
$("#updateEndDate").datepicker();

$("#startDate").datepicker('setDate', 'today');
$("#endDate").datepicker('setDate', 'today');
$("#updateStartDate").datepicker('setDate', 'today');
$("#updateEndDate").datepicker('setDate', 'today');
});

</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 40px auto;
}

</style>
</head>
<body>
	<section>
		<div style="height: 30px; font-size: 35px; font-weight: bold; margin-bottom: 20px;">일정관리</div>
		<div id='calendar' style="position: relative;"></div>
		<form:form
			action="${pageContext.request.contextPath}/calendar/calendarInsert"
			method="POST" id="calAddFrm">
			<div class="modal fade" tabindex="-1" role="dialog" id="eventModal" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<!--밸류 넣기, json으로 값가져오기 -->
						<input type="hidden" name="dateList" />
						 <input type="hidden" name="id" value="${param.id}" />
						<!-- modal-body -->
						<div class="modal-body">
							<div class="row my-3">
								<label for="title" class="col-sm-2 form-label">일정명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title" name="subject" required="required" />
								</div>
							</div>
							<div class="row my-3">
								<label for="start" class="col-sm-2 form-label">시작일</label>
								<div class="col-sm-10 form-group">
									<input type="text" class="datepicker form-control" id="startDate" name="startDate" />
								</div>
							</div>
							<div class="row my-3">
								<label for="end" class="col-sm-2 form-label">종료일</label>
								<div class="col-sm-10 form-group">
									<input type="text" class="datepicker form-control" id="endDate" name="endDate" />
								</div>
							</div>
						</div>
						<!--modal-footer -->
						<div class="modal-footer modalBtnContainer-addEvent">
							<button type="submit" class="btn btn-outline-success" id="save-event">저장</button>
							<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</form:form>

		<form:form
			action="${pageContext.request.contextPath}/calendar/calendarUpdate"
			method="POST" id="calUpdateFrm">
			<div class="modal fade" tabindex="-1" role="dialog" id="eventUpdateModal" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<!--밸류 넣기, json으로 값가져오기 -->
						<input type="hidden" id="updateNo" name="calNo" />
						<!-- modal-body -->
						<div class="modal-body">
							<div class="row my-3">
								<label for="title" class="col-sm-2 form-label">일정명</label>
								<div class="col-sm-10 form-group">
									<input type="text" class="form-control" id="updateSubject" name="subject" required="required" />
								</div>
							</div>
							<div class="row my-3">
								<label for="start" class="col-sm-2 form-label">시작일</label>
								<div class="col-sm-10 form-group">
									<input type="text" class="datepicker form-control" id="updateStartDate" name="startDate" />
								</div>
							</div>
							<div class="row my-3">
								<label for="end" class="col-sm-2 form-label">종료일</label>
								<div class="col-sm-10 form-group">
									<input type="text" class="datepicker form-control" id="updateEndDate" name="endDate" />
								</div>
							</div>
						</div>
						<!--modal-footer -->
						<div class="modal-footer modalBtnContainer-addEvent">
							<button type="submit" class="btn btn-outline-warning" id="update">수정</button>
							<button type="button" class="btn btn-outline-danger" id="delete">삭제</button>
							<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</form:form>

		<form:form
			action="${pageContext.request.contextPath}/calendar/calendarDelete"
			method="POST" id="calDeleteFrm">
			<input type="hidden" id="deleteNo" name="no" />
		</form:form>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>