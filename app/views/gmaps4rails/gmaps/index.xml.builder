xml.instruct! :xml, :version=>"1.0"
xml.kml do
  xml.Document do
    #if @objects.first.respond_to?('gmaps4rails_marker')
      xml.Style('id' => 'normalPlacemark') do
        xml.IconStyle do 
          xml.Icon "<href>" + @objects.first.gmaps4rails_marker + "</href>"
        end
      end
      
      xml.Style('id' => 'highlightPlacemark') do
        xml.IconStyle do 
          xml.Icon "<href>" + @objects.first.gmaps4rails_marker_hover + "</href>"
        end
      end   
      
      xml.Style('id' => 'customMap') do
        xml.Pair do
          xml.key 'normal'
          xml.StyleUrl '#normalPlacemark'
        end
        xml.Pair do
          xml.key 'highlight'
          xml.StyleUrl '#highlightPlacemark'
        end
      end
      

    # <Document>
    #     <name>Highlighted Icon</name>
    #     <description>Place your mouse over the icon to see it display the new icon</description>
    #     <Style id="highlightPlacemark">
    #       <IconStyle>
    #         <Icon>
    #           <href>http://maps.google.com/mapfiles/kml/paddle/red-stars.png</href>
    #         </Icon>
    #       </IconStyle>
    #     </Style>
    #     <Style id="normalPlacemark">
    #       <IconStyle>
    #         <Icon>
    #           <href>http://maps.google.com/mapfiles/kml/paddle/wht-blank.png</href>
    #         </Icon>
    #       </IconStyle>
    #     </Style>
    #     <StyleMap id="exampleStyleMap">
    #       <Pair>
    #         <key>normal</key>
    #         <styleUrl>#normalPlacemark</styleUrl>
    #       </Pair>
    #       <Pair>
    #         <key>highlight</key>
    #         <styleUrl>#highlightPlacemark</styleUrl>
    #       </Pair>
    #     </StyleMap>
    #     <Placemark>
    #       <name>Roll over this icon</name>
    #       <styleUrl>#exampleStyleMap</styleUrl>
    #       <Point>
    #         <coordinates>-122.0856545755255,37.42243077405461,0</coordinates>
    #       </Point>
    #     </Placemark>
    #   </Document>

    if @objects.first.respond_to?('gmaps4rails_info')
      @objects.each do |object|

        xml.Placemark do
          desc = object.gmaps4rails_info
          lat = object.gmaps4rails_latitude.nil? ? "" : object.gmaps4rails_latitude
          long = object.gmaps4rails_longitude.nil? ? "" : object.gmaps4rails_longitude
          xml.styleUrl "#customMap"
          xml.description '<![CDATA[' + desc + ']]>'
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
          xml.styleUrl "#customMap"
          desc += object.gmaps4rails_description.nil? ? "" : object.gmaps4rails_description
          lat = object.gmaps4rails_latitude.nil? ? "" : object.gmaps4rails_latitude
          long = object.gmaps4rails_longitude.nil? ? "" : object.gmaps4rails_longitude

          xml.description '<![CDATA[' + desc +']]>'
          xml.Point do
            str = long + "," + lat + ",0"
            xml.coordinates(str)
          end
        end #placemark
      end
    end

  end #Document
end #kml
