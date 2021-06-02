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
    <form action="${pageContext.request.contextPath}/approval/apvlWrite/enroll" 
    	  method="POST" 
    	  class="ap-write-setting" 
    	  id="ap-write-setting" 
    	  autocomplete="off" 
    	  enctype="multipart/form-data"
    	  onsubmit="return approvalValidate();">
        <sec:csrfInput/>
        <input type="hidden" name="workspaceId" value='<sec:authentication property="principal.workspaceId"/>' />
        <input type="hidden" name="writer" value='<sec:authentication property="principal.id"/>' />
        <input type="hidden" name="apvlId" />
	    <div class="page-header" >
	        <h1>결재 문서 작성</h1>
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
                    <select class="form-control ap-category-select" id="ap-category-select" name="category" required>
                        <option value="" selected>선택</option>
                        <option value="지출결의서">지출 결의서</option>
                        <option value="업무연락서">업무 연락서</option>
                    </select>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-year-select"><b>보존 연한</b></label>
                </td>
                <td>
                    <select class="form-control ap-category-select ap-year-select" id="ap-year-select" name="year" required>
                        <option value="1" selected>1년</option>
                        <option value="3">3년</option>
                        <option value="5">5년</option>
                    </select>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-line"><b>결재선</b></label>
                </td>
                <td>
                    <!-- <a href="#" data-toggle="modal" class="ap-add-line" data-target="#memberlist">추가하기</a> -->
					<button type="button" class="btn btn-secondary ap-add-line" id="ap-add-line" data-toggle="modal" data-target="#memberlist">
	                	추가하기
	                </button>
                    <div class="modal fade" id="memberlist" tabindex="-1" aria-labelledby="MemberList" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="member-list"><b>사원 목록</b></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <!-- 모달창 메인섹션 -->
                                <!-- JS 이용해 4명 이상 선택 후 선택 버튼 클릭 시, 선택 방지 + 4명 이하만 선택할 수 있습니다. alert창 -->
                                <div class="modal-body">
                                    <table class="table member-list-table">
                                        <thead>
                                            <tr>
                                                <th scope="col">선택</th>
                                                <th scope="col">아이디</th>
                                                <th scope="col">이름</th>
                                                <th scope="col">부서</th>
                                                <th scope="col">직급</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${apverList}" var="apr">
	                                            <tr>
	                                            	<td>
	                                                    <div class="form-check form-check-inline">
	                                                        <input class="form-check-input apvline-checkbox" id="apvline-checkbox" name="apvlLine" type="checkbox" value="${apr.userId}" onclick="chooseApver(this);">
	                                                    </div>
	                                                </td>
													<td>${apr.userId}</td>
													<td>${apr.name}</td>
													<td>${apr.dept}</td>
													<td>${apr.position}</td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-primary" onclick="apverSubmit();">선택</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="form-group">
                <td></td>
                <td>
                    <ul class="ap-line-selected" id="ap-line-selected"></ul>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-write-title"><b>제목</b></label>
                </td>
                <td>
                    <input class="form-control ap-write-title" id="ap-write-title" name="title" type="text" placeholder="문서 제목">
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-write-textarea"><b>내용</b></label>
                </td>
                <td>
                    <textarea class="form-control ap-write-textarea" id="ap-write-textarea" name="content" rows="12"></textarea>
                </td>
            </tr>
            <tr class="form-group">
                <td rowspan="3"><b>첨부파일</b></td>
                <td>
                    <div class="ap-write-filesection">
                        <label for="ap-upFile1">파일첨부 1</label>
                        <input type="file" class="form-control-file" name="upFile" id="ap-upFile1">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="ap-write-filesection">
                        <label for="ap-upFile2">파일첨부 2</label>
                        <input type="file" class="form-control-file" name="upFile" id="ap-upFile2">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="ap-write-filesection">
                        <label for="ap-upFile3">파일첨부 3</label>
                        <input type="file" class="form-control-file" name="upFile" id="ap-upFile3">
                    </div>
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
	
	for (let i = 0; i < apverArr.length; i++) {
		if (apverArr[i].checked) {
			html += ("<li>" + apverArr[i].value + "</li>");
			html += ("<input type='hidden' name=approver" + i + " value='" + apverArr[i].value + "'/>");
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