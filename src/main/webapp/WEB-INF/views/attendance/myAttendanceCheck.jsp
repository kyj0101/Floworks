<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 


<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="근태 관리" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/attendance/sb-admin-2.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/attendance/myAttendanceCheck.css" />

<section >
	<h3>내 근태 관리</h3>
	<hr>
	
	<div class="info-div card mb-4"
		style="">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">출근 제도</h6>
		</div>
		<div class="card-body">
			<p>
				출근 ${attendanceSystem.officeInTime} ~ 퇴근 ${attendanceSystem.officeOffTime}
			</p>
			<p class="mb-0">
				근무 시간 : ${attendanceSystem.workingTime}시간
			</p>
			<br />
			<p>
				점심시간 : ${attendanceSystem.lunchTimeStart} ~ ${attendanceSystem.lunchTimeEnd}
			</p>
			<p class="info-div-memo">
				${attendanceSystem.memo}
			</p>
			<p>					
				<c:if test="${attendanceSystem.flexTimeYn == 'Y'}">
					<br>
					*자율근무제 실시중
				</c:if>
			</p>
		</div>
	</div>
	
	<div class="cards">

		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
								남은 연차
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${memberLeave}일</div>
						</div>
						<div class="col-auto">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="d-sm-flex col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
								이번 한달 지각 횟수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${latenessCount}회</div>
						</div>
						<div class="col-auto">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="d-sm-flex col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								지난 1주동안 근무한 시간
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${weekOfficeHours}</div>
						</div>
						<div class="col-auto">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="d-sm-flex col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
								지난 한달동안 근무한 시간
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${monthOfficeHours}</div>
						</div>
						<div class="col-auto">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style="margin-bottom: 50px;">
		<div class="col-lg-6 mb-4">
			<div class="card bg-primary text-white shadow">
				<div class="card-body text-white-30">
					출근시간
					<div class="small" style="margin-top: 10px;">
						<strong>
							<c:if test="${attendance.officeIn == null}">
								기록없음
							</c:if>
							
							<c:if test="${attendance.officeIn != null}">
								<fmt:formatDate value="${attendance.officeIn}" pattern="HH:mm"/>
							</c:if>		
						</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 mb-4">
			<div class="card bg-success text-white shadow">
				<div class="card-body text-white-30">
					퇴근시간
					<div class="small" style="margin-top: 10px;">
						<strong>
							<c:if test="${attendance.officeOff == null}">
								기록없음
							</c:if>
							
							<c:if test="${attendance.officeOff != null}">
								<fmt:formatDate value="${attendance.officeOff}" pattern="HH:mm"/>
							</c:if>	
						</strong>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="d-sm-flex align-items-center justify-content-around btn-div">
		<form:form method="post" action="${pageContext.request.contextPath}/attendance/office/in" id="attendance-form">
		
			<input type="hidden" name="workspaceId" value="<sec:authentication property="principal.workspaceId"/>" />
			<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>" />
			<input type="hidden" name="flexTimeYn" value="${attendanceSystem.flexTimeYn}" />
			<input type="hidden" name="officeInTime" value="${attendanceSystem.officeInTime}" />
			<input type="hidden" name="workingTime" value="${attendanceSystem.workingTime}" />
				
			<c:if test="${attendance.officeIn == null}">								
				<button class="btn btn-primary attendance-btn" type="submit">
					출근
				</button>	
			</c:if>
		
			<c:if test="${attendance.officeIn != null && attendance.officeOff == null}">
				<button class="btn btn-primary attendance-btn" type="submit">
					퇴근
				</button>		
			</c:if>
		
			<c:if test="${attendance.officeIn != null && attendance.officeOff != null}">			
				<button class="btn btn-primary attendance-btn disabled" type="button" >
					퇴근
				</button>				
			</c:if>
		</form:form>
		
		<button class="btn btn-success attendance-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/leave/request'">
			휴가신청
		</button>
		
	</div>
</section>

<script>
$(function(){
	const officeIn = "${attendance.officeIn}";
	
	if(officeIn != ""){
		$("#attendance-form").attr("action","${pageContext.request.contextPath}/attendance/office/off");		
	}
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>