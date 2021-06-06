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

<!-- 구현 -->
<section>
    <div class="page-header" >
        <h1>결재 보관함</h1>
        <hr class="my-4">
    </div>

    <!-- 
        1. 결재문서 클릭시 상세 조회 페이지
        2. 결재버튼은 상세 조회 페이지에서
    -->
    <c:forEach items="${list}" var="apvl" varStatus="vs">

	    <div class="jumbotron ap-info">
	        <div class="ap-doc">
	            <div class="ap-info-head">
	                <a href="${pageContext.request.contextPath}/approval/apvlProgressDetail?apvlId=${apvl.apvlId}">
	                    <h4 class="ap-info-title" id="ap-info-title"><b>${apvl.title}</b></h4>
	                </a>
	                <p class="ap-info-date" id="ap-info-date"><fmt:formatDate value="${apvl.reqDate}" pattern="yyyy.MM.dd  hh:mm"/></p>
	            </div>
	            <div class="ap-info-middle">
	                <h4 class="ap-writer-name" id="ap-writer-name"><b>${apvl.writer}</b></h4>
	            </div>
	            <div class="ap-info-end">
	            	<c:if test="${not empty apvl.approver1}">
	            		<c:choose>
							<c:when test="${apvl.status1 eq 'y'}">
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#27ce79" class="bi bi-check-circle-fill process-circle" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>
							</c:when>
							<c:when test="${apvl.status1 eq 'n'}">
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
	            	</c:if>
	            	<c:if test="${not empty apvl.approver2}">
	            		<c:choose>
							<c:when test="${apvl.status2 eq 'y'}">
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#27ce79" class="bi bi-check-circle-fill process-circle" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>
							</c:when>
							<c:when test="${apvl.status2 eq 'n'}">
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#fa2626" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>
							</c:when>
							<c:otherwise>
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="gray" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>	            		
							</c:otherwise>
						</c:choose>
	            	</c:if>
	            	<c:if test="${not empty apvl.approver3}">
	            		<c:choose>
							<c:when test="${apvl.status3 eq 'y'}">
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#27ce79" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>
							</c:when>
							<c:when test="${apvl.status3 eq 'n'}">
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#fa2626" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>
							</c:when>
							<c:otherwise>
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="gray" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>	            		
							</c:otherwise>
						</c:choose>
	            	</c:if>
	            	<c:if test="${not empty apvl.approver4}">
	            		<c:choose>
							<c:when test="${apvl.status4 eq 'y'}">
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#27ce79" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>
							</c:when>
							<c:when test="${apvl.status4 eq 'n'}">
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#fa2626" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>
							</c:when>
							<c:otherwise>
							    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="gray" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
							        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							    </svg>	            		
							</c:otherwise>
						</c:choose>
	            	</c:if>
		            
	            	<br />
	                <button type="button" class="btn btn-secondary ap-progress-info-btn" id="ap-progress-info-btn" data-toggle="modal" data-target="#ap-progress-modal${vs.index}">
	                    결재 진행 상황
	                </button>
	            </div>
	        </div>
	    </div>
	    
	    <div class="modal fade ap-progress-modal" id="ap-progress-modal${vs.index}" tabindex="-1" aria-labelledby="ap-progress-modal-label" aria-hidden="true">
	        <div class="modal-dialog modal-dialog-centered modal-lg">
	            <div class="modal-content">
	                <div class="modal-header">
	          			
	                    <h5 class="modal-title" id="ap-progress-info-label"><b>결재 진행 상황</b></h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                    <table class="table" id="table">
							<thead>
								<!-- private String userId;
								private String name;
								private String dept;
								private String position; -->
								<tr>
							      <th scope="col">아이디</th>
							      <th scope="col">이름</th>
							      <th scope="col">부서</th>
							      <th scope="col">직급</th>
								  <th scope="col">타임로그</th>
						    	</tr>
							</thead>
							<tbody class="modal-tbody" id="modal-tbody">
								<c:forEach items="${apverMap[apvl.apvlId]}" var="approver" varStatus="apr">
									<tr>
										<td>${approver.userId}</td>
										<td>${approver.name}</td>
										<td>${approver.dept}</td>
										<td>${approver.position}</td>
										<c:choose>
											<c:when test="${apr.count eq 1}">
		                                    	<td><fmt:formatDate value="${apvl.timelog1}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		                                 	</c:when>
		                                 	<c:when test="${apr.count eq 2}">
		                                    	<td><fmt:formatDate value="${apvl.timelog2}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		                                 	</c:when>
		                                 	<c:when test="${apr.count eq 3}">
		                                    	<td><fmt:formatDate value="${apvl.timelog3}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
		                                 	</c:when>
		                                 	<c:when test="${apr.count eq 4}">
		                                    	<td><fmt:formatDate value="${apvl.timelog4}" pattern="yyyy-MM-dd  HH:mm:ss"/></td> 
		                                 	</c:when>
		                                 	<c:otherwise>
		                                    	<td>Timelog Error</td>
		                                 	</c:otherwise>
		                              	</c:choose>
									</tr>
								</c:forEach>
							</tbody>
	                    </table>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                </div>
	            </div>
	        </div>
	    </div>
    </c:forEach>
    
    ${pageBar}
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>