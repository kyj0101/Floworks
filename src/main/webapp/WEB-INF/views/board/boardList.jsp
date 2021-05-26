<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>



   
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardList.css" />

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/board/boardList.js"></script>


<section>
  <!-- http://bootstrapk.com/components/#page-header -->
    <div class="page-header" >
        <h1>게시판</h1>
        <hr class="my-4">
    </div>

    <div class="dropdown d-inline-block mb-2">
        <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownboardButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          부서
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownboardButton">
          <a class="dropdown-item" href="boardList?dept=기획부">기획부</a>
          <a class="dropdown-item" href="boardList?dept=개발부">개발부</a>
          <a class="dropdown-item" href="boardList?dept=총무부">총무부</a>
          <a class="dropdown-item" href="boardList?dept=국내영업부">국내영업부</a>
          <a class="dropdown-item" href="boardList?dept=마케팅부">마케팅부</a>
          <a class="dropdown-item" href="boardList?dept=회계관리부">회계관리부</a>
          <a class="dropdown-item" href="boardList?dept=">전체보기</a>
        </div>
      </div>
    <input type="button" class="btn btn-primary d-inline-block float-right"
    		value="글쓰기" onclick="goBoardForm(${list[0].boardNo});"/>
    <div id="board-list">
        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col" class="table-num">번호</th>
                <th scope="col" class="table-dept">부서</th>
                <th scope="col" class="table-title">제목</th>
                <th scope="col" class="table-name">작성자</th>
                <th scope="col" class="table-file">첨부파일</th>
                <th scope="col" class="table-date">작성일</th>
                <th scope="col" class="table-count">조회수</th>
              </tr>
            </thead>
            <tbody>
            <c:if test="${list != null}">
              <c:forEach items="${list}" var="post">
				<tr data-no="${post.postNo}">
					<td>${post.postNo}</td>
					<td>${post.departmentName}</td>
					<td>${post.postTitle}<c:if test="${post.commentCount gt 0}"> [${post.commentCount}]</c:if>
					</td>
					<td>${post.name}</td>
					<td>
						<c:if test="${post.fileCount gt 0}">
						${post.fileCount}
						</c:if>
					</td>	
					<td><fmt:formatDate value="${post.postDate}" pattern="yy/MM/dd"/></td>
					<td>${post.postReadCount}</td>
				</tr>
			  </c:forEach>
		    </c:if>
            </tbody>
        </table>

        <br>
		${pageBar}
    </div>
</section> 

 
 
 
 
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>