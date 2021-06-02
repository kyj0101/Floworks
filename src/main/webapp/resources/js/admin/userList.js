$(() => {
	$("tr[data-no]").click(e => {
		var $tr = $(e.target).parent();
		var userId = $tr.data("no");
		
		location.href = `userDetail?userId=${userId}`;
	});
});
