<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
 
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="이메일 목록" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailList.css" />

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<section>
<form method="POST" action="${pageContext.request.contextPath}/email/delete?type=${listType}&id=<sec:authentication property="principal.id"/>">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	
	<div class="search-div d-flex flex-row-reverse bd-highlight">
	
		<button type="submit" class="btn btn-primary" id="del-btn">삭제</button>
		
	</div>
	
	<div>
		<table class="table email-table">
			<tbody>
			
				<c:forEach items="${emailList}" var="email">
					<tr>						
						<td>
							<input type="checkbox" class="del-check" id="" name="deleteCheck" value="${email.emailNo}">				
						</td>
										
						<c:if  test="${listType != 'drafts'}">
						
							<c:if test="${email.emailStarred}">						
								<td>
									<i class="fas fa-star on"></i>
								</td>						
							</c:if>
						
							<c:if test="${!email.emailStarred}">
								<td>
									<i class="fas fa-star"></i>
								</td>
							</c:if>
						
							<c:if test="${listType == 'inbox'}">
								<th>
									from : ${email.id}
								</th>
							</c:if>
							
							<c:if test="${listType == 'sent' && email.recipient != null}">
								<th>
									To : ${email.recipient}
								</th>
							</c:if>
							
							<c:if test="${listType == 'sent' && email.recipient == null}">
								<th>
									To : ${email.externalRecipient}
								</th>
							</c:if>
						
							<td>
								<a href="${pageContext.request.contextPath}/email/detail?emailNo=${email.emailNo}&listType=${listType}&id=<sec:authentication property="principal.id"/>">${email.subject}</a>
							</td>
							
							<td>
								<fmt:formatDate value="${email.time}" pattern="yy/MM/dd HH:mm:ss"/>
							</td>
						</c:if>
						
						<c:if  test="${listType == 'drafts'}">
						
							<th></th>
							<th></th>
							
							<c:if test="${email.recipient != null}">
								<th>
									To : ${email.recipient}
								</th>
							</c:if>
							
							<c:if test="${email.recipient == null}">
								<th>
									To : 임시이메일
								</th>
							</c:if>
							
							<td>
								<a href="${pageContext.request.contextPath}/email/draftDetail?emailNo=${email.emailNo}" class="subject-a">${email.subject}</a>
							</td>
							
							<td>
								<fmt:formatDate value="${email.time}" pattern="yy/MM/dd HH:mm:ss"/>
							</td>

						</c:if>
						
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</form>
	<nav aria-label="Page navigation example">
		${pageBar}
	</nav>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

