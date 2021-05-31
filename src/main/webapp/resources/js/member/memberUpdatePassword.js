$(function(){
	$("#submit-btn").click(function(){

		if(!inputNullCheck() || !warningCheck()){
			return false;
		
		}else{
			$("#update-password-form").submit();
		}
	});
});