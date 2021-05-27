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

<section>
<div class="list-group">
	<c:if test="${postList != null}">
		<c:forEach items="${postList}" var="post">
			<a href="${pageContext.request.contextPath}/board/boardView?postNo=${post.postNo}" class="list-group-item list-group-item-action">
				<div class="d-flex w-100 justify-content-between">
					<h5 class="mb-1">${post.postTitle}</h5>
					<small>${post.postDate}</small>
				</div>
				<p class="mb-1">${post.postContent}</p>
				<small>${post.name} ${post.id} [ ${post.departmentName} ]</small>
			</a>
		</c:forEach>
	</c:if>
</div>
${pageBar}
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>