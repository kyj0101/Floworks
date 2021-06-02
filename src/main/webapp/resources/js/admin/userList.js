function goUserDetail(userId){
	location.href = "userDetail?userId=" + userId;
}

$(() => {
	$("tr[data-id]").click(e => {
		var $tr = $(e.target).parent();
		var userId = $tr.data("id");
		
		location.href = `userDetail?userId=${userId}`;
	});
});
