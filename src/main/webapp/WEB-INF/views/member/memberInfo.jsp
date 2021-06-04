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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberInfo.css">

<!-- js -->   
<script src="${pageContext.request.contextPath }/resources/js/member/profileThumbnail.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>


<section>
	<div class="card-container">
		<div class="card">
			<div class="card-header">워크스페이스 정보</div>
			<div class="card-body">
				<h5 class="card-title">${workspaceInfoMap.name}</h5>
				<p class="card-text">아이디 : ${workspaceInfoMap.workspaceId}</p>
				<p class="card-text">관리자 : ${workspaceInfoMap.owner}</p>
			</div>
		</div>
		<div class="card">
			<div class="card-header">내 사내 정보</div>
			<div class="card-body">
				<h5 class="card-title">${member.id}</h5>
				<p class="card-text">부서 : ${member.department}</p>
				<p class="card-text">직급 : ${member.position}</p>
				<p class="card-text">입사일 :<fmt:formatDate value="${member.hireDate}" pattern="yy/MM/dd"/> </p>
			</div>
		</div>
	</div>
	<div class="info-btn-div">
		<button type="button" class="btn btn-primary admin-email-btn" onclick="location.href='${pageContext.request.contextPath}/email/compose?defaultRecipient=${workspaceInfoMap.owner}'">관리자에게 문의하기</button>
	</div>
	
</section>


<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>

