<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="근태 목록" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/attendList.css">


<section>
<div id="board-list">
	<div class=" attendance-search-div">
		<form:form action="${pageContext.request.contextPath}/admin/attend/search" method="get">
			<input type="hidden" name="workspaceId" value="<sec:authentication property="principal.workspaceId"/>" />
			
			<div class="col-md-2 mb-3">
			
		      <select class="custom-select attendance-select" name="year"  id="validationTooltip04">
		       	<option value="" selected>선택 안함</option>
		       		
		        <c:forEach items="${yearList}" var="year">
		        	<option  value="${year}">${year}년</option>
				</c:forEach>
				
		      </select>
		    </div>
		    
			<div class="col-md-2 mb-3">
		      <select class="custom-select attendance-select"  name="month" id="validationTooltip04" >
		      	
		      	<option value="" selected>월</option>
		      	
		       	<c:forEach items="${monthList}" var="month">
					<option value="${month}">${month}월</option>
				</c:forEach>
				
		      </select>
		    </div>
		    
		    <div class="col-md-2 mb-3">
		      <select class="custom-select attendance-select" name="day" id="validationTooltip04">
		      		
		      		<option value="" selected>일</option>
		      		
		      		<c:forEach var="day" begin="1" end="31">
		      			<option value="${day}">${day}일</option>
					</c:forEach>
					
		      </select>
		    </div>
		    <div class="col-md-3 mb-3">
		      <input type="text" name="id" class="form-control" placeholder="아이디"/>
		    </div>
		    
			<button type="submit" class="btn btn-primary attendance-search-btn">검색</button>
	    </form:form>
	</div>
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
        	<tr data-no="${attendList.id}" class="attendance-tr">
        		<td>${attendList.id}</td>
        		<td><fmt:formatDate value="${attendList.day}" pattern="yy-MM-dd"/></td>        		
        		<td>${attendList.officeIn}</td>
        		<td>${attendList.officeOff}</td>
        		<td>${attendList.latenessYn == 'N' ? 'X' : 'O'}</td>
        	</tr>
        	</c:forEach>
        </c:if>
        </tbody>
    </table>
    <br>
    ${pageBar}
</div>
</section>

<script>
$(".attendance-tr").click(function(){
	
	const children = $(this).children();
	const id = $(children[0]).text();
	const day = $(children[1]).text();
	
	location.href=`${pageContext.request.contextPath}/admin/attend/detail?id=\${id}&day=\${day}`;
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>