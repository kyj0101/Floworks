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
                <td>
                    <div class="ap-detail-filesection">
                        <label for="ap-detail-file">파일첨부 1</label>
                        <input type="file" class="form-control-file" id="ap-detail-file1">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="ap-detail-filesection">
                        <label for="ap-detail-file">파일첨부 2</label>
                        <input type="file" class="form-control-file" id="ap-detail-file2">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="ap-detail-filesection">
                        <label for="ap-detail-file">파일첨부 3</label>
                        <input type="file" class="form-control-file" id="ap-detail-file3">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div class="ap-doc-footer" id="ap-doc-footer">
        <button type="button" class="btn btn-secondary btn-lg back-to-list" id="back-to-list">
            목록
        </button>
        <sec:authentication property="principal" var="loginId"/>
        <% // TODO 결재 버튼 (로그인 계정 == 작성자 -> 수정, 삭제 / 로그인 계정 == 결재선 -> 결재 버튼) 수정 필요. (Test 통과가 안되고 있음) %>
        <c:if test="${loginId.id eq approval.writer}">
	        <button type="button" class="btn btn-info btn-lg update-btn" id="update-btn">
	            수정
	        </button>
	        <button type="button" class="btn btn-danger btn-lg delete-btn" id="delete-btn">
	            삭제
	        </button>
        </c:if>
        <button type="button" class="btn btn-primary btn-lg approval-btn" id="approval-btn" data-toggle="modal" data-target="#approval-modal">
            ${approval.writer}
        </button>
        <button type="button" class="btn btn-primary btn-lg approval-btn" id="approval-btn" data-toggle="modal" data-target="#approval-modal">
            ${loginId.id}
        </button>
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
                    <!-- <p>결재 모달창입니다.</p> -->
                    <form action="" method="" class="approval-modal-form" id="approval-modal-form">
                        <div class="ap-txn" id="ap-txn">
                            <div class="form-check form-check-inline ap-txn-category" id="ap-txn-category">
                                <input class="form-check-input approval-radio" type="radio" name="apRadios" id="approval-radio" value="approval" checked>
                                <label class="form-check-label" for="approval-radio">
                                    결재
                                </label>
                            </div>
                            <div class="form-check form-check-inline ap-txn-category" id="ap-txn-category">
                                <input class="form-check-input reject-radio" type="radio" name="apRadios" id="reject-radio" value="reject">
                                <label class="form-check-label" for="reject-radio">
                                    반려
                                </label>
                            </div>
                        </div>
                        <div class="form-group ap-comment">
                            <label for="ap-comment-txtarea">코멘트</label>
                            <textarea class="form-control ap-comment-txtarea" id="ap-comment-txtarea" rows="3"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary ap-submit-btn" id="ap-submit-btn">확인</button>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>