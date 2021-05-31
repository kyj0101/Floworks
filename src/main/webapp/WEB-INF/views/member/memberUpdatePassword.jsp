<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>비밀번호 수정</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/updatePassword.css">

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js"crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section>
	<div class="section-div">
        <div class="del-div" >
            <form:form method="POST" action="">
            	<h3>비밀번호 수정하기</h3>
           		<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="password" id="name" placeholder="현재 비밀번호">
						</div>
					</div>
						
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="update-password" id="subject" placeholder="변경할 비밀번호">
							<p class="input-warning">잘못된 비밀번호 입니다.</p>
						</div>
					</div>
						
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="subject id="subject" placeholder="비밀번호 확인">
							<p class="input-warning">비밀번호가 일치하지 않습니다.</p>
						</div>
					</div>
					
					<div class="col-md-12">
						<div class="form-group">
							<input type="button" value="변경하기" class="btn btn-primary">
							<div class="submitting"></div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>
