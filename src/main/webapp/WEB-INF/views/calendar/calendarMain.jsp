<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- fullcalendar css -->
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/fullcalendar/main.css' />

<!-- 풀캘린더 부트스트랩 테마  -->
<!-- <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'> -->

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- fullcaledar js -->
<script src='${pageContext.request.contextPath }/resources/fullcalendar/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/ko.js'></script>

<!-- custom -->
<link href="${pageContext.request.contextPath }/resources/fullcalendar/custom/css/calendar.css" rel="stylesheet" />	
<%-- <script src='${pageContext.request.contextPath }/resources/fullcalendar/custom/js/calendar.js'></script> --%>
	
<script>

var cal;
document.addEventListener('DOMContentLoaded', function() {
	  
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    /* 	plugins: [ dayGridPlugin, timeGridPlugin, listPlugin ], */
    	
	 headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      themeSystem: 'bootstrap',
      selectable: true,
      initialDate: new Date(),
      locale : "ko",
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: false, 
      selectable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      dayHeaderContent: function (date) {
          let weekList = ["일", "월", "화", "수", "목", "금", "토"];
              return weekList[date.dow];
          },
      
          
      dateClick: function(info) {
			$("#eventModal").modal("show");
			var date = info.dateStr
			$("#startDate").val(date);
			$("#endDate").val(date);
			
			var calendarName = $("#calendarName").val();
			$("#title").val(calendarName);
			$('#close').on('click', function(){
			$("#eventModal").modal("hide");});
      },
     /*  select: function(info){
    	  
      }, */
     
      eventClick: function(info){
	  		$("#eventModal").modal("show");
	  		$("#eventModal").find("#startDate").val(info.event.startStr);
			$("#eventModal").find("#endDate").val(info.event.endStr);
			
			console.log(info);
			
			$("#eventModal").modal("show");
			var date = info.dateStr
			$("#startDate").val(date);
			$("#endDate").val(date);
			var lectureName = $("#lectureName").val();
			$("#title").val(lectureName);
			$('#close').on('click', function(){
			$("#eventModal").modal("hide");
		});
      },
      
      eventClick: function(info){
  		$("#eventModal").modal("show");
		console.log(info);
      },
      //연월 표기 한국어 설정
      titleFormat : function(date) {
      	return date.date.year +"년 "+(date.date.month +1)+"월";
      }
    });
    calendar.render();
    
    <c:forEach items="${calendarList}" var="cal">
	    calendar.addEvent({
	    	id : '${cal.id}',
			title : '${cal.subject}', 
			start : '${cal.startDate}', 
			end : '${cal.endDate}'
		});
    </c:forEach>
    
    cal = calendar;
 
/******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
var eventId = 1 + Math.floor(Math.random() * 1000);

$("#save-event").on('click', function(){
	var title = $("#title").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();

	calendar.addEvent({
	title: title,
	start: startDate,
	end: endDate,
	allDay: true
	});
	
	
    if (startDate > endDate) {
        alert('끝나는 날짜가 앞설 수 없습니다.');
        return false;
    }

    if (title === '') {
        alert('일정명은 필수입니다.');
        return false;
    }

    $("#eventModal").modal('hide');
	});

$("#calAddFrm").submit(e => {
	var eventArr = calendar.getEvents();
	
	console.log(eventArr);
	
	$(eventArr).each((idx, elem) => {
		eventArr[idx] = elem.toPlainObject();
	});
	
	$("[name=dateList]").val(JSON.stringify(eventArr));
	
	console.log($("[name=dateList]").val());
	
	s
	});

});
/* 끝나는 날짜가 null이면 시작날짜가 나오게  */
//if(enddate==null){
//    enddate=element.startdate;
//}

//datepicker
$(function() {
$.datepicker.setDefaults({
	dateFormat : 'yy-mm-dd',
	startDate: '7d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	endDate: '6m',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
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

$("#startDate").datepicker('setDate', 'today');
$("#endDate").datepicker('setDate', 'today');
});


</script>

<style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  .inputModal {
	width: 65%;
	margin-bottom: 10px;
	justify-content: end;
}
  
</style>
</head>
<body>
<section>	
	<div style="height:30px; font-size:35px; font-weight:bold; margin-bottom:20px;">일정 관리</div>
	 <div id='calendar' style="position : relative;">
   			<!-- <button class="add-button" type="button" onclick="click_add();">일정 추가</button> -->
     </div>
     <div class="modal fade" tabindex="-1" role="dialog" id="eventModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

            	<!-- modal-header -->
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                </div>

				<!-- modal-body -->
                <div class="modal-body">
	                <div class="row mb-3">
					    <label for="title" class="col-sm-2 col-form-label">일정명</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="title" name="subject" required="required" />
					    </div>
				  	</div>

	                <div class="row mb-3">
					    <label for="start" class="col-sm-2 col-form-label">시작</label>
					    <div class="col-sm-10 form-group">
				        	<input type="text" class="datepicker form-control" id="startDate" name="startDate"/>
					    </div>
				  	</div>

	                <div class="row mb-3">
					    <label for="end" class="col-sm-2 col-form-label">끝</label>
					    <div class="col-sm-10 form-group">
				        	<input type="text" class="datepicker form-control" id="endDate" name="endDate"/>
					    </div>
				  	</div>
                </div>

				<!--s modal-footer -->
                <div class="modal-footer modalBtnContainer-addEvent">
                    <button type="button" class="btn btn-outline-secondary" id="close">취소</button>
                    <button type="button" class="btn btn-outline-success" id="save-event">저장</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
     <div class="row form-group justify-content-end">
		<div class="col-sm-auto">
		<!--밸류 넣기, json으로 값가져오기 -->
		<form:form action="${pageContext.request.contextPath}/calendar/calendarInsert"
			method="POST"
			id="calAddFrm">
			<input type="hidden" name="dateList"/>
			<input type="hidden" name="id" value="${param.id}"/>
			<input class="btn btn-outline-secondary btn" type="reset" value="리셋">
			<input class="btn btn-outline-success sub" id="insert" type="submit" value="등록 요청">
		</form:form>
		 
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>