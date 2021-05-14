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

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/email/emailCompose.css" />

<!-- jquery autoComplete -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/email/emailCompose.js"></script>


<section>
	<div class="input-div">
		<div class="email-input-div">
		
			<form action="${pageContext.request.contextPath}/email/send" method="POST" id="send-form" name="upFile" enctype="multipart/form-data">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
				<span>','로 수신자를 여러명 선택할 수 있습니다. (최대 5명)</span>

				<div class="email-btn-div">
	
					<button type="button" class="btn btn-outline-secondary" id="btn-cc">
						참조</button>
	
					<button type="button" class="btn btn-outline-secondary" id="btn-bcc">
						숨은 참조
					</button>
	
					<button class="btn btn-outline-secondary dropdown-toggle"
						type="button" id="dropdownMenu2" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">파일 삭제
						
					</button>
						
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
					
						<button class="dropdown-item file1" type="button">파일1</button>
						<button class="dropdown-item file2" type="button">파일2</button>
						<button class="dropdown-item file3" type="button">파일3</button>
						
					</div>
	
					<button type="button" class="btn btn-outline-secondary"
						>
						<i class="fas fa-share"></i>
					</button>
				
				</div>
	
				<div class="input-group">
					<p class="input-group-text">작성자</p>
					<input type="text" class="form-control" name="id"
						aria-describedby="addon-wrapping"
						value="<sec:authentication property="principal.id"/>" readOnly>
				</div>
	
				<div class="input-group">
					<p class="input-group-text">수신자</p>
					<input type="search" class="form-control recipient-input required-recipient-input"
						name="recipient" aria-describedby="addon-wrapping">
				</div>
	
				<div class="input-group cc-div" id="cc">
					<p class="input-group-text">참조</p>
					<input type="search" class="form-control recipient-input" name="emailCC"
						aria-label="Username" aria-describedby="addon-wrapping">
				</div>
	
				<div class="input-group bcc-div" id="bcc">
					<p class="input-group-text">숨은 참조</p>
					<input type="search" class="form-control recipient-input " name="emailBCC"
						aria-label="Username" aria-describedby="addon-wrapping">
				</div>
	
				<div class="input-group">
					<p class="input-group-text">외부 이메일</p>
					<input type="text" class="form-control required-recipient-input" aria-label="Username" name="externalRecipient"
						aria-describedby="addon-wrapping">
				</div>
	
				<div class="input-group">
					<p class="input-group-text">제목</p>
					<input type="text" class="form-control" placeholder="제목 없음" name="subject"
						aria-label="Username" aria-describedby="addon-wrapping">
				</div>
	
	
				<div class="input-group file-div">
	
					<label class="custom-file-label file1" for="file1">파일을 첨부하세요.</label>
					<input type="file" class="custom-file-input file-input" id="file1" name="uploadFile"> 
					<hr />
					
				</div>
	
				<div class="input-group file-div">
	
					<label class="custom-file-label file2" for="file2">파일을 첨부하세요.</label>
					<input type="file" class="custom-file-input file-input" id="file2" name="uploadFile"> 
					<hr />
					
				</div>
				
				<div class="input-group file-div">
	
					<label class="custom-file-label file3" for="file3">파일을 첨부하세요.</label>
					<input type="file" class="custom-file-input file-input" id="file3" name="uploadFile"> 
					<hr />
					
				</div>
			
			</form>

		</div>

	</div>

	<div class="email-compose-div">
		<textarea name="emailContent" class="textarea"></textarea>
		<div class="btn-div">
			<button type="button" class="btn btn-secondary btn-lg" onclick="history.back();">취소</button>
			<button type="button" class="btn btn-primary btn-lg" id="send-btn">보내기</button>
		</div>

	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>

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
						label : item,
						value : item
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
	e.dataTransfer = e.originalEvent.dataTransfer; //2
	
	dragOver(e);
    
	const files = e.target.files || e.dataTransfer.files;

    $($(this).children()[0]).text(files[0].name);

    if (files.length > 1) {
 
    	alert('한번에 하나씩 올리실 수 있습니다');
    	
        return;
    }
}

$(".dropdown-item").click(function(e){
	
	const $this = $(this);
	const className = $this.attr("class").substring(14);
	const $labels = $(".custom-file-label");
	
	for(let label of $labels){
		
		let $label = $(label);
		
		if($label.hasClass(className)){
			
			$label.text("파일을 첨부하세요.");
			$($label.prev()).val("");
			
			break;
		}
	}

});

function isItFive(recipientInput){
	console.log(recipientInput);

	let index = recipientInput.indexOf(",");
	let count = 0;
	
	while (index !== -1) {
		  count++;
		  
		  if(count >= 5){
			  return index;
		  }
			  
		  index = recipientInput.indexOf(",", index + 1); 
	}
	
	console.log(count);
 
	return -1;
	
}
	
$("#send-btn").click(function(){
	
	const $recipientInputs = $(".required-recipient-input");
	const isBlankRecipient = $($recipientInputs[0]).val().length < 1;
	const isBlankExternal = $($recipientInputs[1]).val().length < 1;

	if(isBlankRecipient && isBlankExternal){
		
		alert("사내 수신자 또는 외부 수신자를 입력하세요.");
		return false;
	}
	
	$("#send-form").submit();
});

$(".custom-file-input").change(function(){
    
	const $this = $(this);
    const fileOriginalName = $this.val().replace('C:\\fakepath\\', " ");
	console.log($(this)[0].files);
    $($this.prev()).text(fileOriginalName);
});


</script>

