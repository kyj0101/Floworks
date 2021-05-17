<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<jsp:include page="/WEB-INF/views/common/mainHeader.jsp"></jsp:include>

<!-- css -->        
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/createWorkspace.css">

<!-- js -->   
<script src="${pageContext.request.contextPath }/resources/js/member/createWorkspace.js"></script>

<section>
	<div class="register-div">
		<div class="card-body">
			<h4 class="card-title text-center">워크스페이스 생성하기</h4>
			<form class="form-signin">

				<div class="box" style="background: #BDBDBD;">
					<img class="profile"
						src="${pageContext.request.contextPath }/resources/images/workspaceSample.jpg">
				</div>

				<div class="container">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Upload</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="file01">
							<label class="custom-file-label" for="file01">워크스페이스 프로필
								이미지를 선택하세요.</label>
						</div>
					</div>

					<div class="form-label-group">
						<input type="text" id="inputConfirmPassword" class="form-control"
							placeholder="Password"> <label for="inputConfirmPassword">워크스페이스
							이름</label>
						<p class="input-warning">잘못된 이름 입니다.</p>
					</div>

					<div class="form-label-group">
						<input type="text" id="inputPassword" class="form-control"
							placeholder="Password"> <label for="inputPassword">워크스페이스
							ID</label>
						<p class="input-warning">중복된 아이디 입니다.</p>
					</div>

					<div class="form-label-group">
						<input type="password" id="inputConfirmPassword"
							class="form-control" placeholder="Password"> <label
							for="inputConfirmPassword">워크스페이스 비밀번호</label>
						<p class="input-warning">잘못된 비밀번호 입니다.</p>
					</div>

					<hr>

					<button class="btn btn-lg btn-primary btn-block text-uppercase"
						id="create-btn" type="submit">워크스페이스 생성</button>
			</form>
		</div>
	</div>
</section>
</body>
</html>