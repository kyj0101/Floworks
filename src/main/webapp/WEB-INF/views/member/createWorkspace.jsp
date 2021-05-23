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
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>

<section>
	<div class="register-div">
		<div class="card-body">
			<h4 class="card-title text-center">워크스페이스 생성하기</h4>
			<form method="POST" action="${pageContext.request.contextPath }/register/workspaceId/insert" class="form-signin" >
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 

				<input type="hidden" name="userId" value="${id}" />
				
				<div class="form-label-group">
					<input type="text" name="workspaceName" id="inputname" class="form-control" placeholder="Password"> 
					<label for="inputname">워크스페이스 이름</label>
					<p class="input-warning">잘못된 이름 입니다.</p>
				</div>

				<div class="form-label-group">
					<input type="text" name="id" id="inputid" class="form-control" placeholder="Password">
					<label for="inputid">워크스페이스 ID</label>
					<p class="input-warning">중복된 아이디 입니다.</p>
				</div>

				<div class="form-label-group">
					<input type="password" name="row-password" id="inputPassword" class="form-control" placeholder="Password">
					<label for="inputPassword">워크스페이스 비밀번호</label>
					<p class="input-warning">잘못된 비밀번호 입니다.</p>
				</div>
				
				<div class="form-label-group">
					<input type="password" id="inputConfirmPassword" class="form-control" placeholder="Password">
					<label for="inputConfirmPassword">비밀번호 확인</label>
					<p class="input-warning">잘못된 비밀번호 입니다.</p>
				</div>

				<hr>

				<button class="btn btn-lg btn-primary btn-block text-uppercase" id="create-btn" type="button">
					워크스페이스 생성
				</button>
			</form>
		</div>
	</div>
</section>
</body>
</html>

<script>
$("input[name=id]").change(function(){
	
	const $input = $("input[name=id]");
	const id = $input.val();
	const warningP = $input.next().next();

	hideWarning(warningP);
	
	if(!idRegExp(id,true)){
		showWarning(warningP, "아이디는 최소 3자리에서 최대 8자리인 영문자와 숫자의 조합이여야 합니다.");
	}
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/register/workspaceId/duplicate",
		data:{"id":id},

		success(result){
			result === "true" && showWarning(warningP, "중복된 아이디 입니다.");
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});
});

$("input[name=workspaceName]").change(function(){
	
	const $input = $("input[name=workspaceName]");
	const name = $input.val();
	const warningP = $input.next().next();

	hideWarning(warningP);
	
	if(name.length < 2 || name.length > 20){
		showWarning(warningP, "워크스페이스 이름은 최소 2글자 최대 20글자 입니다.");
	}

});

$("#create-btn").click(function(){
	
	if(!inputNullCheck() || !warningCheck()){
		return false;
	
	}else{
		
		$(".form-signin").submit();
	}
});
</script>