<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

    
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="게시글" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardView.css" />

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/board/boardView.js"></script>


 
 
 <section>
     <!-- http://bootstrapk.com/components/#page-header -->
     <div class="page-header" >
         <h1>게시글</h1>
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
             <button type="button" class="btn btn-primary float-right" onclick="postUpdate(${postList.postNo},${postList.boardNo});">수정</button>
             <button type="button" class="btn btn-primary float-right" onclick="postDelete(${postList.postNo},${postList.boardNo});">삭제</button>
         </div>

         <!-- 댓글자리 -->
         <div id="comment-list">
             <table  class="table" id="tb-comment">  
             <c:forEach items="${postList.postCommentList}" var="cmt">
	           	<c:if test="${cmt.commentNo != null && cmt.commentDel == false}">
             	<c:if test="${cmt.commentLevel eq 1}">
	                 <tr class=level1>
	                     <td>
	                         <label id="commentName">${cmt.cmtName}(${cmt.cmtDeptName})</label>
	                         <small id="commentDate" class="form-text text-muted d-inline-block"><fmt:formatDate value="${cmt.commentDate}" pattern="yy/MM/dd"/></small>
	                         <br />
	                         ${cmt.commentContent}
	                     </td>
	                     <td>
	                         <button type="submit" id="reply${cmt.commentNo}" class="btn btn-secondary float-right">답글</button>
	                         <!-- 댓글 작성자와 관리자권한이 있는 경우만 노출 -->
	                         <button type="submit"  class="btn btn-secondary float-right" onclick="commentDelete(${cmt.postNo},${cmt.commentNo});">삭제</button>
	                     </td>
	                 </tr>
	                 
	                 <!-- 대댓글부분,,,(포기ㅠ) -->
	                 <tr  style="display:none;" id="replyForm${cmt.commentNo}">
	                 <td >
	                 <form:form 
				 		name="postCm"
				 		action="${pageContext.request.contextPath}/board/commentInsert" 
						method="post"
						enctype="multipart/form-data" 
						onsubmit="return commentValidate();"
						>  
						 <div class="input-group mb-3" >
					 		<input type="text" name="commentContent2" class="form-control d-inline" 
					 				placeholder="댓글을 입력해주세요" aria-label="Recipient's username"
					 				>
					  		<input type="hidden" name="commentLevel" value="2" />
		               		<input type="hidden" name="id" value="${postList.id}" />    
							<input type="hidden" name="postNo" value="${postList.postNo}" />
		               		<input type="hidden" name="postCommentNo" value="${cmt.commentNo}" />  
					  		<div class="input-group-append d-inline" >		
					    		<button class="btn btn-outline-secondary d-inline" type="submit"
					    			  >입력</button>
					 	 	</div>
						 </div>
				 	</form:form>
				 	</td>
				 	</tr>
				 	
                 </c:if>
                 <c:if test="${cmt.commentLevel eq 2}">
                 <tr class=level2>
                     <td>
                         <label id="commentName">${cmt.cmtName}(${cmt.cmtDeptName})</label>
                         <small id="commentDate" class="form-text text-muted d-inline-block"><fmt:formatDate value="${cmt.commentDate}" pattern="yy/MM/dd"/></small>
                         <br />
                         ${cmt.commentContent}
                     </td>
                     <td>     
                         <!--댓글 작성자와 관리자권한이 있는 경우만 노출 -->
                         <button  type="button" class="btn btn-secondary float-right" onclick="commentDelete(${cmt.postNo},${cmt.commentNo});">삭제</button>	
                     </td>
                 </tr>  
                 </c:if>  
	               </c:if>
               </c:forEach>  
             </table>
             <!-- 
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
             
              -->
		   <form:form 
		 		name="postCm"
		 		action="${pageContext.request.contextPath}/board/commentInsert" 
				method="post"
				enctype="multipart/form-data" 
				onsubmit="return commentValidate();"
				id="postCm">  
				 <div class="input-group mb-3">
			 		<input type="text" name="commentContent" class="form-control d-inline" 
			 				placeholder="댓글을 입력해주세요" aria-label="Recipient's username"
			 				aria-describedby="button-addon2">
			  		<input type="hidden" name="commentLevel" value="1" />
               		<!-- 왜 안되지,,,ㅠ
               		<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>" />    
               		 -->
               		<input type="hidden" name="id" value="aaa123"/>
					<input type="hidden" name="postNo" value="${postList.postNo}" />
               		<input type="hidden" name="postCommentNo" value="0" />  
			  		<div class="input-group-append d-inline" >		
			    		<button class="btn btn-outline-secondary d-inline" type="submit"
			    			  id="button-addon2">입력</button>
			 	 	</div>
				 </div>
		 	</form:form>

         </div>
     </div>      
         





 
     
 </section>


 
 
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>