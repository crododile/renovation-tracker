var manager_inspection_scripts = function(){
	$('form').submit(function(event){
		event.preventDefault();
	  var valuesToSubmit = $(this).serialize();
		var targetDiv = event.target
	     $.ajax({
	         url: $(this).attr('action'),
	         data: valuesToSubmit,
					 type: "POST",
	         dataType: "JSON" 
	     }).success(function(json){
				 targetDiv;
				 $(targetDiv).find("button").addClass("updated")
	     });
	     return false; // prevents normal behaviour
	});
}