<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval/apvl_progress.css" />

<!-- 구현 -->
<section>
    <div class="page-header" >
        <h1>진행중인 결재</h1>
        <hr class="my-4">
    </div>

    <!-- 
        1. 결재문서 클릭시 상세 조회 페이지 -> 미정 (AJAX or ETC)
        2. 결재버튼은 상세 조회 페이지에서
    -->
    <div class="jumbotron ap-info">
        <div class="ap-doc">
            <div class="ap-info-head">
                <a href="#">
                    <h4 class="ap-info-title" id="ap-info-title"><b>결재문서 테스트1</b></h4>
                </a>
                <p class="ap-info-date" id="ap-info-date">2019.09.09 &nbsp; 14:25</p>
            </div>
            <div class="ap-info-middle">
                <h4 class="ap-writer-name" id="ap-writer-name"><b>코케 부장</b></h4>
                <p class="ap-writer-team" id="ap-writer-team">Backend TEAM</p>
            </div>
            <div class="ap-info-end">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-check-circle-fill process-circle process-circle1" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-check-circle-fill process-circle process-circle2" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-check-circle-fill process-circle process-circle3" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-check-circle-fill process-circle process-circle4" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <button type="button" class="btn btn-secondary ap-progress-info-btn" id="ap-progress-info-btn" data-toggle="modal" data-target="#ap-progress-modal">
                    결재 진행 상황
                </button>
            </div>
        </div>
    </div>
    <div class="jumbotron ap-info">
        <div class="ap-doc">
            <div class="ap-info-head">
                <a href="./approval-progress-detail.html">
                    <h4 class="ap-info-title" id="ap-info-title"><b>전자결재 모듈 UI업데이트 회의록</b></h4>
                </a>
                <p class="ap-info-date" id="ap-info-date">2019.09.09 &nbsp; 13:10</p>
            </div>
            <div class="ap-info-middle">
                <h4 class="ap-writer-name" id="ap-writer-name"><b>페드리 인턴</b></h4>
                <p class="ap-writer-team" id="ap-writer-team">Frontend TEAM</p>
            </div>
            <div class="ap-info-end">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-check-circle-fill process-circle process-circle1" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-check-circle-fill process-circle process-circle3" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-check-circle-fill process-circle process-circle4" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <button type="button" class="btn btn-secondary ap-progress-info-btn" id="ap-progress-info-btn" data-toggle="modal" data-target="#ap-progress-modal">
                    결재 진행 상황
                </button>
            </div>
        </div>
    </div>
    
    <div class="modal fade ap-progress-modal" id="ap-progress-modal" tabindex="-1" aria-labelledby="ap-progress-modal-label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ap-progress-info-label"><b>결재 진행 상황</b></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    아직 결재 진행 상황을 볼 수 없습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>