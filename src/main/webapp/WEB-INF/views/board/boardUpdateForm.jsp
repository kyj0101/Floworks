<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

  
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
 
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardUpdateForm.css" />

 
<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/board/boardForm.js"></script>


<!-- ckeditor-->
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

 

 
<section>
   <!-- http://bootstrapk.com/components/#page-header -->
    <div class="page-header" >
        <h1>게시글 수정</h1>
        <hr class="my-4">
    </div>

    <div id="board-write">
        <form:form
        	name="boardUp" 
			action="${pageContext.request.contextPath}/board/postModify" 
			method="post"
			enctype="multipart/form-data" 
			onsubmit="return boardValidate();">
            <input type="text" class="form-control mb-3" value="${postList.postTitle}"  name="postTitle" id="title">
            <input type="hidden" class="form-control mb-3" value="${postList.postNo}"  name="postNo">
            <input type="hidden" class="form-control mb-3" value="${postList.boardNo}"  name="boardNo">
            
            <c:forEach items="${postList.postFileList}" var="pfList">
         	<c:if test="${pfList.postOriginalFileName != null}">
            <div class="input-group mb-1" id="addFile">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                </div>
                <div class="custom-file">
                  <input type="file" name="upFile" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                  <label class="custom-file-label" for="inputGroupFile01">${pfList.postOriginalFileName}</label>
                </div>
            </div>
            </c:if>
         	</c:forEach>
         
           <div class="input-group mb-1" id="addFile">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                </div>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="inputGroupFile01" name="upFile" aria-describedby="inputGroupFileAddon01">
                  <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
                </div>
            </div>
            <div class="input-group mb-1" id="addFile">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                </div>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="inputGroupFile01" name="upFile" aria-describedby="inputGroupFileAddon01">
                  <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
                </div>
            </div>
            
            <div class="form-group">
              <textarea class="form-control"  name="postContent">${postList.postContent}</textarea>
            </div>
            <input id="update-btn" type="submit" class="btn btn-primary float-right" value="수정하기" >
        </form:form>
    </div>
    
</section>			 
 
 
<script>
window.onload = ()=>{
    CKEDITOR.replace('postContent', {
        height: 500,
    });   
};
CKEDITOR.editorConfig = function( config ) {
    config.filebrowserUploadMethod = "form";

    config.enterMode = CKEDITOR.ENTER_BR;
    config.fillEmptyBlocks = false;
};
</script>






 
 
 
 

 
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>