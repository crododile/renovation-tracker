document.addEventListener("page:change", function () {	
	var imageField = document.getElementById('image-field');
	imageField.onchange = function () {
		$('#image-field').append("<br>").append(
			$('<input accept="image/*" id="inspection_image" multiple="multiple" name="inspection[image][]" type="file">')
			)}
});

		
