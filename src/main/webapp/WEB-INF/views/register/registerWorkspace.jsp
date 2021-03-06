<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<jsp:include page="/WEB-INF/views/common/mainHeader.jsp"></jsp:include>

<!-- css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/createWorkspace.css">

<!-- js -->   
<script src="${pageContext.request.contextPath }/resources/js/member/profileThumbnail.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>

<section>
	<div class="register-div">
		<div class="card-body">
			<h4 class="card-title text-center">워크스페이스 입장</h4>
			<form action="${pageContext.request.contextPath }/register/workspace/member/insert" method="post" class="form-signin" enctype="multipart/form-data">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								
				<input type="hidden" name="id" value="${id}" />
				
				<div class="box" style="background: #BDBDBD;">
					<img class="profile" src="">
				</div>


				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">Upload</span>
					</div>
					<div class="custom-file">
						<input type="file" name="profile" class="custom-file-input" id="file01">
						<label class="custom-file-label" for="file01">프로필 이미지를 선택하세요.</label>
					</div>
				</div>

				<div class="form-label-group">
					<c:if test="${workspaceId != null}">
						<input type="text" name="workspaceId" class="form-control" placeholder="workspaceid" value="${workspaceId}" readonly>
					</c:if>
					
					<c:if test="${workspaceId == null}">
						<input type="text" id="workspaceId" name="workspaceId" class="form-control" placeholder="workspaceid" value="" >
						<label for="workspaceId">워크스페이스 ID</label>
						<p class="input-warning">잘못된 아이디 입니다.</p>
					</c:if>
				</div>

				<div class="form-label-group">
					<input type="password" name="password" id="inputpassword" class="form-control register-form-control" placeholder="Password"> 
					<label for="inputpassword">워크스페이스 비밀번호</label>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">부서</label>
					</div>
					<select class="custom-select" id="inputGroupSelect01" name="departmentCode">
						
						<option selected class="department-default" >부서를 선택하세요.</option>
						
						<c:forEach items="${deptList}" var="dept">
						
							<option value="${dept.departmentCode}">${dept.departmentName}</option>
							
						</c:forEach>
	
					</select>
				</div>
	
				<div class="input-group mb-3">
					
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">직급</label>
					</div>
						
					<select class="custom-select" id="inputGroupSelect01" class="position" name="position">
						<option selected class="position-default">직급을 선택하세요.</option>			
						
						<c:if test="${owner == id}">
							<option selected>대표</option>
						</c:if>
						
						<c:if test="${owner != id}">
						
							<c:forEach items="${positionList}" var="position">
								<option>${position}</option>
							</c:forEach>
						
						</c:if>

					</select>
				</div>

				<hr>

				<button class="btn btn-lg btn-primary btn-block text-uppercase" id="submit-btn" type="submit">확인</button>
			</form>
		</div>
	</div>
</section>
</body>
</html>

<script>

$("#submit-btn").click(function(){
	
	if($("input[name=password]").val() === ""){
		alert("비밀번호를 입력하세요.");
		
	}else if($("input[name=password]").val() === "" || $(".input-warning").css("display") === "block"){
		alert("올바른 워크스페이스 ID를 입력하세요.");
	
	}else if($(".department-default:selected").length == 1){
		alert("부서를 선택하세요.");
		
	}else if($(".position-default:selected").length == 1){
		alert("직급을 선택하세요.");
		
	}else{
		return true;
	}
	
	return false;
});

$("input[name=workspaceId]").change(function(){
	
	const $input = $("input[name=workspaceId]");
	const workSpaceId = $input.val();
	const warningP = $input.next().next();
	console.log(warningP);
	hideWarning(warningP);

	if (!idRegExp(workSpaceId, true)) {
		showWarning(warningP, "잘못된 워크스페이스 아이디 입니다.");
	}
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/register/workspace/exist",
		data:{"workSpaceId":workSpaceId},

		success(result){
			result === "false" && showWarning(warningP, "존재하지 않는 워크스페이스 ID 입니다.");
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});
});

</script>