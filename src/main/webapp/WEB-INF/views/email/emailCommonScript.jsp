<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!-- taglib를 써야해서 js파일에 추가하지 못하는 이메일 작성 공통 코드들 -->

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




$(".recipient-input").autocomplete({
	
	source: function(request, response){
		
		const workspaceId = '<sec:authentication property="principal.workspaceId"/>'
		const keyword = request.term;
		const subKeyword = keyword.substring(keyword.lastIndexOf(",") + 1).trim();
		
		$.ajax({
			
			url:"${pageContext.request.contextPath}/email/getRecipientList",
			data:{ 'searchKeyword':subKeyword, 'workspaceId':workspaceId},
			
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

$("#btn-save").click(function(){

	$("#send-form").attr("action","${pageContext.request.contextPath}/email/save");
	
	if(file1 === null && file2 === null && file3 === null){
		$("#send-form").submit();
	
	}else{
		saveFile();
	}
	
});

function saveFile(){
	
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

</script>