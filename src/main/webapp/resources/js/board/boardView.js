function fileDownload(postFileNo){
	location.href = `fileDownload?postFile=${postFileNo}`;
}

function postUpdate(postNo){
	location.href = `boardUpdateForm?postNo=${postNo}`;
}

function postDelete(postNo, boardNo){
	if(confirm(`${postNo}번 게시글을 삭제하시겠습니까?`)){
		location.href = `postDelete?postNo=${postNo}&boardNo=${boardNo}`;		
	console.log(postNo, boardNo);
	}
}

function commentValidate(){
	var $content = $("[name=commentContent]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("댓글을 입력하세요");
		return false;
	}
	return true;
}

function commentDelete(postNo, commentNo){
	if(confirm(`${commentNo}번 댓글을 삭제하시겠습니까?`)){
		console.log(postNo, commentNo)
		location.href = `commentDelete?postNo=${postNo}&commentNo=${commentNo}`;		
	}
}




