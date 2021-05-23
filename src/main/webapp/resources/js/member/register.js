function showWarning(p, text){
	
	const $p = $(p);
	
	$p.text(text);
	$p.css("display", "block");
}

function hideWarning(p){
	$(p).css("display", "none");
}

function checkSendEmail(){
	
	if($(".email-p").css("display") == "block"){
		
		alert("이미 인증되었습니다.");
		
		return false;
	}
	
	return true;
}

function warningCheck(){
	
	if($(".input-warning").is(":visible")){
		
		alert("잘못된 입력값이 있습니다.");
			
		return false;		
	}
	
	return true;
}

function emailAuthCheck(){
	
	if(!$(".email-p").is(":visible")){
		
		alert("이메일 인증이 완료되지 않았습니다.");
			
		return false;
	}
	
	return true;
}


function inputNullCheck(){
	
	const inputs = $(".form-control");
	
	for(input of inputs){
	
		if($(input).hasClass("workspace") && $("input[name=createWorkspace]").prop("checked")){
			continue;
		}
		
		if($(input).val() == ""){
			
			alert("입력하지 않은 곳이 있습니다.");
			
			return false;
		}
	}
	
	return true;
}

$(() => {
	
    $("#flexCheckIndeterminate").change((e) => {
      $(".workspace-div").toggle("display-none");
    });
    
    $("input[name=row-password]").change(function(){
	
		const $input = $("input[name=row-password]");
		const password = $input.val();
		const warningP = $input.next().next();
	
		hideWarning(warningP);
		
		if(!passwordRegExp(password, true)){
			showWarning(warningP, "비밀번호는 최소 6자리 최대 15자리인 영문자, 숫자, 특수문자의 조합이어야 합니다.");
		}
	});
    
    $("#inputConfirmPassword").change(function(){
		
		const $input = $("#inputConfirmPassword");
		const passwordCk = $input.val();
		const password = $("input[name=row-password]").val();
		const warningP = $input.next().next();
	
		hideWarning(warningP);
		
		if(password != passwordCk){
			showWarning(warningP, "비밀번호가 일치하지 않습니다.");
		}
	});
	
	$("input[name=name]").change(function(){
		
		const $input = $("input[name=name]");
		const name = $input.val();
		const warningP = $input.next().next();
	
		hideWarning(warningP);
		
		if(!nameRegExp(name, true)){
			showWarning(warningP, "올바른 이름이 아닙니다.");
		}
	});
	
	$("input[name=createWorkspace]").change(function(){
		
		const $input = $("input[name=createWorkspace]");
		
		console.log($input.prop("checked"));
		console.log($("input[name=workspaceId]"));
		
		if($input.prop("checked")){
			$("input[name=workspaceId]").attr("readOnly", true);
		
		}else{
			$("input[name=workspaceId]").attr("readOnly", false);
		}
	})


 });