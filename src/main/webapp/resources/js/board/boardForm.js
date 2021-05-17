function boardValidate(){
	var $content = $("[name=postTitle]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("제목을 입력하세요");
		return false;
	}
	return true;
}


$(() => {
	$("[name=upFile]").change(e => {
		var $file = $(e.target); // input[type=file]
		var f = $file.prop("files")[0]; // file객체
		//console.log($file, f);
		var $label = $file.next(".custom-file-label");
		
		if(f === undefined)
			$label.text("파일을 선택하세요.");
		else 
			$label.text(f.name);
	});
	
});