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
    <form action="" method="" class="ap-write-setting" autocomplete="off">
        <table class="ap-write-form">
            <tr class="form-group">
                <td>
                    <label for="ap-category-select"><b>문서 종류</b></label>
                </td>
                <td>
                    <select class="form-control ap-category-select" id="ap-category-select" required>
                        <option value="" selected>선택</option>
                        <option value="expense">지출 결의서</option>
                        <option value="contact">업무 연락서</option>
                        <option value="absence">연차 신청</option>
                    </select>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-line"><b>결재선</b></label>
                </td>
                <td>
                    <a href="#" data-toggle="modal" class="ap-add-line" data-target="#memberlist">추가하기</a>

                    <div class="modal fade" id="memberlist" tabindex="-1" aria-labelledby="MemberList" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg"> <!-- modal-dialog{overflow-y: initial !important} -->
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
                                                <th scope="col">이름</th>
                                                <th scope="col">직급</th>
                                                <th scope="col">부서</th>
                                                <th scope="col">이메일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">베라티</th>
                                                <td>차장</td>
                                                <td>MF</td>
                                                <td>verratti@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">마르퀴뇨스</th>
                                                <td>팀장</td>
                                                <td>DF</td>
                                                <td>marqui@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">음바페</th>
                                                <td>사원</td>
                                                <td>FW</td>
                                                <td>mbappe@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">에레라</th>
                                                <td>과장</td>
                                                <td>DF</td>
                                                <td>andre@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">드락슬러</th>
                                                <td>대리</td>
                                                <td>MF</td>
                                                <td>drax@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">파레데스</th>
                                                <td>과장</td>
                                                <td>MF</td>
                                                <td>leandro@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">파레데스</th>
                                                <td>과장</td>
                                                <td>MF</td>
                                                <td>leandro@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">파레데스</th>
                                                <td>과장</td>
                                                <td>MF</td>
                                                <td>leandro@kh.com</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="#">
                                                    </div>
                                                </td>
                                                <th scope="row">파레데스</th>
                                                <td>과장</td>
                                                <td>MF</td>
                                                <td>leandro@kh.com</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-primary">선택</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="form-group">
                <td></td>
                <td>
                    <ul class="ap-line-selected">
                        <!-- li 안 데이터 -->
                        <li class="ap-line-1" id="ap-line-1">베라티</li>
                        <li class="ap-line-2" id="ap-line-2">음바페</li>
                        <li class="ap-line-3" id="ap-line-3">파레데스</li>
                        <li class="ap-line-4" id="ap-line-4">드락슬러</li>
                    </ul>
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-write-title"><b>제목</b></label>
                </td>
                <td>
                    <input class="form-control ap-write-title" id="ap-write-title" type="text" placeholder="문서 제목">
                </td>
            </tr>
            <tr class="form-group">
                <td>
                    <label for="ap-write-textarea"><b>내용</b></label>
                </td>
                <td>
                    <textarea class="form-control ap-write-textarea" id="ap-write-textarea" rows="12"></textarea>
                </td>
            </tr>
            <tr class="form-group">
                <td rowspan="3"><b>첨부파일</b></td>
                <td>
                    <div class="ap-write-filesection">
                        <label for="ap-write-file">파일첨부 1</label>
                        <input type="file" class="form-control-file" id="ap-write-file1">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="ap-write-filesection">
                        <label for="ap-write-file">파일첨부 2</label>
                        <input type="file" class="form-control-file" id="ap-write-file2">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="ap-write-filesection">
                        <label for="ap-write-file">파일첨부 3</label>
                        <input type="file" class="form-control-file" id="ap-write-file3">
                    </div>
                </td>
            </tr>
        </table>
    </form>
    
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>