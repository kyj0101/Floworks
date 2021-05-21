
function exEmailRegExp(email){
	
	if(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(email) || email == ""){
		return true;
		
	}else{
		alert("외부 이메일 형식이 올바르지 않습니다.");
	
		return false;
	}
}

function idRegExp(id){

	if(/^[a-zA-Z0-9]*$/.test(id) || id == ""){
		return true;
	
	}else{
		
		alert("아이디 형식이 올바르지 않습니다.");
		
		return false;
	}	
}