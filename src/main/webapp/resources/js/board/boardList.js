function goBoardForm(){
	location.href = "boardForm";
}


$(() => {
	$("tr[data-no]").click(e => {
		//e.target -> td
		var $tr = $(e.target).parent();
		var postNo = $tr.data("no");
		//console.log(postNo);
		//console.log($tr);
		
		location.href = `boardView?postNo=${postNo}`;
	});
});
