<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="회원 탈퇴" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberDelete.css">

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js"crossorigin="anonymous"></script>

<section>
	 <div class="section-div">
        <div class="del-div" >
            <form:form method="POST" action="${pageContext.request.contextPath }/member/delete">
	            <input type="hidden" name="id" value='<sec:authentication property="principal.id"/>'/>
	            
	            <h3>정말 회원 탈퇴 하시겠습니까?</h3>
	            <h6>회원을 탈퇴하시려면 비밀번호를 입력해주세요.</h6>
	            
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<input type="password" class="form-control" name="password" id="name" placeholder="비밀번호">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<input type="submit" value="탈퇴하기" class="btn btn-primary">
								<div class="submitting"></div>
							</div>
						</div>
					</div>
			</form:form>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>
