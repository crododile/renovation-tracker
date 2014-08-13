var manager_inspection_scripts = function(){
	$('form').submit(function(event){
		event.preventDefault();
	  var valuesToSubmit = $(this).serialize();
		var $targetDiv = $(event.target);
		$targetDiv.find("button").removeClass("updated");
		$.ajax({
		   url: $(this).attr('action'),
		   data: valuesToSubmit,
			 type: "POST",
		   dataType: "JSON" 
		}).success(function(json){
  	 $targetDiv.find("button").addClass("pending");
		 setTimeout(
			 function(){$targetDiv.find("button").addClass("updated")}, 250
		 );
		});
		return false; // prevents normal behaviour
	});
}