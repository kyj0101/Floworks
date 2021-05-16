<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<!-- ckeditor-->
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>


<!-- jquery autoComplete -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/email/emailCompose.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailCompose.css" />

<section>
<form action="${pageContext.request.contextPath}/email/send" method="POST" id="send-form" enctype="multipart/form-data">
		<div class="input-div">
			<div class="email-input-div">

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					<span>','로 수신자를 여러명 선택할 수 있습니다.(최대 5명)</span>

				<div class="email-btn-div">

					<button type="button" class="btn btn-outline-secondary" id="btn-cc">
						참조
					</button>

					<button type="button" class="btn btn-outline-secondary" id="btn-bcc">
						숨은 참조
					</button>

					<button type="button" class="btn btn-outline-secondary" id="btn-save">
						임시 저장
					</button>

					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary file-del-btn file1">파일1삭제</button>
						<button type="button" class="btn btn-secondary file-del-btn file2">파일2삭제</button>
						<button type="button" class="btn btn-secondary file-del-btn file3">파일3삭제</button>
					</div>

				</div>

				<div class="input-group">
					<p class="input-group-text">작성자</p>
					<input type="text" class="form-control" name="id"
						aria-describedby="addon-wrapping"
						value="<sec:authentication property="principal.id"/>" readOnly>
				</div>

				<div class="input-group">
					<p class="input-group-text">수신자</p>
					<input type="search"
						class="form-control recipient-input required-recipient-input"
						name="recipient" aria-describedby="addon-wrapping">
				</div>

				<div class="input-group cc-div" id="cc">
					<p class="input-group-text">참조</p>
					<input type="search" class="form-control recipient-input"
						name="emailCC" aria-label="Username"
						aria-describedby="addon-wrapping">
				</div>

				<div class="input-group bcc-div" id="bcc">
					<p class="input-group-text">숨은 참조</p>
					<input type="search" class="form-control recipient-input "
						name="emailBCC" aria-label="Username"
						aria-describedby="addon-wrapping">
				</div>

				<div class="input-group">
					<p class="input-group-text">외부 이메일</p>
					<input type="text" class="form-control required-recipient-input"
						aria-label="Username" name="externalRecipient"
						aria-describedby="addon-wrapping">
				</div>

				<div class="input-group">
					<p class="input-group-text">제목</p>
					<input type="text" class="form-control"
						name="subject" aria-label="Username" value="제목 없음"
						aria-describedby="addon-wrapping">
				</div>


				<div class="input-group file-div">

					<label class="custom-file-label file1" for="file1">
						파일을 첨부하세요.
					</label> 
					<input type="file" class="custom-file-input file-input" id="file1" name="uploadFile">
					<hr />

				</div>

				<div class="input-group file-div">

					<label class="custom-file-label file2" for="file2">파일을
						첨부하세요.</label> <input type="file" class="custom-file-input file-input"
						id="file2" name="uploadFile">
					<hr />

				</div>

				<div class="input-group file-div">

					<label class="custom-file-label file3" for="file3">파일을
						첨부하세요.</label> <input type="file" class="custom-file-input file-input"
						id="file3" name="uploadFile">
					<hr />

				</div>

				<input type="hidden" name="fileNo" value="0" />

			</div>

		</div>

		<div class="email-compose-div">
			<textarea name="emailContent" class="textarea"></textarea>
			<div class="btn-div">
				<button type="button" class="btn btn-secondary btn-lg"
					onclick="history.back();">취소</button>
				<button type="button" class="btn btn-primary btn-lg" id="send-btn">보내기</button>
			</div>

		</div>
	</form>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/email/emailCommonScript.jsp"></jsp:include>
