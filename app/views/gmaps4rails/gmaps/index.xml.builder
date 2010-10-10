xml.instruct! :xml, :version=>"1.0"
xml.kml do
  xml.Document do
    if @objects.first.respond_to?('gmaps4rails_marker')
      xml.Style('id' => 'specmarker') do
        xml.IconStyle do 
          xml.Icon "<href>" + @objects.first.gmaps4rails_marker + "</href>"
        end
      end
    end

    # <Style id="highlightPlacemark">
    #   <IconStyle>
    #     <Icon>
    #       <href>http://maps.google.com/mapfiles/kml/paddle/red-stars.png</href>
    #     </Icon>
    #   </IconStyle>
    # </Style>

    if @objects.respond_to?('gmaps4rails_info')
      @objects.each do |object|

        xml.Placemark do
          desc = object.gmaps4rails_info
          lat = object.gmaps4rails_latitude.nil? ? "" : object.gmaps4rails_latitude
          long = object.gmaps4rails_longitude.nil? ? "" : object.gmaps4rails_longitude
          xml.name "click me"
          xml.styleUrl "specmarker"
          xml.description desc
          xml.Point do
            str = long + "," + lat + ",0"
            xml.coordinates(str)
          end
        end #placemark
      end
    else
      @objects.each do |object|
        xml.Placemark do
          desc = object.gmaps4rails_picture.nil? ? "" : '<img width="40" heigth="40" src="' + object.gmaps4rails_picture + '">'
          xml.name "click me"
          xml.styleUrl "specmarker"
          desc += object.gmaps4rails_description.nil? ? "" : object.gmaps4rails_description
          lat = object.gmaps4rails_latitude.nil? ? "" : object.gmaps4rails_latitude
          long = object.gmaps4rails_longitude.nil? ? "" : object.gmaps4rails_longitude

          xml.description desc
          xml.Point do
            str = long + "," + lat + ",0"
            xml.coordinates(str)
          end
        end #placemark
      end
    end

  end #Document
end #kml
