<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailList.css" />

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<section>
	<div class="search-div d-flex flex-row-reverse bd-highlight">
		<button type="button" class="btn btn-primary">삭제</button>
	</div>
	<div>
		<table class="table email-table">
			<tbody>
				<c:forEach items="${emailList}" var="email">
					<tr>
						<td>
							<input type="checkbox" name="" id="">
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
								<a href="${pageContext.request.contextPath}/email/draftDetail?emailNo=${email.emailNo}">${email.subject}</a>
							</td>

						</c:if>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>