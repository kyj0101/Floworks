<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="직원목록 조회" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/memberList.css">

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/admin/userList.js"></script>
<section>

<div id="board-list">
    <table class="table table-striped table-centered mb-0">
        <thead>
             <tr>
               <th scope="col" class="table-id">ID</th>
               <th scope="col" class="table-name">직원명</th>
               <th scope="col" class="table-depart">부서</th>
               <th scope="col" class="table-positon">직급</th>
               <th scope="col" class="table-hire">입사일</th>
               <th scope="col" class="table-resignYN">퇴사여부</th>
             </tr>
           </thead>
           
        <tbody>
        <c:if test="${userList != null}">
             <c:forEach items="${userList}" var="users">
			<tr data-id>
				<td>${users.id}</td>
				<td>${users.name}</td>
				<td>${users.departmentName}</td>
				<td>${users.position}</td>
				<td><fmt:formatDate value="${users.hireDate}" pattern="yy-MM-dd"/></td>
				<c:set var="quit" value="${users.quitYN}" />
				<td>
				<c:choose>
					<c:when test="${quit eq 'false'}">
						근무중
					</c:when>
					
					<c:otherwise>
						퇴사
					</c:otherwise>
					
				</c:choose>
				</td>
				
			</tr>
		  </c:forEach>
	    </c:if>
        </tbody>
    </table>
    
    <br>
    ${pageBar}
</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>