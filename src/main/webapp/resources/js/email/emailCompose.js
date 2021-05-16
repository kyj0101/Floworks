$(()=>{
    const $ccBtn = $("#btn-cc");
    const $bccBtn = $("#btn-bcc");
  
    $ccBtn.click(function(){
        $("#cc").toggleClass("cc-div");
    });
  
    $bccBtn.click(function(){
        $("#bcc").toggleClass("bcc-div");
    })
    
});

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