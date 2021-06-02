<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 


<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="근태 설정" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/attendanceSetting.css" />

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/attendance/attendanceSetting.js"></script>

<section>
	<div class="time-setting justify-content-center">
		<form class="form-signin" action="${pageContext.request.contextPath}/admin/attendance/setting" method="post">
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="workspaceId" value="${workspaceId}" />
			
			<div class="form-group">
				<label for="exampleInputEmail1">출근 시간</label>
				<input type="time" class="form-control time-input" name="officeInTime" value="${attendanceSystem.officeInTime}"/>
				<small class="form-text text-muted">
					출근 시간은 최소 오전 4시 최대 오후 12시 입니다.
				</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">퇴근 시간</label>
				<input type="time" class="form-control time-input" name="officeOffTime" value="${attendanceSystem.officeOffTime}">
				<small class="form-text text-muted">
					퇴근 시간은 최소 오후 3시 최대 오후 11시 입니다.
				</small>
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">점심 시간 시작</label>
				<input type="time" class="form-control time-input" name="lunchTimeStart" value="${attendanceSystem.lunchTimeStart}">
				<small class="form-text text-muted">
					점심 시간 시작은 최소 오전 11시 최대 오후 4시 입니다.
				</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">점심 시간 종료</label>
				<input type="time" class="form-control time-input" name="lunchTimeEnd" value="${attendanceSystem.lunchTimeEnd}">
				<small class="form-text text-muted">
					점심 시간 종료는 최소 오전 12시 최대 오후 5시 입니다.
				</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">근무시간</label>
				<fmt:parseNumber var="i" type="number" value="${attendanceSystem.workingTime}" />
				<input type="number" class="form-control time-input" name="workingTime" value="<c:out value="${i}" />" min="3" max="12">
				<small class="form-text text-muted">
					최소 근무 시간은 3시간 최대 근무시간은 12시간 입니다.
				</small>
			</div>
			<div class="form-group form-check">
				<input type="checkbox" class="form-check-input" name="flexTimeYn" ${attendanceSystem.flexTimeYn == 'Y' ? 'checked' : ''}>
				<label class="form-check-label" for="exampleCheck1">
					자율 출근제 여부
				</label>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">메모</label>
				<textarea class="form-control" name="memo" rows="3">${attendanceSystem.memo}</textarea>
				<small class="form-text text-muted memo-small">
					최대 150자까지 작성 가능합니다. 현재 글자수:
				</small>
			</div>
			<button type="submit" class="d-sm-flex align-items-center btn btn-primary btn-lg attendance-setting-submit-btn">
				확인
			</button>
		</form>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
