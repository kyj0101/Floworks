<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- websocket -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.js" integrity="sha512-Kdp1G1My+u1wTb7ctOrJxdEhEPnrVxBjAg8PXSvzBpmVMfiT+x/8MNua6TH771Ueyr/iAOIMclPHvJYHDpAlfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js" integrity="sha512-tL4PIUsPy+Rks1go4kQG8M8/ItpRMvKnbBjQm4d2DQnFwgcBYRRN00QdyQnWSCwNMsoY/MfJY8nHp2CzlNdtZA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/auth/styles.css" />

</head>
<body>

<div class="masthead">
	<div class="masthead-content text-white">
		<div class="container-fluid px-4 px-lg-0">
			<h1 class=" lh-1 mb-4"
				style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;">Floworks</h1>
			<p class="mb-5 info-p">아래 버튼을 눌려 이메일 인증을 완료하세요.</p>
			<div class="input-group input-group-newsletter">
				<button id="btn" type="button"
					class="btn btn-light btn-lg justify-content-center"
					style="width: 230px; margin: 0 auto;">인증하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>




<script>
$(function(){
	
	
	$("#btn").click(function(){

		const csrfHeaderName = "${_csrf.headerName}";
		const csrfTokenValue = "${_csrf.token}";

		const authKey = "${authKey}";
		const email = "${email}";

		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath }/register/email/auth/check",
			data:{"email":email, "authKey":authKey},
			
			beforeSend(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			
			success(){
				$(".info-p").text("인증이 완료되었습니다. 창을 닫으셔도 됩니다.");
			},
			error(xhr, status, err){
				alert("잘못된 인증 페이지 입니다.");
			}
		});
	});
});

</script>

