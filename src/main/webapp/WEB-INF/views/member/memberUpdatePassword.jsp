<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member/memberUpdatePassword.js"></script>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberUpdatePassword.css">

<section>
	<div class="section-div">
        <div class="del-div" >
            <form:form method="POST" action="${pageContext.request.contextPath }/member/update/password" id="update-password-form">
            	<input type="hidden" name="id" value='<sec:authentication property="principal.id"/>'/>
            	<h3>비밀번호 수정하기</h3>
            	
           		<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control register-form-control" name="original-password" id="name" placeholder="현재 비밀번호">
						</div>
					</div>
						
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control register-form-control" name="password" id="subject" placeholder="변경할 비밀번호">
							<label for="inputPassword">비밀 번호</label>
							<p class="input-warning">잘못된 비밀번호 입니다.</p>
						</div>
					</div>
						
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control register-form-control"  id="inputConfirmPassword" placeholder="비밀번호 확인">
							<label for="inputPassword">비밀 번호</label>
							<p class="input-warning">비밀번호가 일치하지 않습니다.</p>
						</div>
					</div>
					
					<div class="col-md-12">
						<div class="form-group">
							<input type="button" value="변경하기" class="btn btn-primary" id="submit-btn">
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>
