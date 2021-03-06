<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="이메일 상세보기" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailDetail.css" />

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<section>
	<div class="email-header">
		<h5><strong>${email.subject}</strong></h5>
		<hr />
		<ul>
			<li>
				<div class="box">
					<c:if test="${listType == 'sent'}" >
						<img class="profile" src="${pageContext.request.contextPath }/resources/upload/profile/<sec:authentication property="principal.profileFileRename"/>">
					</c:if>
					
					<c:if test="${listType == 'inbox'}" >
						<img class="profile" src="${pageContext.request.contextPath}/resources/upload/profile/${fileRename}">
					</c:if>
				</div>
			</li>
			<li>
				<p>
					<strong>${email.name} : ${email.id}</strong>
                    <br>
                    to : ${email.recipient}
				</p>
			</li>
		</ul>

		<p class="recipient-details">
			<a class="btn btn-primary " data-toggle="collapse"
				href="#collapseExample" role="button" aria-expanded="false"
				aria-controls="collapseExample"> 수신자 상세보기 </a>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="card card-body">
				참조인 : ${email.emailCC}
				<br>  
				<c:if test="${listType == 'sent' || id == email.emailBCC}" >
					숨은 참조인 : ${email.emailBCC}
					<br>
				</c:if>
				외부 수신인 : ${email.externalRecipient}
			</div>
		</div>
	</div>

	<div class="email-btn">
		<p><fmt:formatDate value="${email.time}" pattern="yy/MM/dd HH:mm:ss"/></p>
		<button id="bookmark-btn">
			<i class="fas fa-star"></i>
		</button>
		
		<form action="${pageContext.request.contextPath}/email/delete?type=${listType}&id=${id}" method="POST">
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			<input type="hidden" name="deleteCheck" value="${email.emailNo}"/>
			
			<button id="delete-btn" type="submit">
				<i class="fas fa-trash"></i>
			</button>
		</form>
		
	</div>

	<div class="email-content">
		<c:if test="${email.emailContent == null}">
			<p>내용 없음</p>
		</c:if>
		${email.emailContent}
	</div>

	<ul class="file-list">
		<li>
			<i class="fas fa-file-download"></i>
		</li>
		
		<li>
			<hr>
		</li>
	
		<li>
			<a href="${pageContext.request.contextPath}/email/download/?fileReName=${fileMap.fileRenamed1}&fileOriName=${fileMap.fileOriginalname1}" class="file-a">${fileMap.fileOriginalname1}</a>
		</li>
		
		<li>
			<a href="${pageContext.request.contextPath}/email/download/?fileReName=${fileMap.fileRenamed2}&fileOriName=${fileMap.fileOriginalname2}" class="file-a">${fileMap.fileOriginalname2}</a>
		</li>
		
		<li>
			<a href="${pageContext.request.contextPath}/email/download/?fileReName=${fileMap.fileRenamed3}&fileOriName=${fileMap.fileOriginalname3}" class="file-a">${fileMap.fileOriginalname3}</a>
		</li>
	</ul>

</section>
<script>
$(() => {
    $("#bookmark-btn").click((e) => {
        const $star = $(".fa-star");
        
        $star.toggleClass('on');
        
        if($star.hasClass('on')){
        	updateStarredEmail("Y");
        }
        
        if(!$star.hasClass('on')){
        	updateStarredEmail("N");
        }
    });

    if("${email.emailStarred}" == 'true'){
    	$(".fa-star").addClass('on');
    }
    
	$(".file-a").click(function(){
		const renamedFile = $(this).attr("href");
	});

}); 



function updateStarredEmail(value){
	
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	const type = "${listType}";
	const id = "${id}";
	const emailNo = "${email.emailNo}";
	
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/email/updateStarred",
		data:{"type":type, "id":id, "emailNo":emailNo, "value":value},
		
		beforeSend(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		
		success(){
		},
		
		error(xhr,status,error){
			console.log(xhr);
		},
		
	});
}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>