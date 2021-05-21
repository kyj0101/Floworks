<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>개인정보 수정하기</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberUpdate.css">

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js"crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section>
	<div class="section-div">
		<div class="update-div">
			<form method="POST" id="contactForm" name="contactForm"
				class="contactForm">
				 <h1>개인 정보 수정하기</h1>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="name"
								placeholder="아이디">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="이메일">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="전화번호">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="주소">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="submit" value="수정" class="btn btn-primary">
							<div class="submitting"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>
