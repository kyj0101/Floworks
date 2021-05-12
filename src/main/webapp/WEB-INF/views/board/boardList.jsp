<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardList.css" />



<section>
  <!-- http://bootstrapk.com/components/#page-header -->
    <div class="page-header" >
        <h1>공지사항</h1>
        <hr class="my-4">
    </div>

    <div class="dropdown d-inline-block mb-2">
        <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownboardButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          부서
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownboardButton">
          <a class="dropdown-item" href="#">A부서</a>
          <a class="dropdown-item" href="#">B부서</a>
          <a class="dropdown-item" href="#">S부서</a>
        </div>
      </div>
    <button type="button" class="btn btn-primary d-inline-block float-right"
    		location-href="${pageContext.request.contextPath }/board/boardEnroll" >글쓰기</button>
    <div id="board-list">
        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col" class="table-num">번호</th>
                <th scope="col" class="table-dept">부서</th>
                <th scope="col" class="table-title">제목</th>
                <th scope="col" class="table-name">작성자</th>
                <th scope="col" class="table-file">첨부파일</th>
                <th scope="col" class="table-count">조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row" class="table-num">1</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">월차사용 안내입니다</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">2</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">사이트 이용 가이드</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">3</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">개인정보 수집 정책</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">4</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">여름휴가 사용 안내입니다</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">5</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">안내사항 입니다</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">6</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">@mdo</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">7</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">@mdo</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">8</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">공지글 반드시 확인 하시길 바랍니다</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">9</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">5월 2주차 공지글 입니다</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
              <tr>
                <th scope="row" class="table-num">10</th>
                <td class="table-dept">Otto</td>
                <td class="table-title">@mdo</td>
                <td class="table-name">@mdo</td>
                <td class="table-file">@mdo</td>
                <td class="table-count">@mdo</td>
              </tr>
            </tbody>
        </table>

        <br>
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
    
</section> 

 
 
 
 
 
 
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>