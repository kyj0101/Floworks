<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="워크스페이스 비밀번호 변경하기" name="title"/>
</jsp:include>



   
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/workspacePw.css" />

<section>

<div class="container-fluid  justify-content-center" id="updateWsPwfom">
	<h3 class="login-heading mb-4">워크스페이스 비밀번호 재설정</h5>

	<form:form method="POST" 
				action="${pageContext.request.contextPath }/admin/updateWsPw"
				name="updateWsPw"  >
		<input type="hidden" name="workspaceId" value="<sec:authentication property="principal.workspaceId"/>"/>
        
        <div class="pw">
			<input type="password"  class="form-control" id="originalPassword" name="originalPassword" placeholder="현재 비밀번호" required> 
		</div>
		            
		<div class="pw">
			<input type="password"  class="form-control" id="password" name="password" placeholder="새로운 비밀번호" required> 
		</div>

		<div class="ckpw">
			<input type="password"  class="form-control" id="passwordCheck" placeholder="비밀번호 확인" required>
		</div>
		<div class="row justify-content-center">
		<input type="submit" id="updateWsPwBtn" class="btn btn-primary" value="변경하기" >
		</div>
	</form:form>





</div>





</section>

<script>
$("#passwordCheck").blur(function(){
	var $password = $("#password"), $passwordCheck = $("#passwordCheck");
	if($password.val() != $passwordCheck.val()){
		alert("비밀번호가 일치하지 않습니다.");
		$password.select();
	}
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>