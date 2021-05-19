<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
 
 
<section>
    <!-- http://bootstrapk.com/components/#page-header -->
    <div class="page-header" >
        <h1>공지사항</h1>
        <hr class="my-4">
    </div>

    <div id="board-write">
        <form>
            <input type="text" class="form-control mb-3" placeholder="제목을 입력하세요" name="title" id="title" required>
            <div class="input-group mb-1" id="addFile">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                </div>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                  <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
                </div>
            </div>
            <div class="input-group mb-1" id="addFile">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                </div>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                  <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
                </div>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                </div>
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                  <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
                </div>
            </div>
            <div class="form-group">
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="내용을 입력하세요"></textarea>
            </div>
            <input id="submitbtn" type="submit" class="btn btn-primary float-right" value="작성하기" >
        </form>
    </div>
    
</section>

 
 
 
 
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>