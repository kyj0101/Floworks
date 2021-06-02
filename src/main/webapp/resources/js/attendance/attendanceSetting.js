
let officeInTime = 0;
let officeOffTime = 0;
let lunchTimeStart = 0;
let lunchTimeEnd = 0;

function timeInputNullCheck(){
	
	const $inputs = $(".time-input");
	
	for(input of $inputs){
		
		const time = $(input).val();

		if(time == ""){
			return false;
		}
	}
	
	return true;
}

function memoLengthCheck(){
	
	const memo = $("textarea[name=memo]").val();
	
	if(memo != null && memo.length > 150){
		return false; 
	}
	
	return true;
}


$(function(){
	
	$("input[name=officeInTime]").change(function(){
		
		const $input = $("input[name=officeInTime]");
		const timeStr = $input.val();
		const index = timeStr.indexOf(":"); 
		
		officeInTime = Number(timeStr.substring(0,index));
		
		if(officeInTime < 4 || officeInTime > 12 ){
			
			alert("출근시간이 너무 빠르거나 느립니다.");
			
			$input.val("");
			
		}else if(officeOffTime != 0 && officeInTime > officeOffTime){
			
			alert("출근 시간이 퇴근 시간보다 느립니다.");
			
			$input.val("");
		}
	});

	$("input[name=officeOffTime]").change(function(){
		
		const $input = $("input[name=officeOffTime]");
		const timeStr = $input.val();
		const index = timeStr.indexOf(":"); 
		
		officeOffTime = Number(timeStr.substring(0,index));
		
		if(officeOffTime < 15 || officeOffTime > 23 ){		
			
			alert("퇴근시간이 너무 빠르거나 느립니다.");
			
			$input.val("");
	
		}else if(officeInTime != 0 && officeInTime > officeOffTime){
			
			alert("출근 시간이 퇴근 시간보다 느립니다.");
			
			$input.val("");
		}
	});

	$("input[name=lunchTimeStart]").change(function(){
		
		const $input = $("input[name=lunchTimeStart]");
		const timeStr = $input.val();
		const index = timeStr.indexOf(":");
		
		lunchTimeStart = Number(timeStr.substring(0,index));
		
		if(lunchTimeStart < 11 || lunchTimeStart > 16 ){		
			
			alert("점심 시작 시간이 너무 빠르거나 느립니다.");
			
			$input.val("");
	
		}else if(lunchTimeEnd != 0 && lunchTimeStart > lunchTimeEnd){
			
			alert("점심 시작 시간이 점심 종료 시간보다 느립니다.");
			
			$input.val("");
		}
	});

	$("input[name=lunchTimeEnd]").change(function(){
		
		const $input = $("input[name=lunchTimeEnd]");
		const timeStr = $input.val();
		const index = timeStr.indexOf(":");
		
		lunchTimeEnd = Number(timeStr.substring(0,index));
		
		if(lunchTimeEnd < 12 || lunchTimeEnd > 17 ){		
			
			alert("점심 종료 시간이 너무 빠르거나 느립니다.");
			
			$input.val("");
	
		}else if(lunchTimeEnd != 0 && lunchTimeStart > lunchTimeEnd){
			
			alert("점심 시작 시간이 점심 종료 시간보다 느립니다.");
			
			$input.val("");
		}
	});
	
	$("textarea[name=memo]").keyup(function(){
		
		const $input = $("textarea[name=memo]");
		const $inputMemo = $(".memo-small");

		$inputMemo.text("최대 150자까지 작성 가능합니다. 현재 글자수:" + $input.val().length);
	});


	$(".attendance-setting-submit-btn").click(function(){
	
		if(!timeInputNullCheck()){
			
			alert("모든 시간을 설정해 주세요.");
			
			return false;
			
		}else if(!memoLengthCheck()){
			
			alert("메모 글자수는 최대 150자 입니다.");
			
			return false;
		}
		
		return true;
	});
});