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
                <th>직원번호</th>
                <th>직원명</th>
                <th>부서</th>
                <th>직급</th>
                <th>연락처</th>
                <th>출근 내역</th>
                <th>퇴근 내역</th>
                <th>연차 내역</th>
                
                
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
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>