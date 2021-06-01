<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.kh.floworks.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd/ a hh:mm:ss");
%>

<jsp:useBean id="now" class="java.util.Date" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="근태 조회" name="title"/>
</jsp:include>

<!-- calendar 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>


<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/attendance/attendance.css">

<!-- js -->   
<script src="${pageContext.request.contextPath }/resources/js/attendance/attendance.js"></script>

<script>
$(document).ready(function(){
	  $('#calendar').fullCalendar({
	    header: {
	      right: 'custom2 prevYear,prev,next,nextYear'
	    },
      // 출석체크를 위한 버튼 생성
	    customButtons: { 
	        custom2: {
	          text: '출/퇴근',
	          id: 'check',
	          click: function() {	
                  // ajax 통신으로 출석 정보 저장하기 
                  // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
                  // 통신 성공시 버튼 바꾸고, property disabled 만들기
                

	          }
	        }
	    },
     // 달력 정보 가져오기 
	    eventSources: [
	    	{
				// ajax 통신으로 달력 정보 가져오기 
              // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
				color: 'purple',   
			 	textColor: 'white' 
	    	}
	    ]
	  }); 
});
</script>


<section>

	<!-- 개인 근태 관리 창 -->
	<div class="page-header" >
	    <h1>근태 관리</h1>
	    <hr class="my-4">
	</div>
	
	<div class="container">
	    <div class="left">
	        <div class="input-mid">
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                  <span class="input-group-text" id="inputGroup-sizing-default">직원명</span>
	                </div>
	                <input type="text" id="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="<sec:authentication property="principal.name"/>" readonly>
	            </div>
	
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text" id="inputGroup-sizing-default">부서명</span>
	                </div>
	                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="개발팀" readonly>
	            </div>
	
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text" id="inputGroup-sizing-default">직급</span>
	                </div>
	                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="주임" readonly>
	            </div>
	
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text" id="inputGroup-sizing-default">남은 연차</span>
	                </div>
	                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="13" readonly>
	            </div>
	
	            <button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/leave/request'">연차 사용하기</button>
	            
	        </div>
	    </div>
	            
	    <div class="right">
	    <!-- 출/퇴근 + 달력 -->
	    <div class="calendar-container">
			<div id="calendar"></div>
			<div class="current-time">
           	<%-- <input class="form-control" type="text" value="<%= sdf.format(nowTime) %>"> --%>
                <div class="form-control" >
                <fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" var="today"/>
                <c:out value="${today}"/>
                </div>
                
            </div>
		</div>

	    
	    <!-- 현재시간 + 출/퇴근 버튼 -->
        <%-- <form class="attendance">
            <div class="current-time">
           <input class="form-control" type="text" value="<%= sdf.format(nowTime) %>">
                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
                <c:out value="${today}"/>
            </div>
            <div class="attend-bt">
                <button type="submit" class="btn btn-outline-primary" onclick="">출근</button>
                   <button type="submit" class="btn btn-outline-danger">퇴근</button>
              	</div>
       </form> --%>
	            
       </div>
	        
	        <div class="down">
	            <div class="left">
	                <div class="breakdown-mid">
	                    <div class="form-group">
	                        <label for="exampleFormControlSelect2">연차 사용 내역</label>
	                        <select multiple class="form-control" id="exampleFormControlSelect2">
	                          <option>1. 21/04/15 (반차)</option>
	                          <option>2. 21/02/15 ~ 21/02/17 (3일)</option>
	                          <option>3.</option>
	                          <option>4.</option>
	                          <option>5.</option>
	                          <option>6.</option>
	                          <option>7.</option>
	                          <option>8.</option>
	                          <option>9.</option>
	                          <option>10.</option>
	                        </select>
	                    </div>
	                </div>
	                
	            </div>
	            <div class="right">
	                <div class="breakdown-mid">
	                    <div class="form-group">
	                        <label for="exampleFormControlSelect2">출/퇴근 내역</label>
	                        <select multiple class="form-control" id="exampleFormControlSelect2">
	                            <option>1. 2021/05/12 08:55:30 출근</option>
	                            <option>2. 2021/05/11 18:01:30 퇴근</option>
	                            <option>3. 2021/05/11 08:57:27 출근</option>
	                            <option>4. 2021/05/10 19:21:12 퇴근</option>
	                            <option>5. 2021/05/10 08:50:02 출근</option>
	                            <option>6. 2021/05/07 18:30:42 퇴근</option>
	                            <option>7. 2021/05/07 08:59:45 출근</option>
	                            <option>8. 2021/05/06 18:00:00 퇴근</option>
	                            <option>9. 2021/05/06 09:00:27 출근</option>
	                            <option>10. 2021/05/05 18:24:18 퇴근</option>
	                        </select>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>