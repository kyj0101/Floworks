<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.floworks.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
Member member = (Member) session.getAttribute("loginMember");
%>
<title>개인정보 수정하기</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberUpdate.css">

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<!-- 
<script>
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			document.contactForm.action = "${pageContext.request.contextPath}/member/memberUpdate";
			document.contactForm.submit();
		});
	});
</script>
 -->


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section>
	<div class="section-div">
		<div class="update-div">
			<form:form  name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
				 <h1>개인 정보 수정하기</h1>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="id" id="id" placeholder="이름" value='<sec:authentication property="principal.id"/>'readonly required/>
						</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="name" placeholder="이름" value="<sec:authentication property="principal.name"/>" required/>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email" placeholder="이메일" value="<sec:authentication property="principal.email"/>" required/>
						</div>
					</div> 
					<div class="col-md-12">
						<div class="form-group">
							<input type="tel" class="form-control" name="phone" id="phone" placeholder="전화번호" maxlength="11" value="<sec:authentication property="principal.phone"/>" required/>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="address" id="address" placeholder="주소" value="<sec:authentication property="principal.address"/>" required/>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="submit" value="수정" id="btnUpdate" class="btn btn-primary">
							<div class="submitting"></div>
						</div>
					</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>
