<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

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
					<img class="profile" src="${pageContext.request.contextPath }/resources/images/profileSample.jpg">
				</div>
			</li>
			<li>
				<p>
					<strong>${email.id}</strong>
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
				<c:out value = "${id}"/> 
				<c:if test="${listType == 'sent'}" >
				숨은 참조인 : ${email.emailBCC}
				<br>
				</c:if>
				외부 수신인 : ${email.externalRecipient}
			</div>
		</div>
	</div>

	<div class="email-btn">
		<p>2021/05/10 12:40:00</p>
		<button id="bookmark-btn">
			<i class="fas fa-star"></i>
		</button>

		<button id="delete-btn">
			<i class="fas fa-trash"></i>
		</button>
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
        console.log($(".fa-star"))
        $(".fa-star").toggleClass('on');
    })
}); 

$(".file-a").click(function(){
	
	const renamedFile = $(this).attr("href");
	
	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>