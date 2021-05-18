<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/common/mainHeader.jsp"></jsp:include>

<!-- css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/createWorkspace.css">

<section>
	<div class="register-div">
		<div class="card-body">
			<h4 class="card-title text-center">워크스페이스 입장</h4>
			<form class="form-signin">

				<div class="box" style="background: #BDBDBD;">
					<img class="profile"
						src="/Images/workspace/pexels-flo-dahm-699459.jpg">
				</div>


				<div class="form-label-group">
					<input type="text" id="inputConfirmPassword" class="form-control"
						placeholder="Password" readonly> <label
						for="inputConfirmPassword">abc123</label>
				</div>

				<div class="form-label-group">
					<input type="password" id="inputConfirmPassword"
						class="form-control" placeholder="Password"> <label
						for="inputConfirmPassword">워크스페이스 비밀번호</label>
					<p class="input-warning">잘못된 비밀번호 입니다.</p>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">직급</label>
					</div>
					<select class="custom-select" id="inputGroupSelect01">
						<option selected>Choose...</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">부서</label>
					</div>
					<select class="custom-select" id="inputGroupSelect01">
						<option selected>Choose...</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>

				<hr>

				<button class="btn btn-lg btn-primary btn-block text-uppercase"
					id="create-btn" type="submit">확인</button>

			</form>
		</div>
	</div>
</section>
</body>
</html>