const maxSize = "20971520";
let file1 = null;
let file2 = null;
let file3 = null;

function isItMaximum (fileSize){

	if(fileSize > maxSize){
		
		alert("파일이 최대 사이즈를 초과했습니다.");

		return true;
	}
	
	return false;
}

function fileNumberComparison(className, file){
	
	//클래스 값에 따른 파일 변수 초기화
	if(className === "file1"){
		file1 = file;

	}else if(className === "file2"){
		file2 = file;

	}else if(className === "file3"){
		file3 = file;

	}
	
	console.log(file1);
	console.log(file2);
	console.log(file3);
}

function isItFive(recipientInput){

	let index = recipientInput.indexOf(",");
	let count = 0;
	
	while (index !== -1) {
		  count++;
		  
		  if(count >= 5){
			  return index;
		  }
			  
		  index = recipientInput.indexOf(",", index + 1); 
	}

	return -1;	
}

function recipientNullCheck(){
	
	const $recipientInputs = $(".required-recipient-input");
	const isBlankRecipient = $($recipientInputs[0]).val().length < 1;
	const isBlankExternal = $($recipientInputs[1]).val().length < 1;
	
	if(isBlankRecipient && isBlankExternal){
		
		alert("사내 수신자 또는 외부 수신자를 입력하세요.");
		return true;
	}
}

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

function fileAllNullCheck(){
	
	if(file1 === null && file2 === null && file3 === null){
		
		return true;
	}
	
	return false;
}

function titleNullCheck(title){
	
	if(title.trim() === ""){
		return "제목 없음";
	}
	
	return title;
}

function checkRecipient(id){
	
	const $inputRecipient = $("input[name='recipient']");
	const $inputemailCC = $("input[name='emailCC']");
	const $inputemailBCC = $("input[name='emailBCC']");
	
	const inputArr = [$inputRecipient, $inputemailCC, $inputemailBCC];
	const valArr = [$inputRecipient.val(), $inputemailCC.val(), $inputemailBCC.val()];
	
	for(let i = 0; i < valArr.length; i++){

		if(valArr[i].indexOf(id) > -1){
			
			alert("수신자에 자기 자신의 아이디를 입력할 수 없습니다.");
			
			inputArr[i].focus();
			
			return true;
		}
	}
	
	return false;
}

function idRegExpCheck(){
	
	const $inputRecipient = $("input[name='recipient']");
	const $inputemailCC = $("input[name='emailCC']");
	const $inputemailBCC = $("input[name='emailBCC']");
	
	const val =  $inputRecipient.val() + "," +  $inputemailCC.val() + "," + $inputemailBCC.val();
	const valArr = val.split(",");

	for(let i = 0; i < valArr.length; i++){

		if(valArr[i] != "," && !idRegExp(valArr[i].trim())){
			return true;
		}
	}
	
	return false;
}

function recipientDuplicate(){
	
	const $inputRecipient = $("input[name='recipient']");
	const $inputemailCC = $("input[name='emailCC']");
	const $inputemailBCC = $("input[name='emailBCC']");
	
	const val =  ($inputRecipient.val() + "," +  $inputemailCC.val() + "," + $inputemailBCC.val()).replace(/(\s*)/g, "");
	let valArr = val.split(",").filter(val => val != '');
	
	for(arrVal of valArr){

		let fileterArr = valArr.filter(val => val == arrVal);

		if(fileterArr.length >= 2){
			alert("중복된 수신자가 존재합니다.");
			return true;
		}
	}
	
	return false;
}

$(function(){
	
    const $ccBtn = $("#btn-cc");
    const $bccBtn = $("#btn-bcc");
  
    $ccBtn.click(function(){
        $("#cc").toggleClass("cc-div");
    });
  
    $bccBtn.click(function(){
        $("#bcc").toggleClass("bcc-div");
    })
    
    $(".recipient-input").keyup(function(){
	
		const val = $(this).val();
		const index = isItFive(val);
		
		if(index > -1){
			
			alert("수신인은 각 항목당 최대 5명입니다.");
			$(this).val(val.substring(0, index));
			return false;
		} 
	});
	
	$(".required-recipient-input").keyup(function(){
	
		const val = $(this).val();
		const index = isItFive(val);
		
		if(index > -1){
			
			alert("수신인은 각 항목당 최대 5명입니다.");
			
			$(this).val(val.substring(0, index));
			
			return false;	
		}
	});
	
	$(".file-div").on("dragover", dragOver)
                  .on("dragleave", dragOver)
                  .on("drop", uploadFiles);
	
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
		const $content = $('textarea[name="emailContent"]');
		
		$titleInput.val(titleNullCheck($titleInput.val()));
		$content.val(CKEDITOR.instances["emailContent"].getData());


		if(fileAllNullCheck()){
			$("#send-form").submit();
		
		}else{
			saveFile();
		}
	});

});
