<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
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
			<a href="#">대표</a>
			<ul>
				<li>
					<a href="#">기획부</a>					
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

<!-- <div id="organization-list"> -->
	<!-- 부서별 직원 리스트 -->
	<%-- <table class="table table-striped table-centered mb-0">
        <thead>
            <tr>
            	<th scope="col" class="table-id">직원명</th>
	           	<th scope="col" class="table-day"></th>
	           	<th scope="col" class="table-officeIn"></th>
	           	<th scope="col" class="table-officeOff"></th>
	           	<th scope="col" class="table-latenessYn"></th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${attendList != null}">
        	<c:forEach items="${attendList}" var="attendList">
        	<tr data-no="${attendList.id}">
        		<td>${attendList.id}</td>
        		<td><fmt:formatDate value="${attendList.day}" pattern="yy-MM-dd"/></td>        		
        		<td>${attendList.officeIn}</td>
        		<td>${attendList.officeOff}</td>
        		<td>${attendList.latenessYn}</td>
        	</tr>
        	</c:forEach>
        </c:if>
        </tbody>
    </table> --%>
    
	<div class="d-flex flex-column align-items-stretch bg-white">
		<div class="list-group list-group-flush border-bottom scrollarea">
			
			<c:forEach items="${memberList}" var="member">
			
				<a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
					<div class="row g-0">
						<div class="col-1">
							<img src="${pageContext.request.contextPath }/resources/upload/profile/${member.profileFileRename}" alt="프로필사진" class="img-circle"
							style="width: 45px; height: 45px; margin: 15px auto; border-radius: 50%;">
						</div>
			
						<div class="col-11">
							<div class="row g-0 mb-4">
		
								<div class="col">
									<strong>Name: </strong> <span>${member.name}</span>
								</div>
								
								<div class="col">
									<strong>부서: </strong> <span>${member.department}</span>
								</div>
								
								<div class="col">
									<strong>직급: </strong> <span>${member.position}</span>
								</div>
		
							</div>
		
							<div class="row g-0 mb-4">
		
								<div class="col">
									<strong>E-mail:</strong> <span>${member.email}</span>
								</div>
								
								<div class="col">
									<strong>ID</strong> <span>${member.id}</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>		
		</div>
	</div>

    
    <br>
    ${pageBar}
<!-- </div> -->

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

