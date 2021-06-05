<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.kh.floworks.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="내 정보 확인" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/organization/organizationChart.css">



<section>
<div class="tree">
    <ul>
		<li>
			<a href="organizationChart?workspace=<sec:authentication property='principal.workspaceId'/>&dept=부">대표</a>
			<ul>
				<li>

					<a href="organizationChart?workspace=<sec:authentication property='principal.workspaceId'/>&dept=기획부">기획부</a>					
				</li>
				<li>
					<a href="#">개발부</a>					
				</li>
				<li>
					<a href="#">총무부</a>					
				</li>
				<li>
					<a href="#">국내영업부</a>					
				</li>
				<li>
					<a href="#">마케팅부</a>					
				</li>
				<li>
					<a href="#">회계관리부</a>
				</li>
			</ul>
		</li>
	</ul>
</div>
<!-- 부서별 직원 리스트 -->
<div id="organization-list">
	<table class="table table-striped table-hover table-centered mb-0">
        <thead>
          <tr>
            <th scope="col" class="table-id">ID</th>
            <th scope="col" class="table-name">직원명</th>
            <th scope="col" class="table-depart">부서</th>
            <th scope="col" class="table-positon">직급</th>
          </tr>
        </thead>
           
        <tbody>
        <c:if test="${userList != null}">
			<c:forEach items="${userList}" var="users">
        	<c:if test="${loginId.workspaceId eq users.workspaceId}">
        	<tr data-no="${users.id}">
				<td>${users.id}</td>
				<td>${users.name}</td>
				<td>${users.departmentName}</td>
				<td>${users.position}</td>
			</tr>
        	</c:if>
			</c:forEach>
	    </c:if>
	    
        </tbody>
    </table>
    
    <br>
    ${pageBar}
</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

