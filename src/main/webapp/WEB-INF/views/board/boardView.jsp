<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

    
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardView.css" />

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/board/boardView.js"></script>


 
 
 <section>
     <!-- http://bootstrapk.com/components/#page-header -->
     <div class="page-header" >
         <h1>공지사항</h1>
         <hr class="my-4">
     </div>

     <div>
     	 <h3>${postList.postTitle}</h3>
         <div class="postWriter" >
             <img src="${pageContext.request.contextPath }/resources/images/dog.jpg" alt="프로필사진" class="img-circle d-inline-block" id="postProfile">
             <label id="postName">${postList.name} ( ${postList.departmentName} )</label>
             <br>
             <small id="postDate" class="form-text text-muted d-inline-block"><fmt:formatDate value="${postList.postDate}" pattern="yy/MM/dd"/></small>
             <small id="postCount" class="form-text text-muted d-inline-block">조회수 : ${postList.postReadCount}</small>
             <div id="moveGroup" class="a-grup d-inline-block float-right">
                 <a href="#comment-list">댓글[ ${postList.commentCount} ]</a>
                 <a href="#fileButton">첨부파일[ ${postList.fileCount} ]</a>
             </div>
             <hr>
         </div>

         <div class="form-group" id="postText">
             <textarea class="form-control" id="postTextarea" rows="20" placeholder="내용이 들어올 자리입니다" readonly>${postList.postContent}</textarea>
         </div>

         <!-- 첨부파일 버튼-->
         <c:forEach items="${postList.postFileList}" var="pfList">
         <c:if test="${pfList.postOriginalFileName != null}">
         <div class="btn-group btn-group-toggle" data-toggle="buttons" id="fileButton">
               <button class="btn btn-light active" type="button" name="options" id="option1" onclick="fileDownload(${pfList.postFileNo});"> 첨부파일 - ${pfList.postOriginalFileName}
         </div>
         </c:if>
         </c:forEach>
         
         <!-- 댓글 작성자와 관리자권한이 있는 경우만 노출 -->
         <div class="float-right" id="view-btn">
             <button type="button" class="btn btn-primary float-right">수정</button>
             <button type="button" class="btn btn-primary float-right">삭제</button>
         </div>

         <!-- 댓글자리 -->
         <div id="comment-list">
             <div>
                 <textarea id="comment-area" class="d-inline-block" placeholder="댓글을 입력해주세요"></textarea>
                 <button id="comment-btn" type="button" class="btn btn-secondary float-right d-inline-block">입력</button>
             </div> 
             <table  class="table" id="tb-comment">
                 <tr class=level1>
                     <td>
                         <label id="commentName">작성자이름 직급 (부서)</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block">2021.05.21 15:20</small>
                         <br />
                         댓글내용입니다
                     </td>
                     <td>
                         <button type="button" class="btn btn-secondary float-right">답글</button>
                         <!-- 댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button type="button" class="btn btn-secondary float-right">삭제</button>
                     </td>
                 </tr>
                 <tr class=level2>
                     <td>
                         <label id="commentName">작성자이름 직급 (부서)</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block">2021.05.21 15:20</small>
                         <br />
                         대댓글 내용 입니다
                     </td>
                     <td>     
                         <!--댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button  type="button" class="btn btn-secondary float-right">삭제</button>	
                     </td>
                     
                 </tr>   
                 <tr class=level1>
                     <td>
                         <label id="commentName">작성자이름 직급 (부서)</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block">2021.05.21 15:20</small>
                         <br />
                         댓글내용입니다
                     </td>
                     <td>
                         <button type="button" class="btn btn-secondary float-right">답글</button>
                         <!-- 댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button type="button" class="btn btn-secondary float-right">삭제</button>
                     </td>
                 </tr>
                 <tr class=level2>
                     <td>
                         <label id="commentName">작성자이름 직급 (부서)</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block">2021.05.21 15:20</small>
                         <br />
                         대댓글 내용 입니다
                     </td>
                     <td>     
                         <!--댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button  type="button" class="btn btn-secondary float-right">삭제</button>	
                     </td>
                     
                 </tr> 
                 <tr class=level2>
                     <td>
                         <label id="commentName">작성자이름 직급 (부서)</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block">2021.05.21 15:20</small>
                         <br />
                         대댓글 내용 입니다
                     </td>
                     <td>     
                         <!--댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button  type="button" class="btn btn-secondary float-right">삭제</button>	
                     </td>
                     
                 </tr>    
                 <tr class=level1>
                     <td>
                         <label id="commentName">작성자이름 직급 (부서)</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block">2021.05.21 15:20</small>
                         <br />
                         댓글내용입니다
                     </td>
                     <td>
                         <button type="button" class="btn btn-secondary float-right">답글</button>
                         <!-- 댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button type="button" class="btn btn-secondary float-right">삭제</button>
                     </td>
                 </tr>
                 <tr class=level2>
                     <td>
                         <label id="commentName">작성자이름 직급 (부서)</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block">2021.05.21 15:20</small>
                         <br />
                         대댓글 내용 입니다
                     </td>
                     <td>     
                         <!--댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button  type="button" class="btn btn-secondary float-right">삭제</button>	
                     </td>
                     
                 </tr>      
             </table>
             <nav aria-label="Page navigation example">
                 <ul class="pagination justify-content-center">
                   <li class="page-item disabled">
                     <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
                   </li>
                   <li class="page-item"><a class="page-link" href="#">1</a></li>
                   <li class="page-item"><a class="page-link" href="#">2</a></li>
                   <li class="page-item"><a class="page-link" href="#">3</a></li>
                   <li class="page-item">
                     <a class="page-link" href="#">&raquo;</a>
                   </li>
                 </ul>
             </nav>


         </div>
     </div>      
         





 
     
 </section>
 
 
 
 
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>