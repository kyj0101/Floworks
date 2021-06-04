<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

  

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="게시글 수정하기" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardUpdateForm.css" />

 
<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/board/boardForm.js"></script>


<!-- ckeditor-->
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

 

<section>
<sec:authentication property="principal" var="loginId"/>
<c:if test="${loginId.id eq postList.id || loginId.position eq '대표'}"> 

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
            <div class="btn-group btn-group-toggle" data-toggle="buttons" id="fileButton">
               <button class="btn btn-outline-primary" type="button" name="deleteBtn"  value="${pfList.postFileNo}"  id="option1" >
               	  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark" viewBox="0 0 16 16">
				  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
				  </svg> ${pfList.postOriginalFileName} -삭제하기</button>
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
</c:if>
<c:if test="${loginId.id ne postList.id}"> 
<script>
alert('잘못된 접근입니다');
document.location.href="${pageContext.request.contextPath }/home";
</script>
</c:if>
</section>			 
 
 
<script>

window.onload = ()=>{
    CKEDITOR.replace('postContent', {
        height: 500,
    });   
    

    
};

CKEDITOR.editorConfig = function( config ) {

    config.enterMode = CKEDITOR.ENTER_BR;
    config.fillEmptyBlocks = false;
		
};


$(()=>{
	
	$("[name=deleteBtn]").click(e => {
		
		const csrfHeaderName = "${_csrf.headerName}";
		const csrfTokenValue = "${_csrf.token}";
		const deleteNo = $(e.target).val();
		console.log("daleteNo ",deleteNo)
		
 		$.ajax({
	        type:"post",
	        url:"${pageContext.request.contextPath}/board/fileDelete",
	        data: {deleteNo},
	        //토큰 처리
	        beforeSend(xhr){
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
	        
	        success(no){
		      	alert("선택하신 파일이 삭제되었습니다.");
	        	console.log($(e.target));
	        	$(e.target).hide();

	        },
	        
	        error(xhr,status,error){
				console.log(xhr,status,error);
	            alert("파일 삭제 중 에러가 발생했습니다.");
	        },
	    });//end of ajax 		
	});

	
	
})

</script>






 
 
 
 

 
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>