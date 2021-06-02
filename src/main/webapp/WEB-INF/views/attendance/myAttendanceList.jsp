<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="근태 목록" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/attendance/myAttendanceList.css" />

<section>
	<div class="d-flex attendance-search-div">
		<form:form action="${pageContext.request.contextPath}/attendance/list/search" >
			<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>" />
			<div class="col-md-3 mb-3">
			
		      <select class="custom-select" id="validationTooltip04" required>
		       	<option value="" selected>선택 안함</option>
		       		
		        <c:forEach items="${yearList}" var="year">
		        	<option value="${year}">${year}년</option>
				</c:forEach>
				
		      </select>
		    </div>
		    
			<div class="col-md-3 mb-3">
		      <select class="custom-select" id="validationTooltip04" required>
		      	
		      	<option value="" selected>월</option>
		      	
		       	<c:forEach items="${monthList}" var="month">
					<option value="${month}">${month}월</option>
				</c:forEach>
				
		      </select>
		    </div>
		    
		    <div class="col-md-3 mb-3">
		      <select class="custom-select" id="validationTooltip04" required>
		      		
		      		<option value="" selected>일</option>
		      		
		      		<c:forEach var="day" begin="1" end="31">
		      			<option value="${day}">${day}일</option>
					</c:forEach>
					
		      </select>
		    </div>
			<button type="submit" class="btn btn-primary attendance-search-btn">검색</button>
	    </form:form>
	</div>


	<table class="table" style="">
		<thead class="thead-light">
			<tr>
				<th scope="col">출근일</th>
				<th scope="col">출근 시각</th>
				<th scope="col">퇴근 시각</th>
				<th scope="col">지각</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${attendanceList}" var="attendance">
			
			<tr>
				
				<th scope="row">
					<fmt:formatDate value="${attendance.day}" pattern="yy/MM/dd"/>
				</th>
				<td>
					<fmt:formatDate value="${attendance.officeIn}" pattern="HH:mm"/>
				</td>
				<td>
					<fmt:formatDate value="${attendance.officeOff}" pattern="HH:mm"/>
				</td>
				<td>
					${attendance.latenessYn == 'N' ? 'X' : 'O'}
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr>
	${pageBar}
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>