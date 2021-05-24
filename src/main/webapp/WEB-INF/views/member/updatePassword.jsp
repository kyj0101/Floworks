<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>비밀번호 수정</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/updatePassword.css">

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js"crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section>
	<div class="section-div">
        <div class="del-div" >
            <form method="POST" id="updatePwdFrm" name="updatePwdFrm"
            class="updatePwdFrm">
            <h1>비밀번호 수정하기</h1>
           	<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="name"
								placeholder="현재 비밀번호">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="변경할 비밀번호">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="비밀번호 확인">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="button" value="변경하기" class="btn btn-primary">
							<div class="submitting"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
</section>

<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>
