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
        <h1 class="detail-h1" id="detail-h1">결재문서 테스트1</h1>
        <hr class="my-4">
    </div>

    <!-- 결재 완료함 문서(결재문서 테스트1) 상세 조회 페이지 -->
    <div class="ap-doc-main" id="ap-doc-main">
        <table class="ap-doc-table" id="ap-doc-table">
            <tr>
                <th>문서 종류</th>
                <td>지출 결의서</td>
            </tr>
            <tr>
                <th>결재선</th>
                <td>베라티 &nbsp; 음바페 &nbsp; 파레데스 &nbsp; 드락슬러</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                    결재문서 테스트1
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis fugit neque voluptate. Praesentium sapiente deserunt aperiam, dolor numquam eius enim quae, cupiditate hic est repellat consequuntur ducimus facere recusandae ab?
                    Officia animi voluptatibus voluptas mollitia quisquam atque aut odit iusto quae libero fugit repellendus asperiores, consequuntur eum consequatur harum blanditiis. Tempora vero molestiae adipisci omnis optio repellat reiciendis voluptatem perspiciatis.
                    Numquam recusandae corrupti tenetur ullam nulla excepturi ipsa sit, optio dolore cumque amet earum, veritatis voluptate beatae debitis molestiae qui quis neque repellendus consequatur rem. Reprehenderit autem optio quos cum?
                    Saepe est praesentium assumenda quas corrupti deleniti dolor a, rerum nam laboriosam nesciunt. Culpa, illum. Omnis aut libero hic, assumenda impedit, corporis dolor totam, consequatur nisi nobis nesciunt nihil recusandae?
                    Explicabo, quidem ex! Numquam porro, laudantium beatae, dolorem est veniam, iste illum natus ut nemo molestias saepe vero libero error repudiandae labore? Ipsum, autem commodi quos nesciunt enim quo id.
                    Tempora eius fugit sint repellendus aliquid eum quos praesentium veniam magni accusantium eveniet reprehenderit eaque pariatur, ad perferendis possimus alias et commodi cum nobis cumque, iste fugiat. Eius, quas inventore.
                    Laudantium obcaecati pariatur harum tempora quibusdam illo eum excepturi nemo eos ipsum non placeat recusandae explicabo, minus commodi officiis dolore id nobis praesentium vel similique totam. Consequatur molestias maiores nam?
                    Aperiam sit, deserunt accusamus et similique nam harum molestias cumque repellendus voluptas. Placeat, officia quisquam voluptate unde iste accusantium vel praesentium, quia, impedit distinctio magnam esse sunt dolores? Totam, obcaecati.
                    Odio tempora unde vel voluptate adipisci voluptatibus, repellat, delectus facilis, atque id corporis? Facilis, mollitia. Error sapiente hic pariatur fuga praesentium porro. Provident modi aut quibusdam expedita vitae, sapiente laboriosam?
                    Necessitatibus exercitationem magni, sunt vel minus quod qui veritatis omnis, inventore quis illum pariatur blanditiis a dignissimos totam aliquam sequi repellendus ut perspiciatis cumque. Doloribus eum natus rem voluptatibus illo.
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
        <button type="button" class="btn btn-primary btn-lg ap-history-btn" id="ap-history-btn" data-toggle="modal" data-target="#ap-history-modal">
            결재내역
        </button>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="ap-history-modal" tabindex="-1" aria-labelledby="history-modal-label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><b>결재 히스토리</b></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 모달창 바디 -->
                    <p>결재 히스토리 모달창입니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>