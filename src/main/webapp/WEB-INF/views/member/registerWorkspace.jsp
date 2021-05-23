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
<script src="${pageContext.request.contextPath }/resources/js/member/createWorkspace.js"></script>

<section>
	<div class="register-div">
		<div class="card-body">
			<h4 class="card-title text-center">워크스페이스 입장</h4>
			<form action="${pageContext.request.contextPath }/register/registerWorkspace/insert" method="post" class="form-signin" enctype="multipart/form-data">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								
				<input type="hidden" name="id" value="${id}" />
				
				<div class="box" style="background: #BDBDBD;">
					<img class="profile"
						src="">
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
					<input type="text" name="workSpaceId" class="form-control" placeholder="workspaceid" value="${workSpaceId}" readonly>
				</div>

				<div class="form-label-group">
					<input type="password" name="password" id="inputpassword" class="form-control" placeholder="Password"> 
					<label for="inputpassword">워크스페이스 비밀번호</label>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">부서</label>
					</div>
					<select class="custom-select" id="inputGroupSelect01" name="departmentCode">
						
						<option selected class="department" >부서를 선택하세요.</option>
						
						<c:forEach items="${deptList}" var="dept">
						
							<option value="${dept.departmentCode}">${dept.departmentName}</option>
							
						</c:forEach>
	
					</select>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">직급</label>
					</div>
					<select class="custom-select" id="inputGroupSelect01" name="position">
						
						<option selected class="position">직급을 선택하세요.</option>
						
						<c:forEach items="${positionList}" var="position">
						
							<option>${position}</option>
							
						</c:forEach>
					
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
	
	}else if($(".department:selected").length >= 1){
		alert("부서를 선택하세요.");
		
	}else if($(".position:selected").length >= 1){
		alert("직급을 선택하세요.");
		
	}else{
		return true;
	}
	
	return false;
})


</script>