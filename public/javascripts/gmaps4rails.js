	var gmaps4rails_map;
	var gmaps4rails_Options;
	var gmaps4rails_ctaLayer;
	var gmaps4rails_model;

  function gmaps4rails_init(model) {
	  gmaps4rails_model = model;
	  var myLatLng = new google.maps.LatLng(0,0);
	  gmaps4rails_Options = {
	  	    zoom: 2,
	  	    center: myLatLng,
	  	    mapTypeId: google.maps.MapTypeId.ROADMAP
	    	  }
	  gmaps4rails_map = new google.maps.Map(document.getElementById("gmaps4rails_canvas"), gmaps4rails_Options);
		create_map();
}

	function create_map(filter_value) {
		var date = new Date();
		//adding the date (which is a unique parameter, enables to bypass google map's cache on google server)
		var request = 'http://furious-robot-66.heroku.com/gmaps.xml?model=' + gmaps4rails_model + '&time=' + date.getTime();
		if (!(filter_value == null))
			{
			split_filter_value = filter_value.split('+');
			if (!(split_filter_value[0] == null))
				{
					request += '&filter=' + split_filter_value[0];
				}
			if (!(split_filter_value[1] == null))
				{
				request += '&options=' + split_filter_value[1];
				}
			}
		alert(request);
	  gmaps4rails_ctaLayer = new google.maps.KmlLayer(request);
	  gmaps4rails_ctaLayer.setMap(gmaps4rails_map);
	}

	function gmaps4rails_raz(){
	  gmaps4rails_map = new google.maps.Map(document.getElementById("gmaps4rails_canvas"), gmaps4rails_myOptions);
  }

function gmaps4rails_resfreshmap()
   {
	 gmaps4rails_raz();
   var index = document.gmaps4rails_form.gmaps4rails_list.selectedIndex;
   var filter_value = document.gmaps4rails_form.gmaps4rails_list.options[index].value;
	 create_map(filter_value);
   }