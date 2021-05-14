<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/mainHeader.jsp"></jsp:include>

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>

<section>
	<div class="register-div">
		<div class="card-body">
			<h4 class="card-title text-center">회원가입</h4>
			<form class="form-signin">

				<div class="form-label-group">
					<input type="text" id="inputUserame" class="form-control"
						placeholder="Username"> <label for="inputUserame">아이디</label>
					<p class="input-warning">중복된 아이디 입니다.</p>
				</div>

				<div class="form-label-group">
					<input type="email" id="inputEmail" class="form-control"
						placeholder="Email address"> <label for="inputEmail">이메일</label>
					<p class="input-warning">잘못된 이메일 입니다.</p>
				</div>

				<hr>

				<div class="form-label-group">
					<input type="password" id="inputPassword" class="form-control"
						placeholder="Password"> <label for="inputPassword">비밀
						번호</label>
					<p class="input-warning">잘못된 비밀번호 입니다.</p>
				</div>

				<div class="form-label-group">
					<input type="password" id="inputConfirmPassword"
						class="form-control" placeholder="Password"> <label
						for="inputConfirmPassword">비밀 번호 확인</label>
					<p class="input-warning">비밀번호가 일치하지 않습니다.</p>
				</div>

				<hr>

				<div class="form-label-group">
					<input type="tel" id="inputuserame" class="form-control"
						placeholder="Username"> <label for="inputuserame">전화
						번호</label>
					<p class="input-warning">잘못된 전화번호 입니다.</p>
				</div>

				<div class="form-label-group">
					<input type="text" id="input-email" class="form-control"
						placeholder="Email address"> <label for="input-email">주소</label>
					<p class="input-warning">잘못된 주소 입니다.</p>
				</div>

				<hr>

				<div class="form-label-group workspace-div">
					<input type="text" id="input-workspace" class="form-control"
						placeholder="Password"> <label for="input-workspace">워크스페이스ID</label>
					<p class="input-warning">존재하지 않는 워크스페이스 ID입니다.</p>
				</div>

				<hr>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckIndeterminate"> <label
						class="form-check-label" for="flexCheckIndeterminate">
						워크스페이스 생성하기 </label>
					<hr>
				</div>

				<button class="btn btn-lg btn-primary btn-block text-uppercase"
					type="submit">Register</button>
				<a class="d-block text-center mt-2 small" href="#">Sign In</a>
				<hr class="my-4">
				<button class="btn btn-lg btn-google btn-block text-uppercase"
					type="submit">
					<i class="fab fa-google mr-2"></i> Sign up with Google
				</button>
				<button class="btn btn-lg btn-facebook btn-block text-uppercase"
					type="submit">
					<i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook
				</button>

			</form>
		</div>
	</div>
</section>
</body>
</html>