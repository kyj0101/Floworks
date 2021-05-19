<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
 
<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/board/boardForm.js"></script>
 

 
<section>
    <!-- http://bootstrapk.com/components/#page-header -->
    <div class="page-header" >
        <h1>공지사항</h1>
        <hr class="my-4">
    </div>

    <div id="board-write">
        <form:form
        	name="boardEn" 
			action="${pageContext.request.contextPath}/board/boardEnroll" 
			method="post"
			enctype="multipart/form-data" 
			onsubmit="return boardValidate();">
            <input type="text" class="form-control mb-3" placeholder="제목을 입력하세요" name="postTitle" id="title">
            
            <input type="hidden" name="id" value="${loginMember.id}" >

            
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
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                </div>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="inputGroupFile01" name="upFile" aria-describedby="inputGroupFileAddon01">
                  <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
                </div>
            </div>
            <div class="form-group">
              <textarea class="form-control" id="exampleFormControlTextarea1" name="postContent" rows="10" placeholder="내용을 입력하세요"></textarea>
            </div>
            <input id="submitbtn" type="submit" class="btn btn-primary float-right" value="작성하기" >
        </form:form>
    </div>
    
</section>

 
 
 
 
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>