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

    <div class="dropdown d-inline-block mb-2">
        <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownboardButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          부서
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownboardButton" id="dropdowndept">
          <a class="dropdown-item" href="boardList?dept=기획부&boardNo=${boardNo}&workspaceId=<sec:authentication property="principal.workspaceId"/>">기획부</a>
          <a class="dropdown-item" href="boardList?dept=개발부&boardNo=${boardNo}&workspaceId=<sec:authentication property="principal.workspaceId"/>">개발부</a>
          <a class="dropdown-item" href="boardList?dept=총무부&boardNo=${boardNo}&workspaceId=<sec:authentication property="principal.workspaceId"/>">총무부</a>
          <a class="dropdown-item" href="boardList?dept=국내영업부&boardNo=${boardNo}&workspaceId=<sec:authentication property="principal.workspaceId"/>">국내영업부</a>
          <a class="dropdown-item" href="boardList?dept=마케팅부&boardNo=${boardNo}&workspaceId=<sec:authentication property="principal.workspaceId"/>">마케팅부</a>
          <a class="dropdown-item" href="boardList?dept=회계관리부&boardNo=${boardNo}&workspaceId=<sec:authentication property="principal.workspaceId"/>">회계관리부</a>
          <a class="dropdown-item" href="boardList?dept=부&boardNo=${boardNo}&workspaceId=<sec:authentication property="principal.workspaceId"/>">전체보기</a>
        </div>
      </div>
      

    <sec:authentication property="principal" var="loginId"/>  
    <c:choose>
    	<c:when test="${boardNo eq 2}">
    		<input type="button" class="btn btn-primary d-inline-block float-right"
    		value="글쓰기" onclick="goBoardForm(${boardNo});"/>
    	</c:when>
    	<c:when test="${boardNo eq 1}">
			<sec:authorize access="hasRole('ADMIN')">
				<input type="button" class="btn btn-primary d-inline-block float-right"
		    		value="글쓰기" onclick="goBoardForm(${boardNo});"/>
			</sec:authorize> 	
    	</c:when>
    </c:choose>
    	
    		
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
              <!-- 
              	<c:if test="${loginId.workspaceId eq post.workspaceId}"> 
               -->
				<tr data-no="${post.postNo}">
					<td>${post.postNo}</td>
					<td>${post.departmentName}</td>
					<td id="titletd">${post.postTitle}<c:if test="${post.commentCount gt 0}"> [${post.commentCount}]</c:if>
					</td>
					<td>${post.name}</td>
					<td >
						<c:if test="${post.fileCount gt 0}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark" viewBox="0 0 16 16">
  						<path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
						</svg> x${post.fileCount}
						</c:if>
					</td>	
					<td><fmt:formatDate value="${post.postDate}" pattern="yy/MM/dd"/></td>
					<td>${post.postReadCount}</td>
				</tr>
				  <!-- 
				</c:if>
				   -->
			  </c:forEach>
		    </c:if>
            </tbody>
        </table>

        <br>
		${pageBar}
    </div>
</section> 

 
 
 
 
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>