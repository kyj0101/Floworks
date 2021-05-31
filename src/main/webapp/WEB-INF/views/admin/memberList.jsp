<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%-- <%
    // User에서 넘긴 회원정보를 추출한다.
    ArrayList<User> memberList = (ArrayList<User>)request.getAttribute("memberList");
%> --%>

<%-- <jsp:param value="근태 조회" name="title"/> --%>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/memberList.css">
	<section>
	<!-- 직원 목록 관리 창 -->
	<div class="page-header" >
	    <h1>직원 정보 조회</h1>
	    <hr class="my-4">
	</div>
	
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
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>