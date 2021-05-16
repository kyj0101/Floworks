<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<!-- ckeditor-->
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>


<!-- jquery autoComplete -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/email/emailCompose.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailCompose.css" />

<section>
<form action="${pageContext.request.contextPath}/email/send" method="POST" id="send-form" enctype="multipart/form-data">
		<div class="input-div">
			<div class="email-input-div">

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <span>','로 수신자를 여러명 선택할 수 있습니다.
					(최대 5명)</span>

				<div class="email-btn-div">

					<button type="button" class="btn btn-outline-secondary" id="btn-cc">
						참조</button>

					<button type="button" class="btn btn-outline-secondary"
						id="btn-bcc">숨은 참조</button>

					<button type="button" class="btn btn-outline-secondary">
						<i class="fas fa-share"></i>
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
						name="recipient" aria-describedby="addon-wrapping">
				</div>

				<div class="input-group cc-div" id="cc">
					<p class="input-group-text">참조</p>
					<input type="search" class="form-control recipient-input"
						name="emailCC" aria-label="Username"
						aria-describedby="addon-wrapping">
				</div>

				<div class="input-group bcc-div" id="bcc">
					<p class="input-group-text">숨은 참조</p>
					<input type="search" class="form-control recipient-input "
						name="emailBCC" aria-label="Username"
						aria-describedby="addon-wrapping">
				</div>

				<div class="input-group">
					<p class="input-group-text">외부 이메일</p>
					<input type="text" class="form-control required-recipient-input"
						aria-label="Username" name="externalRecipient"
						aria-describedby="addon-wrapping">
				</div>

				<div class="input-group">
					<p class="input-group-text">제목</p>
					<input type="text" class="form-control"
						name="subject" aria-label="Username" value="제목 없음"
						aria-describedby="addon-wrapping">
				</div>


				<div class="input-group file-div">

					<label class="custom-file-label file1" for="file1">파일을
						첨부하세요.</label> <input type="file" class="custom-file-input file-input"
						id="file1" name="uploadFile">
					<hr />

				</div>

				<div class="input-group file-div">

					<label class="custom-file-label file2" for="file2">파일을
						첨부하세요.</label> <input type="file" class="custom-file-input file-input"
						id="file2" name="uploadFile">
					<hr />

				</div>

				<div class="input-group file-div">

					<label class="custom-file-label file3" for="file3">파일을
						첨부하세요.</label> <input type="file" class="custom-file-input file-input"
						id="file3" name="uploadFile">
					<hr />

				</div>

				<input type="hidden" name="fileNo" value="0" />

			</div>

		</div>

		<div class="email-compose-div">
			<textarea name="emailContent" class="textarea"></textarea>
			<div class="btn-div">
				<button type="button" class="btn btn-secondary btn-lg"
					onclick="history.back();">취소</button>
				<button type="button" class="btn btn-primary btn-lg" id="send-btn">보내기</button>
			</div>

		</div>
	</form>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
window.onload = ()=>{
    CKEDITOR.replace('emailContent', {
        height: 500,
        filebrowserUploadUrl:"<c:url value='/email/ckupload'/>?${_csrf.parameterName}=${_csrf.token}",

    });
   
};

CKEDITOR.editorConfig = function( config ) {
    config.filebrowserUploadMethod = "form";
};
const maxSize = "20971520";
let file1 = null;
let file2 = null;
let file3 = null;

$(".recipient-input").keyup(function(){
	
	const val = $(this).val();
	const index = isItFive(val);
	
	if(index > -1){
		
		alert("수신인은 각 항목당 최대 5명입니다.");
		$(this).val(val.substring(0, index));
		return false;
	} 
});

$(".recipient-input").autocomplete({
	
	source: function(request, response){
	
		const keyword = request.term;
		const subKeyword = keyword.substring(keyword.lastIndexOf(",") + 1).trim();
		
		$.ajax({
			
			url:"${pageContext.request.contextPath}/email/getRecipientList",
			data:{ searchKeyword:subKeyword },
			
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

$(".file-div").on("dragover", dragOver)
              .on("dragleave", dragOver)
              .on("drop", uploadFiles);

function dragOver(e){

	e.stopPropagation();
	e.preventDefault();
	
	if(e.type == "dragover"){
		
		$(e.target).css({
			"background-color": "rgb(221 221 221)"
		})
		
	}else{
		
		$(e.target).css({
			 "background-color": "#fff"
		})
	 
	}
}

function uploadFiles(e){
	
	e.stopPropagation();
	e.preventDefault();
	e.dataTransfer = e.originalEvent.dataTransfer; 
	
	dragOver(e);
    
	const files = e.target.files || e.dataTransfer.files;
	const file = files[0];
	
	if (files.length > 1) {
		 
    	alert('한번에 하나씩 올리실 수 있습니다');
    	
        return;
        
    }else if(isItMaximum(file.size)){
    	return;
    }
	
	const className = $(e.target).attr("class").substring("18");
	fileNumberComparison(className, file)

    $($(this).children()[0]).text(files[0].name);
   
}

$(".file-del-btn").click(function(e){
	
	const $this = $(this);
	const className = $this.attr("class").substring(31);
	const $labels = $(".custom-file-label");

	
	for(let label of $labels){
		
		let $label = $(label);
		
		if($label.hasClass(className)){
			
			$label.text("파일을 첨부하세요.");
			fileNumberComparison(className, null);
			
			break;
		}
	}

});

$(".custom-file-input").change(function(){
    
	const $this = $(this);

	if(isItMaximum($this[0].files[0].size)){
		
		$this.val("");

		return false;
	}
	
	const fileId = $this.attr("id")
	const file = $this[0].files[0];
	
	fileNumberComparison(fileId, file)
	
    const fileOriginalName = $this.val().replace('C:\\fakepath\\', " ");
    
    $($this.prev()).text(fileOriginalName);
});

$("#send-btn").click(function(){

	const $recipientInputs = $(".required-recipient-input");
	const content = $('textarea[name="emailContent"]').val();
	const isBlankRecipient = $($recipientInputs[0]).val().length < 1;
	const isBlankExternal = $($recipientInputs[1]).val().length < 1;

	if(isBlankRecipient && isBlankExternal){
		
		alert("사내 수신자 또는 외부 수신자를 입력하세요.");
		return false;
	}
	
	$('textarea[name="emailContent"]').val(CKEDITOR.instances["emailContent"].getData())

	if(file1 === null && file2 === null && file3 === null){
		
		$("#send-form").submit();
	
	}else{
		
		//드래그 앤 드랍 기능 때문에 파일을 먼저 ajax로 전송함.
		
		const csrfHeaderName = "${_csrf.headerName}";
		const csrfTokenValue = "${_csrf.token}";
		const $fileInput = $("input[name='fileNo']");
		const formData = new FormData();
		const files = [file1, file2, file3];
		
		for(file of files){
			formData.append("uploadFile", file);
		}
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/email/saveFile",
			processData:false,
			contentType:false,
			data:formData,
			beforeSend(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			
			success(no){
				console.log("no is" +no);
				$fileInput.val(no);
			},
			
			error(xhr,status,error){
				alert("파일 전송 중 에러가 발생했습니다.");
			},
			
			complete(data,textStatus){
				$("#send-form").submit();
			}
		})//end of ajax 
	}

});




</script>

