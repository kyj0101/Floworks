<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/mainHeader.jsp">
<jsp:param value="로그인" name="title"/>
</jsp:include>

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<div class="container-fluid">
	<div class="row no-gutter">
		<div class="col-md-8 col-lg-6">
			<div class="login d-flex align-items-center py-5">
				<div class="container">
					<div class="row">
						<div class="col-md-9 col-lg-8 mx-auto">

							<h3 class="login-heading mb-4">안녕하세요!</h3>

							<form:form method="POST"
								action="${pageContext.request.contextPath }/login">

								<div class="form-label-group">

									<input type="text" id="inputEmail" name="username" class="form-control" placeholder="ID" required> 
									<label for="inputEmail">ID</label>
								</div>

								<div class="form-label-group">

									<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
									<label for="inputPassword">Password</label>

								</div>

								<div class="custom-control custom-checkbox mb-3">

									<input type="checkbox" class="custom-control-input" id="customCheck1" name="remember-me"> 									
									<label class="custom-control-label" for="customCheck1">로그인 상태 유지</label>

								</div>

								<button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">
									Sign in
								</button>
								
								<div class="text-center">
									<a class="small" href="${pageContext.request.contextPath }/find/password">비밀번호를 잊으셨나요?</a>
								</div>

							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
