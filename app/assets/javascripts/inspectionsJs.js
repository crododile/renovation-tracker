var propertyDropdownListener = function(){
document.addEventListener("page:change", function () {	
	var drop = document.getElementById("property-dropdown");
	drop.onchange = function () {
		var propertyId = event.target.selectedIndex;
		var targetUrl = "/property_units/" + propertyId + ".json";
		function loadXMLDoc(url) {
		    var xmlhttp;
		    if (window.XMLHttpRequest) {
		        // code for IE7+, Firefox, Chrome, Opera, Safari
		        xmlhttp = new XMLHttpRequest();
		    } else {
		        // code for IE6, IE5
		        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    xmlhttp.onreadystatechange = function() {
		        if (xmlhttp.readyState == 4 ) {
		           if(xmlhttp.status == 200){
								 document.getElementById("inspection_unit_number").innerHTML = "";
								 var nums = JSON.parse( xmlhttp.responseText )
								 nums.forEach(function(num){
									 var node=document.createElement("OPTION");
									 var textNode =document.createTextNode(num);
									 node.appendChild(textNode);
								 	 document.getElementById("inspection_unit_number").appendChild(node);
								 })
		           }
		           else if(xmlhttp.status == 400) {
		              alert('There was an error 400')
		           }
		           else {
		               alert('something else other than 200 was returned')
		           }
		        }
		    }
		    xmlhttp.open("GET", url, true);
		    xmlhttp.send();
		};
		loadXMLDoc(targetUrl);
	};
});
}