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

	<section>
a
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
	        <c:if test="${list != null}">
              <c:forEach items="${list}" var="users">
              	<c:if test="${loginId.workspaceId eq users.workspaceId}"> 
				<tr data-no="${users.postNo}">
					<td>${users.id}</td>
					<td>${users.name}</td>
					<td>${users.depart}</td>
					<td>${users.position}</td>
					<td><fmt:formatDate value="${users.hireDate}" pattern="yy/MM/dd"/></td>
					<td>${users.resignYN}</td>
				</tr>
				</c:if>
			  </c:forEach>
		    </c:if>
	        </tbody>
	    </table>
	    
	</div>
<<<<<<< HEAD

	
<section>
<!-- 직원 목록 관리 창 -->
<div class="page-header" >
    <h1>직원 정보 조회</h1>
    <hr class="my-4">
</div>

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
        <c:if test="${list != null}">
             <c:forEach items="${list}" var="users">
             	<c:if test="${loginId.workspaceId eq users.workspaceId}"> 
			<tr>
				<td>${users.id}</td>
				<td>${users.name}</td>
				<td>${users.depart}</td>
				<td>${users.position}</td>
				<td><fmt:formatDate value="${users.hireDate}" pattern="yy/MM/dd"/></td>
				<td>${users.resignYN}</td>
			</tr>
			</c:if>
		  </c:forEach>
	    </c:if>
        </tbody>
    </table>
</div>

</section>
=======

	</section>
>>>>>>> branch 'master' of https://github.com/kyj0101/Floworks.git
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>