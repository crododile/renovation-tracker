var manager_inspection_scripts = function () {
	
	
	$(".edit_manager_inspection").on("change", 
	"input:checkbox", function (event) {
		var $form = $(event.target.parentElement.parentElement)
		$containingDiv = $(event.target.parentElement)
		var resp = $.ajax({
			type: "POST",
			url: $form.attr("action"), 
			data: $form.serialize(), 
			dataType: "JSON",
			success: function (data) {
				$containingDiv.addClass(data["css"])
			},
			error: function(data){
				console.log("error")
			}
		});
	});	
}