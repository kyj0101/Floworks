<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/mainHeader.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<!-- css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/findPassword.css">

<div class="container-fluid">
	<div class="row no-gutter">
		<div class="col-md-8 col-lg-6">
			<div class="login d-flex align-items-center py-5">
				<div class="container">
					<div class="row">
						<div class="col-md-9 col-lg-8 mx-auto">

							<h5 class="login-heading mb-4">등록된 이메일 주소를 입력하세요.</h5>

							<form:form method="POST" action="${pageContext.request.contextPath }/find/password/send">

								<div class="form-label-group">

									<input type="email" id="inputEmail" name="email" class="form-control register-form-control" placeholder="Password" required>
									<label for="inputEmail">Email</label>
									<p class="input-warning">유효하지 않은 이메일 입니다.</p>
								</div>

								<button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" id="send-btn" type="button">
									이메일 전송
								</button>
								<p class="info-p">* 아이디가 포함된 이메일이 전송됩니다.</p>
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

<script>
$("input[name=email]").change(function(){
	
	const $input = $("input[name=email]");
	const email = $input.val();
	const warningP = $input.next().next();
		
	hideWarning(warningP);
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/find/id/user/email/check",
		data:{"email":email},

		success(result){
			result === "false" && showWarning(warningP, "유효하지 않은 이메일 입니다.");	
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});
});

$("#send-btn").click(function(){
	
	if(!inputNullCheck() || !warningCheck()){
		return false;
	
	}else{
		sendEmail();
	}
});

function sendEmail(){
	
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	const email = $("input[name=email]").val();

	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/find/id/send",
		data:{"email":email},
		dataType : 'text',
		beforeSend(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		
		success(result){
			console.log(result);
			alert(result);
			$("#send-btn").attr("disabled", true);
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
			
	});
}


</script>