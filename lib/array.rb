class Array
  def to_gmaps4rails
    json = "["
    each do |object|
      if (!(object.gmaps4rails_latitude == "" || object.gmaps4rails_longitude == ""))
       	json += "{\"description\": \"#{object.gmaps4rails_infowindow}\",
           		  \"longitude\": \"#{object.gmaps4rails_longitude}\",
           		  \"latitude\": \"#{object.gmaps4rails_latitude}\",
           		  \"picture\": \"#{object.gmaps4rails_marker_picture['picture']}\",
           		  \"width\": \"#{object.gmaps4rails_marker_picture['width']}\",
           		  \"height\": \"#{object.gmaps4rails_marker_picture['height']}\"
           		  }" 
        json += "," 
      end
    end
    json.chop!
    json += "]"
  end
end