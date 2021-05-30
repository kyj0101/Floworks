<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="이메일 임시저장" name="title"/>
</jsp:include>

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<!-- ckeditor-->
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>


<!-- jquery autoComplete -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/email/emailCompose.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailCompose.css" />


<section>
<form action="${pageContext.request.contextPath}/email/draft/send" method="POST" id="send-form" enctype="multipart/form-data">
		<div class="input-div">
			<div class="email-input-div">

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 				
				<input type="hidden" name="emailNo" value="${email.emailNo}" />
				
				<span>','로 수신자를 여러명 선택할 수 있습니다.(최대 5명)</span>

				<div class="email-btn-div">

					<button type="button" class="btn btn-outline-secondary" id="btn-cc">
						참조
					</button>

					<button type="button" class="btn btn-outline-secondary" id="btn-bcc">
						숨은 참조
					</button>

					<button type="button" class="btn btn-outline-secondary" id="btn-draft-update">
						임시 이메일 수정
					</button>

					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary file-del-btn file1">파일1삭제</button>
						<button type="button" class="btn btn-secondary file-del-btn file2">파일2삭제</button>
						<button type="button" class="btn btn-secondary file-del-btn file3">파일3삭제</button>
					</div>

				</div>

				<div class="input-group">
					<p class="input-group-text">작성자</p>
					<input type="text" class="form-control" name="id"
						aria-describedby="addon-wrapping"
						value="<sec:authentication property="principal.id"/>" readOnly>
				</div>

				<div class="input-group">
					<p class="input-group-text">수신자</p>
					<input type="search"
						class="form-control recipient-input required-recipient-input"
						name="recipient" aria-describedby="addon-wrapping"
						value="${email.recipient}">
				</div>

				<div class="input-group cc-div" id="cc">
					<p class="input-group-text">참조</p>
					<input type="search" class="form-control recipient-input"
						name="emailCC" aria-label="Username"
						aria-describedby="addon-wrapping"
						value="${email.emailCC}">
				</div>

				<div class="input-group bcc-div" id="bcc">
					<p class="input-group-text">숨은 참조</p>
					<input type="search" class="form-control recipient-input "
						name="emailBCC" aria-label="Username"
						aria-describedby="addon-wrapping"
						value="${email.emailBCC}">
				</div>

				<div class="input-group">
					<p class="input-group-text">외부 이메일</p>
					<input type="text" class="form-control required-recipient-input"
						aria-label="Username" name="externalRecipient"
						aria-describedby="addon-wrapping"
						value="${email.externalRecipient}">
				</div>

				<div class="input-group">
					<p class="input-group-text">제목</p>
					<input type="text" class="form-control"
						name="subject" aria-label="Username"
						aria-describedby="addon-wrapping"
						value="${email.subject}">
				</div>


				<div class="input-group file-div">
					
					<c:if test="${fileMap.fileOriginalname1 != null}">
						<label class="custom-file-label file1" for="file1">${fileMap.fileOriginalname1}</label>
					</c:if>
					
					<c:if test="${fileMap.fileOriginalname1 == null}">
						<label class="custom-file-label file1" for="file1">파일을 첨부하세요.</label>
					</c:if>
					
					<input type="file" class="custom-file-input file-input" id="file1" name="uploadFile">
					<hr />

				</div>

				<div class="input-group file-div">
					
					<c:if test="${fileMap.fileOriginalname2 != null}">
						<label class="custom-file-label file2" for="file2">${fileMap.fileOriginalname2}</label>
					</c:if>
					
					<c:if test="${fileMap.fileOriginalname2 == null}">
						<label class="custom-file-label file2" for="file2">파일을 첨부하세요.</label>
					</c:if>
					
					<input type="file" class="custom-file-input file-input" id="file2" name="uploadFile">
					<hr />

				</div>

				<div class="input-group file-div">
					
					<c:if test="${fileMap.fileOriginalname3 != null}">
						<label class="custom-file-label file3" for="file3">${fileMap.fileOriginalname3}</label>
					</c:if>
					
					<c:if test="${fileMap.fileOriginalname3 == null}">
						<label class="custom-file-label file3" for="file3">파일을 첨부하세요.</label>
					</c:if>
					
					<input type="file" class="custom-file-input file-input" id="file3" name="uploadFile">
					<hr />

				</div>
				
				<c:if test="${fileMap.fileNo != null}">
						<input type="hidden" name="fileNo" value="${fileMap.fileNo}" />
				</c:if>
				
				<c:if test="${fileMap.fileNo == null}">
						<input type="hidden" name="fileNo" value="0" />
				</c:if>
				
			</div>

		</div>

		<div class="email-compose-div">
			<textarea name="emailContent" class="textarea"></textarea>
			<div class="btn-div">
				<button type="button" class="btn btn-secondary btn-lg"
					onclick="history.back();">취소</button>
				<button type="button" class="btn btn-primary btn-lg" id="draft-send-btn">보내기</button>
			</div>

		</div>
	</form>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>

let fileReName1 = "${fileMap.fileRenamed1}" == "" ? null : "${fileMap.fileRenamed1}";
let fileReName2 = "${fileMap.fileRenamed2}" == "" ? null : "${fileMap.fileRenamed2}";
let fileReName3 = "${fileMap.fileRenamed3}" == "" ? null : "${fileMap.fileRenamed3}";

let fileOriName1 = "${fileMap.fileOriginalname1}" == "" ? null : "${fileMap.fileOriginalname1}";
let fileOriName2 = "${fileMap.fileOriginalname2}" == "" ? null : "${fileMap.fileOriginalname2}"; 
let fileOriName3 = "${fileMap.fileOriginalname3}" == "" ? null : "${fileMap.fileOriginalname3}";


window.onload = ()=>{
    CKEDITOR.replace('emailContent', {
        height: 500,
        filebrowserUploadUrl:"<c:url value='/email/ckupload'/>?${_csrf.parameterName}=${_csrf.token}",

    });   
	
	CKEDITOR.instances['emailContent'].setData("${email.emailContent}");
};

"${email.emailCC}" != "" && $("#cc").toggleClass("cc-div");
"${email.emailBCC}" != "" && $("#bcc").toggleClass("bcc-div");


$("#btn-draft-update").click(function(){
	
	$("#send-form").attr("action","${pageContext.request.contextPath}/email/draftUpdate");
	
	fileSave();
});


$("#draft-send-btn").click(function(){
	
	if(recipientNullCheck()){
		return false;
		
	}else if(checkRecipient($("input[name=id]").val())){
		return false;
		
	}else if(idRegExpCheck()){
		return false;
	
	}else if(recipientDuplicate()){
		return false;
		
	}else if(!exEmailRegExp($("input[name='externalRecipient']").val())){

		$(".required-recipient-input").focus();
		
		return false;
	}
	
	const $titleInput = $("input[name=subject]");
	
	$titleInput.val(titleNullCheck($titleInput.val()));
	
	fileSave();
});

function fileSave(){
	
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	
	const formData = new FormData();
	const files = [file1, file2, file3];
	const fileReNames = [fileReName1, fileReName2, fileReName3];
	const fileOriNames = [fileOriName1, fileOriName2, fileOriName3];
	
	const fileNo = $("input[name='fileNo']").val();
	const $fileNoInput = $("input[name='fileNo']");
	
	for(file of files){
		formData.append("uploadFile", file);
	}
	
	for(fileReName of fileReNames){
		fileReName != null && formData.append("uploadFileReName", fileReName);
	}
	
	for(fileOriName of fileOriNames){
		fileOriName != null && formData.append("uploadFileOriName", fileOriName);
	}
	
	console.log($("#send-form").attr("action"));
	formData.append("fileNo", fileNo);
	
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/email/draftFile/update",
		processData:false,
		contentType:false,
		data:formData,
		beforeSend(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		
		success(no){
			$fileNoInput.val(no);
		},
		
		error(xhr,status,error){
			alert("파일 전송 중 에러가 발생했습니다.");
		},
		
		complete(data,textStatus){
			$("#send-form").submit();
		}
	})//end of ajax 
}

$(".file-del-btn").click(function(e){
	
	const $this = $(this);
	const className = $this.attr("class").substring(31);
	const $labels = $(".custom-file-label");
	
	//파일 이름값 초기화
	if(className === "file1"){
		fileReName1 = null;
		fileOriName1 = null;

	}else if(className === "file2"){
		
		fileReName2 = null;
		fileOriName2 = null;

	}else if(className === "file3"){
		
		fileReName3 = null;
		fileOriName3 = null;
	}
	
	for(let label of $labels){
		
		let $label = $(label);

		if($label.hasClass(className)){
			
			$label.text("파일을 첨부하세요.");
	
			break;
		}
	}
});

$(".recipient-input").autocomplete({
	
	source: function(request, response){
		
		const id = '<sec:authentication property="principal.id"/>'
		const workspaceId = '<sec:authentication property="principal.workspaceId"/>'
		const keyword = request.term;
		const subKeyword = keyword.substring(keyword.lastIndexOf(",") + 1).trim();
		
		$.ajax({
			
			url:"${pageContext.request.contextPath}/email/getRecipientList",
			data:{'searchKeyword':subKeyword, 
				  'workspaceId':workspaceId,
			      'id':id	  
			},
			
			success(data){
				response($.map(data, (item) =>{
	
					return {
						label:item,
						value:item
					}
				})	  
			  );

			},
			
			error(xhr, status, err){
				console.log(xhr, status, err);
			}
			
		});//end of ajax
	},//end of source
	
	focus:function(e, focus){
		return false;
	},
	
	select:function(e, select){
		
		const recipientVal = $(this).val();
		const selectVal = select.item.value;
		const index = recipientVal.lastIndexOf(",") ;
		
		if(index === -1){
			return true;
		}

		const subrecipientVal = recipientVal.substring(0, index); 
		
		$(this).val(subrecipientVal + ", " + selectVal);
		
		return false;
	}
});


</script>