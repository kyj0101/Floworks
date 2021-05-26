<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/addressBook/addressBook.css" />

<!-- jquery autoComplete -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


<section>
	<div class="page-header">

		<div class="row g-0">
			<h2 class="col-8">직원 주소록</h2>

			<form class="col-4" action="#">
				<div class="input-group">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#memberModal">
					  주소록에 사원 추가하기
					</button>

					
					<!--나중에 session이나 다른 기능으로 받아와야할 것 들-->
					<datalist id="datalistOptions">

					</datalist>
				</div>
			</form>
		</div>						          
	</div>
	<hr class="my-4">
	
<!-- Modal -->
<div class="modal fade"  id="memberModal"  data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주소록에 사원 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body member-modal-body ">
		<form class="col-12" action="#">
			<div class="input-group">
			
			<select class="form-select form-select-sm small search-type" aria-label="분류" style="width: 70px; height: 50px; border-radius: 10px 0px 0px 10px; border-color: gainsboro;">
				<option class="search-option" selected>분류</option>
				<option class="search-option" value="department_name">부서</option>
				<option class="search-option" value="position">직급</option>
				<option class="search-option" value="name">이름</option>
			</select> 
			
			<input type="search" class="form-control bg-light border-0 small" list="datalistOptions" id="member-search" placeholder="검색어를 입력하세요." aria-label="Search" aria-describedby="basic-addon2" style="height: 50px;">
			
			<div class="input-group-append">
				<button class="btn btn-primary search-btn" type="button" style="height: 50px; border-radius: 0px 10px 10px 0px;">
					<i class="bi bi-search"></i>
				</button>
			</div>
			
			</div>
		</form>
		<hr />
		<div>
			<ul class="member-list-ul">
				<hr />	
			</ul>
		</div>
		

	  </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

	<div class="d-flex flex-column align-items-stretch bg-white">
		<div class="list-group list-group-flush border-bottom scrollarea">

			<!--나중에 script함수로 class속성에 active 추가-->
			<!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

			<a href="#"
				class="list-group-item list-group-item-action py-3 lh-tight">
				<div class="row g-0">
					<div class="col-1">
						<i class="fas fa-user-circle" style="color: pink;"></i>
					</div>

					<div class="col-11">
						<div class="row g-0 mb-4">

							<div class="col">
								<strong>Name: </strong> <span>강준혁</span>
							</div>
							<div class="col">
								<strong>부서: </strong> <span>SCM department</span>
							</div>
							<div class="col">
								<strong>직급: </strong> <span>대리</span>
							</div>


						</div>

						<div class="row g-0 mb-4">

							<div class="col">
								<strong>E-mail:</strong> <span>qwert@naver.com </span>
							</div>


							<div class="col"></div>

							<div class="col">
								<button type="button" class="btn btn-primary">메일 보내기</button>
							</div>
						</div>
					</div>
				</div>
			</a>
		</div>

		<hr class="my-4">

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&lt;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&gt;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>

$('#myModal').on('shown.bs.modal', function () {
	  $('#memberModal').trigger('focus')
});

$('#myModal').modal('handleUpdate');


function find(){

	const type = $(".search-option:selected").val();
	const keyword = $("#member-search").val();
	const workspaceId = "<sec:authentication property='principal.workspaceId'/>";
	const id = "<sec:authentication property='principal.id'/>";
	
	if(type === "분류") {
		
		alert("분류를 선택하세요.");
		
		return false;
	}

	if(keyword === ""){
		
		alert("검색어를 입력하세요.")
		
		return false;
	}
	
	const $ul = $(".member-list-ul");
	$ul.html("");
	
	$.ajax({
		
		url:"${pageContext.request.contextPath}/address/search",
		data:{ 'type':type, 
			   'keyword':keyword, 
			   'workspaceId':workspaceId, 
			   'id':id
			   },
		
		success(data){
			for(member of data){

				let html = "<li class='member-list-li'>";
				html += "<img src='${pageContext.request.contextPath }/resources/upload/profile/<sec:authentication property='principal.profileFileRename'/>' alt='프로필사진' class='img-circle'>";
				html += "<p>이름 :" + member.name + "</p>";
				html += "<p>부서 :" + member.department + "</p>";
				html += "<p>직급 :" + member.position + "</p>";
				html += "<input type='hidden' value='" + member.id + "'/>";
				html += "<button type='button' class='btn btn-primary add-btn'>추가</button>";
				html += "</li>";
				html += "<hr/>";
	
				$ul.append(html);

			}
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}	
	});
}



$(".search-btn").on('click', find);

function add(e){
	console.log($(e.target).prev().val());
}

$(".member-list-ul").on('click', "button", add);

</script>


