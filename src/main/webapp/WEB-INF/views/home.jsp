<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
  
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="home" name="title"/>
</jsp:include>
    
<section>
	<!-- http://bootstrapk.com/components/#page-header -->
	<div class="page-header">
		<h1>공지사항</h1>
		<hr class="my-4">
	</div>

	<sec:authentication property="principal" var="loginId"/>
	<div class="list-group">
	<c:if test="${mainPostList != null}">
	<c:forEach items="${mainPostList}"  begin="0" end="4" var="mPost">
		<c:if test="${loginId.workspaceId eq mPost.workspaceId}">
		<a href="${pageContext.request.contextPath}/board/boardView?postNo=${mPost.postNo}" class="list-group-item list-group-item-action">
			<div class="d-flex w-100 justify-content-between">
				<h5 class="mb-1">${mPost.postTitle}</h5>
				<small><fmt:formatDate value="${mPost.postDate}" pattern="yy/MM/dd"/></small>
			</div>
			<p class="mb-1">${mPost.postContent}</p> 
			<small>${mPost.name} (${mPost.departmentName})</small>
		</a> 
		</c:if>
	</c:forEach>
	</c:if>
	</div>
	
	
	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>