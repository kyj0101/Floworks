<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<!-- 직원 근태 목록 -->
		<div class="page-header" >
		    <h1>직원 근태 조회</h1>
		    <hr class="my-4">
		</div>
		
		<table class="table table-striped table-centered mb-0">
        <thead>
            <tr>
            	<th scope="col" class="table-id">ID</th>
	           	<th scope="col" class="table-depart">일자</th>
	           	<th scope="col" class="table-positon">출근 시간</th>
	           	<th scope="col" class="table-hire">퇴근 시간</th>
	           	<th scope="col" class="table-resignYN">지각 여부</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="">
        	<c:forEach items="${ }" var="">
        	<tr data-no="${ }">
        		<td></td>
        		
        	</tr>
        	</c:forEach>
        </c:if>
        </tbody>
    </table>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>