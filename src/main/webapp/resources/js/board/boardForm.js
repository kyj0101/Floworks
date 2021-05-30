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
		
		if($addFileBtn.val()){
			//파일을 선택한 경우 #delFile체크
			$("#delFile").prop("checked", true);
		}
		else {
			//파일선택을 취소한 경우 #delFile체크해제
			$("#delFile").prop("checked", false);
		}

	});
	
});

$(() => {
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	$("[name=deleteBtn]").onclick(e => {	
		var deleteNo = $(e.target).val();
		console.log(deleteNo);
		  
		
	});
	$.ajax({
	        type:"post",
	        url:"${pageContext.request.contextPath}/fileDelete",
	        data: {deleteNo},
	        //토큰 처리
	        beforeSend(xhr){
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
	        
	        success(no){
	          
	        },
	        
	        error(xhr,status,error){
	            alert("파일 삭제 중 에러가 발생했습니다.");
	        },
	    });//end of ajax 

});







CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'ko'; // 언어는 한글
	// config.uiColor = '#AADC6E'; // 배경색
	config.enterMode = '2' ,// 엔터모드는 <br/>
	config.toolbarCanCollapse = true; // 에디터 메뉴 축소/확대 가능 버튼 보이기
	config.resize_dir = 'both'  //  사이즈 둘 다 조정
	config.resize_minWidth = 200;
	//config.resize_maxWidth = 400;
	config.resize_minHeight = 200;
	config.resize_maxHeight = 600;
    // 업로드 설정
    config.filebrowserUploadUrl      = '/upld/uploadFile.do?type=Files',
    config.filebrowserImageUploadUrl = '/upld/uploadFile.do?type=Images',
    config.filebrowserWindowWidth = '640',
    config.filebrowserWindowHeight= '480'
    // 메뉴 버튼
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		'/', // 다음줄
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
    ],
    
    // 메뉴 버튼 삭제
    config.removeButtons = 'Save,NewPage,Preview,Print,Templates,Paste,Copy,Cut,PasteText,PasteFromWord,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Language,Anchor,Flash,Smiley,PageBreak,Iframe,Maximize,ShowBlocks,Outdent,Indent,Blockquote,CreateDiv,BidiRtl,BidiLtr,HorizontalRule,CopyFormatting',
    
    // 자동 크기조절(autogrow)
    config.extraPlugins = 'autogrow';
    config.autoGrow_minHeight = 200;
    config.autoGrow_maxHeight = 600;
    config.autoGrow_bottomSpace = 50; 
    
	// 화면에 보여질 버튼들..
    // 이걸 싹지우면 버튼이 아예 안보입니다 ..
    config.plugins =
		'about,' +
		'a11yhelp,' +
		'basicstyles,' +
		'bidi,' +
		'blockquote,' +
		'clipboard,' +
		'colorbutton,' +
		'colordialog,' +
		'copyformatting,' +
		'contextmenu,' +
		'dialogadvtab,' +
		'div,' +
		'elementspath,' +
		'enterkey,' +
		'entities,' +
		'filebrowser,' +
		'find,' +
		'flash,' +
		'floatingspace,' +
		'font,' +
		'format,' +
		'forms,' +
		'horizontalrule,' +
		'htmlwriter,' +
		'image,' +
		'iframe,' +
		'indentlist,' +
		'indentblock,' +
		'justify,' +
		'language,' +
		'link,' +
		'list,' +
		'liststyle,' +
		'magicline,' +
		'maximize,' +
		'newpage,' +
		'pagebreak,' +
		'pastefromword,' +
		'pastetext,' +
		'preview,' +
		'print,' +
		'removeformat,' +
		'resize,' +
		'save,' +
		'selectall,' +
		'showblocks,' +
		'showborders,' +
		'smiley,' +
		'sourcearea,' +
		'specialchar,' +
		'stylescombo,' +
		'tab,' +
		'table,' +
		'tableselection,' +
		'tabletools,' +
		'templates,' +
		'toolbar,' +
		'undo,' +
		'uploadimage,' +
		'wysiwygarea';
	// %REMOVE_END%
};

CKEDITOR.on('dialogDefinition', function( ev ){
	var dialog = ev.data.definition.dialog;
	var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
  
    switch (dialogName) {
        case 'image': // 이미지 속성창이 보일때 안보이게 하기 위해서 .
        	
            //dialogDefinition.removeContents('info');
            dialogDefinition.removeContents('Link');
            dialogDefinition.removeContents('advanced');
            
            dialog.on('show', function (obj) {
        		this.selectPage('Upload'); //업로드텝으로 시작
            });
            break;
    }
});

