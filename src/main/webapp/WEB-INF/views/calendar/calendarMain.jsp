<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.kh.floworks.calendar.model.vo.Calendar, java.util.*" %>
<%-- 
<%
	List<Calendar> list = (ArrayList<Calendar>)request.getAttribute("showSchedule");
%>
 --%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<html>
<head>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- fullcalendar css -->
<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/fullcalendar/main.css' />
<!-- 풀캘린더 부트스트랩 테마  -->
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>

<!-- fullcaledar js -->
<script src='${pageContext.request.contextPath }/resources/fullcalendar/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/ko.js'></script>

<!-- custom -->
<link href="${pageContext.request.contextPath }/resources/fullcalendar/custom/css/calendar.css" rel="stylesheet" />	
<script src='${pageContext.request.contextPath }/resources/fullcalendar/custom/js/calendar.js'></script>
	
<script>
document.addEventListener('DOMContentLoaded', function() {
	  
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    /* 	plugins: [ dayGridPlugin, timeGridPlugin, listPlugin ], */
    	
	  headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      themeSystem: 'bootstrap',
    
      selectable: true,
      initialDate: new Date(),
      locale : "ko",
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true, //수정 가능 여부
      selectable: true,
      events: [
    	  {
              title: 'Business Lunch',
              start: '2021-05-03T13:00:00',
              constraint: 'businessHours'
            },
            {
              title: 'Meeting',
              start: '2020-09-13T11:00:00',
              constraint: 'availableForMeeting', // defined below
              color: '#257e4a'
            },
            {
              title: 'Conference',
              start: '2020-09-18',
              end: '2020-09-20'
            },
            {
              title: 'Party',
              start: '2020-09-29T20:00:00'
            },

            // areas where "Meeting" must be dropped
            {
              groupId: 'availableForMeeting',
              start: '2020-09-11T10:00:00',
              end: '2020-09-11T16:00:00',
              display: 'background'
            },
            {
              groupId: 'availableForMeeting',
              start: '2020-09-13T10:00:00',
              end: '2020-09-13T16:00:00',
              display: 'background'
            },

            // red areas where no events can be dropped
            {
              start: '2020-09-24',
              end: '2020-09-28',
              overlap: false,
              display: 'background',
              color: '#ff9f89'
            },
            {
              start: '2020-09-06',
              end: '2020-09-08',
              overlap: false,
              display: 'background',
              color: '#ff9f89'
            }
    	 
    	        ]
    	 });

    calendar.render();
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
  

</style>
</head>
<body>
<section>	
	<div style="height:30px; font-size:35px; font-weight:bold; margin-bottom:20px;">일정 관리</div>
	 <div id='calendar' style="position : relative;">
   			<button class="add-button" type="button" onclick="click_add();">일정 추가</button>
     </div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
