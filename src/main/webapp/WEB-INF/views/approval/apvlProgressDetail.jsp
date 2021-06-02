<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval/apvl_prg_detail.css" />

<!-- 구현 -->
<section>
    <!-- http://bootstrapk.com/components/#page-header -->
    <div class="page-header" >
        <h1 class="detail-h1" id="detail-h1">전자결재 모듈 UI업데이트 회의록</h1>
        <hr class="my-4">
    </div>

    <!-- 진행중인 결재(전자결재 모듈 UI업데이트 회의록) 상세 조회 페이지 -->
    <div class="ap-doc-main" id="ap-doc-main">
        <table class="ap-doc-table" id="ap-doc-table">
            <tr>
                <th>문서 종류</th>
                <td>${approval.category}</td>
            </tr>
            <tr>
                <th>결재선</th>
                <td>
                    <c:forEach items="${apverList}" var="avr">
                    	<span>${avr.name} &lt;${avr.dept}, ${avr.position}&gt;</span><br />
                    </c:forEach>
				</td>
            </tr>
            <tr>
            	<th>기안일자</th>
            	<td><fmt:formatDate value="${approval.reqDate}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                    ${approval.title}
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    ${approval.content}
                </td>
            </tr>
            <tr>
                <th rowspan="3">첨부파일</th>
                <c:forEach items="${approval.afList}" var="af">
                	<td>
	                    <div class="ap-detail-filesection">
							<button type="button" 
									class="btn btn-success"
									onclick="fileDownload(${af.idx});">
								첨부파일 - ${af.originalFileName}
							</button>
	                    </div>
	                </td>
				</c:forEach>
            </tr>
        </table>
    </div>
    <div class="ap-doc-footer" id="ap-doc-footer">
        <sec:authentication property="principal" var="loginid"/>
        <form action="${pageContext.request.contextPath}/approval/apvlProgressDetail/delete"
        	  method="post"
        	  id="deleteFrm">
        	<sec:csrfInput/>
        	<input type="hidden" name="apvlId" value="${approval.apvlId}" />
        	<input type="hidden" name="workspaceId" value='<sec:authentication property="principal.workspaceId"/>' />
        </form>
        <button type="button" class="btn btn-secondary btn-lg back-to-list" id="back-to-list" onclick="location.href = '${pageContext.request.contextPath}/approval/apvlProgress?workspaceId=${approval.workspaceId}'">
            목록
        </button>
       	<c:if test="${fn:trim(loginid.id) eq fn:trim(approval.writer)}">
       		<button type="button" class="btn btn-info btn-lg update-btn" id="update-btn"  
       				onclick="location.href = '${pageContext.request.contextPath}/approval/apvlUpdate?apvlId=${approval.apvlId}&workspaceId=<sec:authentication property="principal.workspaceId"/>'">
	            수정
	        </button>
	        <button type="button" class="btn btn-danger btn-lg delete-btn" id="delete-btn" 
	        		onclick="deleteApvl();">
	            삭제
	        </button>
       	</c:if>
       	
       	<c:if test="${!empty approval.approver1}">
       		<c:if test="${fn:trim(loginid.id) eq fn:trim(approval.approver1)}">
	       		<button type="button" class="btn btn-primary btn-lg approval-btn" id="approval-btn" data-toggle="modal" data-target="#approval-modal">
		            결재
		        </button>
	        </c:if>
       	</c:if>
       	<c:if test="${!empty approval.approver2}">
       		<c:if test="${fn:trim(loginid.id) eq fn:trim(approval.approver2)}">
	       		<button type="button" class="btn btn-primary btn-lg approval-btn" id="approval-btn" data-toggle="modal" data-target="#approval-modal">
		            결재
		        </button>
	        </c:if>
       	</c:if>
       	<c:if test="${!empty approval.approver3}">
       		<c:if test="${fn:trim(loginid.id) eq fn:trim(approval.approver3)}">
	       		<button type="button" class="btn btn-primary btn-lg approval-btn" id="approval-btn" data-toggle="modal" data-target="#approval-modal">
		            결재
		        </button>
	        </c:if>
       	</c:if>
       	<c:if test="${!empty approval.approver4}">
       		<c:if test="${fn:trim(loginid.id) eq fn:trim(approval.approver4)}">
	       		<button type="button" class="btn btn-primary btn-lg approval-btn" id="approval-btn" data-toggle="modal" data-target="#approval-modal" onclick="approve();">
		            결재
		        </button>
	        </c:if>
       	</c:if>
        
    </div>

    <!-- Modal -->
    <div class="modal fade" id="approval-modal" tabindex="-1" aria-labelledby="approval-modal-label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><b>결재 처리</b></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 모달창 바디 -->
                    <form action="${pageContext.request.contextPath}/approval/apvlProgressDetail/process" 
	                      method="POST" 
	                      class="processFrm" 
	                      id="processFrm">
                    	<sec:csrfInput/>
                    	<input type="hidden" name="apvlId" value="${approval.apvlId}" />
                    	<input type="hidden" name="approver" value='<sec:authentication property="principal.id"/>' />
                        <div class="ap-txn" id="ap-txn">
                            <div class="form-check form-check-inline ap-txn-category" id="ap-txn-category">
                                <input class="form-check-input approval-radio" type="radio" name="status" id="approval-radio" value="approve" checked>
                                <label class="form-check-label" for="approval-radio">
                                    결재
                                </label>
                            </div>
                            <div class="form-check form-check-inline ap-txn-category" id="ap-txn-category">
                                <input class="form-check-input reject-radio" type="radio" name="status" id="reject-radio" value="reject">
                                <label class="form-check-label" for="reject-radio">
                                    반려
                                </label>
                            </div>
                        </div>
                        <div class="form-group ap-comment">
                            <label for="ap-comment-txtarea">코멘트</label>
                            <textarea class="form-control ap-comment-txtarea" id="ap-comment-txtarea" name="comment" rows="3"></textarea>
                        </div>
                        <!-- <input type="submit" class="btn btn-primary ap-submit-btn" id="ap-submit-btn" value="확인" /> -->
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary ap-submit-btn" id="ap-submit-btn" onclick="approve();">확인</button>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
function fileDownload(idx){
	location.href = "${pageContext.request.contextPath}/approval/fileDownload?idx=" + idx;
}

function approve() {
	$('#processFrm').submit();	
	$('.modal').modal("hide");
}

function deleteApvl() {
	$('#deleteFrm').submit();
}

</script>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>