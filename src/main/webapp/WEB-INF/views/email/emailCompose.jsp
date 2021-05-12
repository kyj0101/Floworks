<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<!-- ckeditor-->
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

<!-- js -->
<script src="/resources/js/email/emailCompose.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailList.css" />

<section>
	<div class="input-div">
		<div class="email-input-div">

			<div class="input-group">
				<p class="input-group-text">작성자</p>
				<input type="text" class="form-control"
					aria-describedby="addon-wrapping" value="abc123">
			</div>

			<div class="input-group">
				<p class="input-group-text">수신자</p>
				<input type="text" class="form-control"
					aria-describedby="addon-wrapping" value="abc123">
			</div>

			<div class="input-group cc-div" id="cc">
				<p class="input-group-text">참조</p>
				<input type="text" class="form-control" placeholder="Username"
					aria-label="Username" aria-describedby="addon-wrapping">
			</div>

			<div class="input-group bcc-div" id="bcc">
				<p class="input-group-text">외부 참조</p>
				<input type="text" class="form-control" placeholder="Username"
					aria-label="Username" aria-describedby="addon-wrapping">
			</div>

			<div class="input-group">
				<p class="input-group-text">외부 이메일</p>
				<input type="text" class="form-control" placeholder="Username"
					aria-label="Username" aria-describedby="addon-wrapping">
			</div>

			<div class="input-group">
				<p class="input-group-text">제목</p>
				<input type="text" class="form-control" placeholder="Username"
					aria-label="Username" aria-describedby="addon-wrapping">
			</div>

			<div class="input-group">
				<p class="input-group-text">파일 첨부</p>
				<input type="text" class="form-control" placeholder="Username"
					aria-label="Username" aria-describedby="addon-wrapping">
			</div>
		</div>

		<div class="email-btn-div">
			<button type="button" class="btn btn-outline-secondary" id="btn-cc">참조</button>
			<button type="button" class="btn btn-outline-secondary" id="btn-bcc">숨은
				참조</button>
			<button type="button" class="btn btn-outline-secondary">
				<i class="fas fa-share"></i>
			</button>
		</div>
		
	</div>
	
	<div class="email-compose-div">
		<textarea name="editor1" class="textarea"></textarea>
		<div class="btn-div">
			<button type="button" class="btn btn-secondary btn-lg">취소</button>
			<button type="button" class="btn btn-primary btn-lg">보내기</button>
		</div>
		
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>