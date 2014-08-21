var manager_inspection_scripts = function () {
	
	
	$(".edit_manager_inspection").on("change", 
	"input:checkbox", function (event) {
		var $form = $(event.target.parentElement.parentElement);
		var $containingDiv = $(event.target.parentElement);
		var myfunc = function(data){
			$containingDiv.removeClass("matches");
			$containingDiv.removeClass("mismatch");
			$containingDiv.removeClass("pending");
			$containingDiv.addClass(data["css"])
		};
		
		$.ajax({
			type: "POST",
			url: $form.attr("action"), 
			data: $form.serialize(), 
			dataType: "JSON",
			success: function (data) {
				myfunc(data)
			},
			error: function(data){
				console.log("error")
			}
		});
	});	
}