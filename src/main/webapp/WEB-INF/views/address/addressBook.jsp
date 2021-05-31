<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="주소록" name="title"/>
</jsp:include>

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
				</div>
			</form>
		</div>						          
	</div>
	<hr class="my-4">
<div class="d-flex flex-column align-items-stretch bg-white">
	<div class="list-group list-group-flush border-bottom scrollarea">
		
		<c:forEach items="${memberList}" var="member">
		<form:form action="${pageContext.request.contextPath}/address/delete" method="POST">
			
			<input type="hidden" name="owner" value="<sec:authentication property='principal.id'/>" />
			<input type="hidden" name="id" value="${member.id}" />
			
			<a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
				<div class="row g-0">
					<div class="col-1">
						<img src="${pageContext.request.contextPath }/resources/upload/profile/${member.profileFileRename}" alt="프로필사진" class="img-circle"
						style="width: 45px; height: 45px; margin: 15px auto; border-radius: 50%;">
					</div>
		
					<div class="col-11">
						<div class="row g-0 mb-4">
	
							<div class="col">
								<strong>Name: </strong> <span>${member.name}</span>
							</div>
							
							<div class="col">
								<strong>부서: </strong> <span>${member.department}</span>
							</div>
							
							<div class="col">
								<strong>직급: </strong> <span>${member.position}</span>
							</div>
	
						</div>
	
						<div class="row g-0 mb-4">
	
							<div class="col">
								<strong>E-mail:</strong> <span>${member.email}</span>
							</div>
							
							<div class="col">
								<strong>ID</strong> <span>${member.id}</span>
							</div>
	
							<div class="col-2">
								<button type="button" class="address-btn btn btn-primary" id="email-btn" onclick="location.href='${pageContext.request.contextPath}/email/compose?defaultRecipient=${member.id}'">
									<i class="bi bi-envelope-fill"></i>
								</button>
							</div>
							
							<div class="col-2">
								<button type="submit" class="address-btn btn btn-secondary"> 
									<i class="bi bi-trash-fill"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</a>
		</form:form>
		</c:forEach>		
	</div>
</div>

<hr class="my-4">
${pageBar}
		
</section>

	
<!-- Modal -->
<div class="modal fade"  id="memberModal"  data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">주소록에 사원 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="location.href='${pageContext.request.contextPath}/address/list?owner=<sec:authentication property="principal.id"/>'">
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

			</ul>
		</div>
		

	  </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

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
	const owner = "<sec:authentication property='principal.id'/>";
	
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
			   'owner':owner
			   },
		
		success(data){
				   
			if(data.length == 0){
				alert("검색 결과가 없습니다.");
			}
			
			for(member of data){

				let html = "<li class='member-list-li'>";
				html += "<img src='${pageContext.request.contextPath }/resources/upload/profile/" + member.profileFileRename  +"' alt='프로필사진' class='img-circle'>";
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

$(".member-list-ul").on('click', "button", add);


function add(e){
	
	const id = $(e.target).prev().val()
	const owner = "<sec:authentication property='principal.id'/>";
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	
	$.ajax({
		
		type:"post",
		url:"${pageContext.request.contextPath}/address/add",
		data:{'id':id, "owner":owner},
		dataType:"text",
		beforeSend(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		
		success(result){
			alert(result);
			$(e.target).attr("disabled", true);
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}	
	});
}

</script>


