<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

    
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="게시글 상세보기" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardView.css" />

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/board/boardView.js"></script>


 
 
 <section>

     <div>
     	 <h3>${postList.postTitle}</h3>
         <div class="postWriter" >
             <img src="${pageContext.request.contextPath }/resources/upload/profile/${postList.profileFileRename}" alt="프로필사진" class="img-circle d-inline-block" id="postProfile">
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
         <c:if test="${postList.commentCount == null}">
			<p>내용 없음</p>
		 </c:if>
		 ${postList.postContent}
		 </div>

         <!-- 첨부파일 버튼-->
         <c:forEach items="${postList.postFileList}" var="pfList">
         <c:if test="${pfList.postOriginalFileName != null}">
         <div class="btn-group btn-group-toggle" data-toggle="buttons" id="fileButton">
               <button class="btn btn-outline-primary" type="button" name="options" id="option1" onclick="fileDownload(${pfList.postFileNo});">
               	  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark" viewBox="0 0 16 16">
				  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
				  </svg> ${pfList.postOriginalFileName} </button>
         </div>
         </c:if>
         </c:forEach>
         
         <sec:authentication property="principal" var="loginId"/>
         <!-- 댓글 작성자와 관리자권한이 있는 경우만 노출 -->
		 <c:choose>
		 	<c:when test="${loginId.id eq postList.id}">
		 		<div class="float-right" id="view-btn">        	
		             <button type="button" class="btn btn-primary float-right" onclick="postUpdate(${postList.postNo},${postList.boardNo});">수정</button>		             
		             <form:form 
				   		name="postdelete"
				 		action="${pageContext.request.contextPath}/board/postDelete" 
						method="post"
						enctype="multipart/form-data" 
						onsubmit="return postDelete(${postList.postNo},${postList.boardNo});"
						id="postdel">  
		             <input id="postDelBtn" type="submit" class="btn btn-primary float-right" value="삭제" >
		             <input type="hidden" name="postNo" value="${postList.postNo}" />
		             <input type="hidden" name="boardNo" value="${postList.boardNo}" />
		             </form:form>		             
		         </div>
		 	</c:when>
		 	<c:when test="${loginId.id ne postList.id}">
		 		<sec:authorize access="hasRole('ADMIN')">
		 			<div class="float-right" id="view-btn">        		             
		             <form:form 
				   		name="postdelete"
				 		action="${pageContext.request.contextPath}/board/postDelete" 
						method="post"
						enctype="multipart/form-data" 
						onsubmit="return postDelete(${postList.postNo},${postList.boardNo});"
						id="postdel">  
		             <input id="postDelBtn" type="submit" class="btn btn-primary float-right" value="삭제" >
		             <input type="hidden" name="postNo" value="${postList.postNo}" />
		             <input type="hidden" name="boardNo" value="${postList.boardNo}" />
		             </form:form>		             
		         </div>
		 		</sec:authorize>
		 	</c:when>
		 </c:choose>

		 
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
	                         <!-- 댓글 작성자와 관리자권한이 있는 경우만 노출 -->
	                          <c:choose>
	                          	<c:when test="${loginId.id eq cmt.cmId}">
									 <form:form 
								   		name="commentDelete"
								 		action="${pageContext.request.contextPath}/board/commentDelete" 
										method="post"
										enctype="multipart/form-data" 
										onsubmit="return cmtDelete(${cmt.postNo},${cmt.commentNo});"
										id="cmtdel"> 
			                         <input id="cmtDelBtn" type="submit" class="btn btn-primary float-right" value="삭제" >
									 <input type="hidden" name="postNo" value="${cmt.postNo}" />
		            				 <input type="hidden" name="commentNo" value="${cmt.commentNo}" />
									 </form:form>
	                          	</c:when>
	                          	<c:when test="${loginId.id ne cmt.cmId}">
	                          		<sec:authorize access="hasRole('ADMIN')">
	                          			<form:form 
									   		name="commentDelete"
									 		action="${pageContext.request.contextPath}/board/commentDelete" 
											method="post"
											enctype="multipart/form-data" 
											onsubmit="return cmtDelete(${cmt.postNo},${cmt.commentNo});"
											id="cmtdel"> 
				                         <input id="cmtDelBtn" type="submit" class="btn btn-primary float-right" value="삭제" >
										 <input type="hidden" name="postNo" value="${cmt.postNo}" />
			            				 <input type="hidden" name="commentNo" value="${cmt.commentNo}" />
										 </form:form>
	                          		</sec:authorize>
	                          	</c:when>
	                          </c:choose>
	                     </td>
	                 </tr>
                 </c:if>
	             </c:if>
               </c:forEach>  
             </table>
            
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
               		
               		<input type="hidden" name="cmId" value="<sec:authentication property="principal.id"/>" />    
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