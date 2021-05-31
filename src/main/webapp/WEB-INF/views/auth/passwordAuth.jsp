<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/mainHeader.jsp">
<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.js" integrity="sha512-Kdp1G1My+u1wTb7ctOrJxdEhEPnrVxBjAg8PXSvzBpmVMfiT+x/8MNua6TH771Ueyr/iAOIMclPHvJYHDpAlfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js" integrity="sha512-tL4PIUsPy+Rks1go4kQG8M8/ItpRMvKnbBjQm4d2DQnFwgcBYRRN00QdyQnWSCwNMsoY/MfJY8nHp2CzlNdtZA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>

<div class="container-fluid">
	<div class="row no-gutter">
		<div class="col-md-8 col-lg-6">
			<div class="login d-flex align-items-center py-5">
				<div class="container">
					<div class="row">
						<div class="col-md-9 col-lg-8 mx-auto">
							
							<h5 class="login-heading mb-4">변경할 비밀번호를 입력하세요.</h5>

							<form:form method="POST" action="${pageContext.request.contextPath }/find/password/update">
								
								<input type="hidden" name="id" value="${id}" />
								
								<input type="hidden" name="authKey" value="${authKey}" />
								
								<div class="form-label-group">
									<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password">
									<label for="inputPassword">비밀 번호</label>
									<p class="input-warning">잘못된 비밀번호 입니다.</p>
								</div>
				
								<div class="form-label-group">
									<input type="password" id="inputConfirmPassword" class="form-control" placeholder="Password">
									<label for="inputConfirmPassword">비밀 번호 확인</label>
									<p class="input-warning">비밀번호가 일치하지 않습니다.</p>
								</div>

								<button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">
									비밀번호 변경
								</button>
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
$(".btn").click(function(){
	
	if(!inputNullCheck() || !warningCheck()){
		return false;
	
	}else{
		return true;
	}
});
</script>