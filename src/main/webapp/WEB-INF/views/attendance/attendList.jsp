<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardList.css" />

<section>
<!-- http://bootstrapk.com/components/#page-header -->
<div class="page-header" >
    <h1>근태 조회(관리자)</h1>
    <hr class="my-4">
</div>

<div class="list-group">
	<a href="#" class="list-group-item list-group-item-action active">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">ㅌㅁㅊ</h5>
        <small>근무 중</small>
      </div>
      <img src="./Images/dog.jpg" alt="프로필사진" class="img-circle" style="width: 45px; height: 45px; margin: 15px auto; border-radius: 50%;">
      <p class="mb-1">Some placeholder content in a paragraph.</p>
      <small>And some small print.</small>
	</a>

    <a href="#" class="list-group-item list-group-item-action">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">ㅇㅅㅇ</h5>
        <small class="text-muted">퇴근</small>
      </div>
      <img src="./Images/dog.jpg" alt="프로필사진" class="img-circle" style="width: 45px; height: 45px; margin: 15px auto; border-radius: 50%;">
      <p class="mb-1">Some placeholder content in a paragraph.</p>
      <small class="text-muted">And some muted small print.</small>
    </a>

    <a href="#" class="list-group-item list-group-item-action">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">ㅂㅇㅊ</h5>
        <small class="text-muted">연차 중</small>
      </div>
      <img src="./Images/dog.jpg" alt="프로필사진" class="img-circle" style="width: 45px; height: 45px; margin: 15px auto; border-radius: 50%;">
      <p class="mb-1">Some placeholder content in a paragraph.</p>
      <small class="text-muted">And some muted small print.</small>
	</a>
</div>
    
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>