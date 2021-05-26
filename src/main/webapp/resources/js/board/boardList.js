function goBoardForm(boardNo){
	location.href = "boardForm?boardNo=" + boardNo;
}


$(() => {
	$("tr[data-no]").click(e => {
		var $tr = $(e.target).parent();
		var postNo = $tr.data("no");
		
		location.href = `boardView?postNo=${postNo}`;
	});
});
