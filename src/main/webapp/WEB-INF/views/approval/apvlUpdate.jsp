<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval/apvl_write.css" />

<!-- 구현 -->
<section>
    <!-- http://bootstrapk.com/components/#page-header -->
    <form action="${pageContext.request.contextPath}/approval/apvlUpdate/modify" 
    	  method="POST" 
    	  class="ap-write-setting" 
    	  id="ap-write-setting" 
    	  autocomplete="off" 
    	  enctype="multipart/form-data"
    	  onsubmit="return updateValidate();">
        <sec:csrfInput/>
        <input type="hidden" name="apvlId" value="${approval.apvlId}" />
        <input type="hidden" name="writer" value='<sec:authentication property="principal.id"/>' />
        <input type="hidden" name="workspaceId" value='<sec:authentication property="principal.workspaceId"/>' />
	    <div class="page-header" >
	        <h1>결재 문서 수정</h1>
	        <hr class="my-4">
	    </div>
	    <div class="ap-write-top">
	        <div class="ap-write-h5">
	            <h5><b>문서 설정</b></h5>
	        </div>
	        <div class="ap-write-btn">
	            <input class="btn btn-primary" type="submit" value="기안하기">
	        </div>
	    </div>
        <table class="ap-write-form">
            <tr class="form-group">
                <td>
                    <label for="ap-category-select"><b>문서 종류</b></label>
                </td>
                <td>
                    <select class="form-control ap-category-select" id="ap-category-select" name="category" disabled>
	                    <c:choose>
	                    	<c:when test="${approval.category eq '지출결의서'}">
	                    		<option value="지출결의서" selected>지출 결의서</option>
		                        <option value="업무연락서">업무 연락서</option>
	                    	</c:when>
	                    	<c:when test="${approval.category eq '업무연락서'}">
		                        <option value="지출결의서">지출 결의서</option>
	                    		<option value="업무연락서" selected>업무 연락서</option>
	                    	</c:when>
	                    </c:choose>
                    </select>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-line"><b>결재선</b></label>
                </td>
                <td>
					<ul style="list-style: none;">
						<c:if test="${approval.approver1 != null}">
							<li>${approval.approver1} - (${approverOne.name} ${approverOne.dept} ${approverOne.position})</li>
						</c:if>
						<c:if test="${approval.approver2 != null}">
							<li>${approval.approver2} - (${approverSec.name} ${approverSec.dept} ${approverSec.position})</li>
						</c:if>
						<c:if test="${approval.approver3 != null}">
							<li>${approval.approver3} - (${approverThd.name} ${approverThd.dept} ${approverThd.position})</li>
						</c:if>
						<c:if test="${approval.approver4 != null}">
							<li>${approval.approver4} - (${approverFth.name} ${approverFth.dept} ${approverFth.position})</li>
						</c:if>
					</ul>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <ul class="ap-line-selected" id="ap-line-selected"></ul>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-write-title"><b>제목</b></label>
                </td>
                <td>
                    <input class="form-control ap-write-title" id="ap-write-title" name="title" type="text" placeholder="수정 전 제목 - ${approval.title}">
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-write-textarea"><b>내용</b></label>
                </td>
                <td>
                    <textarea class="form-control ap-write-textarea" id="ap-write-textarea" name="content" rows="12">${approval.content}</textarea>
                </td>
            </tr>
        </table>
    </form>
    
</section>

<!-- JS -->
<script>
function chooseApver(obj) {
	let apverArr = document.getElementsByName("apvlLine");
	let result = 0;
	
	for (let i = 0; i < apverArr.length; i++) {
		if (apverArr[i].checked) {
			result++;
		}
	}
	
	if (result > 4) {
		alert('결재선은 최대 4명까지 지정할 수 있습니다.');
		obj.checked = false;
		return false;
	}
}

function apverSubmit() {
	let apverArr = document.getElementsByName("apvlLine");
	document.getElementById("ap-line-selected").innerHTML = '';
	let html = '';
	let hiddenInput = ''
	let cnt=1;
	for (let i = 0; i < apverArr.length; i++) {
		if (apverArr[i].checked) {
			html += ("<li>" + apverArr[i].value + "</li>");
			html += ("<input type='hidden' name='approver" + cnt + "' value='" + apverArr[i].value + "'/>");
			cnt++;
		}
	}
	
	document.getElementById("ap-line-selected").innerHTML += html;
	$('.modal').modal("hide");
}

function approvalValidate(){
	let $title = $("[name=title]");
	if(/^(.|\n)+$/.test($title.val()) == false){
		alert("제목을 입력하세요");
		return false;
	}
	
	let $content = $("[name=content]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	
	return true;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>