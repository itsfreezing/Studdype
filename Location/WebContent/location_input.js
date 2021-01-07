$(function() {
	getJson();
});

function getJson() {
	$.getJSON("korea-administrative-district.json", function(data) {
		$.ajax({
			url:"location.do",
			method:"post",
			data:{"obj":JSON.stringify(data)},
			success:function(msg) {
				
			},
			error:function() {
				alert("실패");
			}
		});
	});
}