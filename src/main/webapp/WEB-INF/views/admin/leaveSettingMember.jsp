<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="연차 설정" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/leaveSetting.css" />

<section>
	<h4>직급별 기본 연차 설정하기</h4>
	<table class="table table-striped">
		<thead class="">
			<tr>
				<th scope="col">이름</th>
				<th scope="col">부서</th>
				<th scope="col">직급</th>
				<th scope="col">잔여 연차</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${leaveSystemMapList}" var="map">			
				<tr>
					<th scope="row">${map.position}</th>
					<td>
						<input type="number" value="${map.leaveDay}" min="5" max="30">
					</td>
					<td>
						<button type="button" class="btn btn-outline-primary change-btn">변경</button>
					</td>
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	<hr>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
$(".change-btn").click(function(){
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	
	const leaveDay = $(this).parent().prev().children().val();
	const position = $(this).parent().prev().prev().text();
	const workspaceId = "<sec:authentication property='principal.workspaceId'/>";
	
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/admin/leave/setting",
		data:{"position":position,
			  "leaveDay":leaveDay,
		      "workspaceId":workspaceId	  
		},
		
		beforeSend(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		
		success(){
			alert("변경되었습니다.");
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});
})

</script>
