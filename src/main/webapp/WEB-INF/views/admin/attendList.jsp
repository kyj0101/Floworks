<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/attendList.css">

<section>
<div id="board-list">
	<!-- 직원 근태 목록 -->
	<table class="table table-striped table-centered mb-0">
        <thead>
            <tr>
            	<th scope="col" class="table-id">ID</th>
	           	<th scope="col" class="table-day">일자</th>
	           	<th scope="col" class="table-officeIn">출근 시간</th>
	           	<th scope="col" class="table-officeOff">퇴근 시간</th>
	           	<th scope="col" class="table-latenessYn">지각 여부</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${attendList != null}">
        	<c:forEach items="${attendList}" var="attendList">
        	<tr data-no="${attendList.id}">
        		<td>${attendList.id}</td>
        		<td>${attendList.day}</td>
        		<td>${attendList.officeIn}</td>
        		<td>${attendList.officeOff}</td>
        		<td>${attendList.latenessYn}</td>
        	</tr>
        	</c:forEach>
        </c:if>
        </tbody>
    </table>
<<<<<<< HEAD
    
    <br>
    ${pageBar}
</div>
</section>
=======
	</section>
	
	<script>
	
	</script>
>>>>>>> branch 'master' of https://github.com/kyj0101/Floworks.git
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>