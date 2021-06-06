<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval/apvl_progress.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/leave/leaveRequest.css" />

<!-- 구현 -->
<section>
    <div class="page-header" >
        <h1>휴가신청 보관함</h1>
        <hr class="my-4">
    </div>

    <c:forEach items="${lvList}" var="lv" varStatus="lvs">

	    <div class="jumbotron ap-info" id="leaveDoc${lvs.index}">
	        <div class="ap-doc">
	            <div class="lv-info-head">
                    <h4 class="ap-info-title" id="ap-info-title"><b>${lv.applicantName} 휴가 신청</b></h4>
	            </div>
	            <div class="ap-info-middle">
	                <h4 class="ap-writer-name"><b><fmt:formatDate value="${lv.reqDate}" pattern="yyyy.MM.dd"/></b></h4>
	            </div>
	            <div class="lv-info-end">
            		<c:choose>
						<c:when test="${lv.apvlYn eq 'Y'}">
						    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#27ce79" class="bi bi-check-circle-fill process-circle" viewBox="0 0 16 16">
						        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
						    </svg>
						</c:when>
						<c:when test="${lv.apvlYn eq 'N'}">
						    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#fa2626" class="bi bi-check-circle-fill process-circle" viewBox="0 0 16 16">
						        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
						    </svg>
						</c:when>
						<c:otherwise>
						    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="gray" class="bi bi-check-circle-fill process-circle" viewBox="0 0 16 16">
						        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
						    </svg>	            		
						</c:otherwise>
					</c:choose>
	            	<br />
	                <button type="button" class="btn btn-secondary ap-progress-info-btn" id="ap-progress-info-btn" data-toggle="modal" data-target="#ap-progress-modal${lvs.index}">
	                    휴가 신청 조회
	                </button>
	            </div>
	        </div>
	    </div>
	    
	    <div class="modal fade ap-progress-modal" id="ap-progress-modal${lvs.index}" tabindex="-1" aria-labelledby="ap-progress-modal-label" aria-hidden="true">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="ap-progress-info-label"><b>휴가 신청 조회</b></h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                	<table class="table">
	                		<tr>
	                			<th scope="row">휴가 종류</th>
	                			<td>${lv.category}</td>
	                		</tr>
	                		<tr>
	                			<th scope="row">반차/일차</th>
	                			<c:choose>
	                				<c:when test='${lv.lvDuration eq "M"}'>
	                					<td>오전 반차</td>
	                				</c:when>
	                				<c:when test='${lv.lvDuration eq "A"}'>
	                					<td>오전 반차</td>
	                				</c:when>
	                				<c:when test='${lv.lvDuration eq "E"}'>
	                					<td>일차</td>
	                				</c:when>
	                			</c:choose>
	                		</tr>
							<tr>
	                			<th scope="row">신청 일자</th>
	                			<td>${lv.reqDate}</td>
	                		</tr>
							<tr>
	                			<th scope="row">휴가 기간</th>
	                			<td>${lv.lvDates}</td>
	                		</tr>
							<tr>
	                			<th scope="row">사유</th>
	                			<td>${lv.reason}</td>
	                		</tr>
							<tr>
	                			<th scope="row">승인여부</th>
	                			<td>${lv.apvlYn}</td>
	                		</tr>
							<tr>
	                			<th scope="row">첨부파일</th>
	                			<td>
	                				<button type="button" 
											class="btn btn-success"
											onclick="fileDownload(${lv.attach.no});">
											첨부파일 - ${lv.attach.originalFileName}
									</button>
								</td>
	                		</tr>
	                	</table>
	                	<form action="${pageContext.request.contextPath}/leave/list/approve"
		                	id="leaveApvlFrm" method="POST">
	                		<sec:csrfInput/>
	                		<input type="hidden" name="leaveId" value="${lv.leaveId}" />
	                		<input type="hidden" name="lvDuration" value="${lv.lvDuration}" />
	                		<input type="hidden" name="lvDates" value="${lv.lvDates}" />
	                		<input type="hidden" name="applicant" value="${lv.applicant}" />
	                		<input type="hidden" name="workspaceId" value="<sec:authentication property='principal.workspaceId'/>"/>
	                		<input type="hidden" name="approver" value="<sec:authentication property='principal.id'/>" />
	                	</form>
	                	<form action="${pageContext.request.contextPath}/leave/list/reject"
	                		id="leaveRejectFrm" method="POST">
	                		<sec:csrfInput/>
	               			<input type="hidden" name="leaveId" value="${lv.leaveId}" />
	               			<input type="hidden" name="workspaceId" value="<sec:authentication property='principal.workspaceId'/>"/>
	               		</form>
	                	<form action="${pageContext.request.contextPath}/leave/list/delete"
	                		  method="POST"
	                		  id="DeleteFrm">
	                		<sec:csrfInput/>
							<input type="hidden" name="leaveId" value="${lv.leaveId}" />
							<input type="hidden" name="workspaceId" value="<sec:authentication property='principal.workspaceId'/>"/>
	               		</form>
	                </div>
	                <div class="modal-footer">
                    	<sec:authentication property="principal" var="loginid"/>
	                    <sec:authorize access="hasRole('ADMIN')">
	                    	<c:if test="${fn:trim(lv.applicant) ne fn:trim(loginid.id)}">
		                    	<button type="button" class="btn btn-info" onclick="approveLeave();">승인</button>
		                    	<button type="button" class="btn btn-danger" onclick="rejectLeave();">반려</button>
	                    	</c:if>
	                    </sec:authorize>
	                    <c:if test="${fn:trim(lv.applicant) eq fn:trim(loginid.id)}">
	                    	<button type="button" class="btn btn-danger" onclick="deleteLeave();">삭제</button>
	                    </c:if>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                </div>
	            </div>
	        </div>
	    </div>
    </c:forEach>
    
    ${pageBar}
</section>

<script>
function approveLeave() {
	$('#leaveApvlFrm').submit();	
}

function rejectLeave() {
	$('#leaveRejectFrm').submit();	
}

function deleteLeave() {
	$('#DeleteFrm').submit();	
}

function fileDownload(no){
	location.href = "${pageContext.request.contextPath}/leave/fileDownload?no=" + no;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>