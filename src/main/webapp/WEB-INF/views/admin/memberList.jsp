<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/memberList.css">
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
=======
	
    <table class="table table-striped table-centered mb-0">
        <thead>
            <tr>
            	<th>ID</th>
                <th>직원명</th>
                <th>부서</th>
                <th>직급</th>
                <th>연락처</th>
                <th>주소</th>
                <th>입사일</th>
                <th>퇴사일</th>
                <th>퇴사여부</th>
                
            </tr>
        </thead>
        <tbody>
            <%-- <%
		        for( memberList member : memberList){
		    %>  
	        <tr>
	            <td><%=memberList.getId() %></td>
	            <td><%=memberList.getPassword() %></td>
	            <td><%=memberList.getName() %></td>
	            <td><%=memberList.getGender() %></td>
	            <td><%=memberList.getBirthyy() %></td>
	            <td><%=memberList.getMail1() %></td>
	            <td><%=memberList.getPhone() %></td>
	            <td><%=memberList.getAddress() %></td>
	            <td><%=memberList.getReg() %></td>
	        </tr>
		    <%} %> --%>

        </tbody>
    </table>
>>>>>>> branch 'master' of https://github.com/kyj0101/Floworks.git
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>