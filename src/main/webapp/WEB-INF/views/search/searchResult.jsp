<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="검색결과" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search/searchResult.css">

<section>
<div class="list-group">
	<c:if test="${postList != null}">
		<c:forEach items="${postList}" var="post">
			<a href="${pageContext.request.contextPath}/board/boardView?postNo=${post.postNo}" class="list-group-item list-group-item-action">
				<div class="d-flex w-100 justify-content-between">
					<h5 class="mb-1">${post.postTitle}</h5>
					<small>
						<fmt:formatDate value="${post.postDate}" pattern="yy/MM/dd HH:mm:ss"/>
					</small>
				</div>
				<p class="mb-1">${post.postContent}</p>
				<small>${post.name} ${post.id} [ ${post.departmentName} ]</small>
			</a>
		</c:forEach>
	</c:if>

		<c:if test="${emailSentList != null}">
			<c:forEach items="${emailSentList}" var="email">
				<a href="${pageContext.request.contextPath}/email/detail?emailNo=${email.emailNo}&listType=sent&id=<sec:authentication property='principal.id'/>"
					class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">${email.subject}</h5>
						<small>
							<fmt:formatDate value="${email.time}" pattern="yy/MM/dd HH:mm:ss"/>
						</small>
					</div>
					<small> 
						수신자 : ${email.recipient == null ? "없음" : email.recipient} | 
						외부수신자 : ${email.externalRecipient == null ? "없음" : email.externalRecipient}
						<br /> 
						CC : ${email.emailCC == null ? "없음" : email.emailCC} | 
						BCC : ${email.emailBCC == null ? "없음" : email.emailBCC}
					</small>
				</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${emailInboxList != null}">
			<c:forEach items="${emailInboxList}" var="email">
				<a href="${pageContext.request.contextPath}/email/detail?emailNo=${email.emailNo}&listType=inbox&id=<sec:authentication property='principal.id'/>"
					class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">${email.subject}</h5>
						<small>
							<fmt:formatDate value="${email.time}" pattern="yy/MM/dd HH:mm:ss"/>
						</small>
					</div>
					<small> 
						수신자 : ${email.id}
					</small>
				</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${postFileList != null}">
			<c:forEach items="${postFileList}" var="postFileMap">
				<a href="${pageContext.request.contextPath}/search/download/post/?fileReName=${postFileMap.postRenamedFileName}&fileOriName=${postFileMap.postOriginalFileName}" class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between ">
						<h5 class="mb-1">${postFileMap.postTitle}</h5>
						<small>
							<fmt:formatDate value="${postFileMap.postDate}" pattern="yy/MM/dd HH:mm:ss"/>
						</small>
					</div>
					<p class="mb-1">
						${postFileMap.postOriginalFileName}
					</p>
					</a>
			</c:forEach>
		</c:if>
		<c:if test="${emailSentFileList != null}">
			<c:forEach items="${emailSentFileList}" var="emailFileMap">
				<li class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">${emailFileMap.subject}</h5>
						<small>
							<fmt:formatDate value="${emailFileMap.time}" pattern="yy/MM/dd HH:mm:ss"/>
						</small>
					</div>
					<div class="w-100 justify-content-between" style="margin:20px 0 20px 0;">
						<a href="${pageContext.request.contextPath}/search/download/email?fileReName=${emailFileMap.fileRenamed1}&fileOriName=${emailFileMap.fileOriginalname1}" >${emailFileMap.fileOriginalname1}</a>
						<br />
						<a href="${pageContext.request.contextPath}/search/download/email?fileReName=${emailFileMap.fileRenamed2}&fileOriName=${emailFileMap.fileOriginalname2}" >${emailFileMap.fileOriginalname2}</a>
						<br />
						<a href="${pageContext.request.contextPath}/search/download/email?fileReName=${emailFileMap.fileRenamed3}&fileOriName=${emailFileMap.fileOriginalname3}" >${emailFileMap.fileOriginalname3}</a>
					</div>
					<small> 
						수신자 : ${emailFileMap.recipient == null ? "없음" : emailFileMap.recipient} | 
						외부수신자 : ${emailFileMap.externalRecipient == null ? "없음" : emailFileMap.externalRecipient}
						<br /> 
						CC : ${emailFileMap.emailCC == null ? "없음" : emailFileMap.emailCC} | 
						BCC : ${emailFileMap.emailBCC == null ? "없음" : emailFileMap.emailBCC}
					</small>
				</li>
			</c:forEach>
		</c:if>
		<c:if test="${emailInboxFileList != null}">
			<c:forEach items="${emailInboxFileList}" var="emailFileMap">
				<li  class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">${emailFileMap.subject}</h5>
						<small>
							<fmt:formatDate value="${emailFileMap.time}" pattern="yy/MM/dd HH:mm:ss"/>
						</small>
					</div>
					<div class="w-100 justify-content-between" style="margin:20px 0 20px 0;">
						<a href="${pageContext.request.contextPath}/search/download/email?fileReName=${emailFileMap.fileRenamed1}&fileOriName=${emailFileMap.fileOriginalname1}" >${emailFileMap.fileOriginalname1}</a>
						<br />
						<a href="${pageContext.request.contextPath}/search/download/email?fileReName=${emailFileMap.fileRenamed2}&fileOriName=${emailFileMap.fileOriginalname2}" >${emailFileMap.fileOriginalname2}</a>
						<br />
						<a href="${pageContext.request.contextPath}/search/download/email?fileReName=${emailFileMap.fileRenamed3}&fileOriName=${emailFileMap.fileOriginalname3}" >${emailFileMap.fileOriginalname3}</a>
					</div>
					<small> 
						수신자 : ${emailFileMap.id}
					</small>
				</li>
			</c:forEach>
		</c:if>
	</div>
${pageBar}
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>