xml.instruct! :xml, :version=>"1.0"
xml.kml do
  xml.Document do
    @objects.each do |object|
      xml.Placemark do
        #xml.name  "<![CDATA[ Bonjour" + ']]>'
        pic = object.picture.nil? ? "" : '<img width="40" heigth="40" src="' + object.picture + '">'
        desc = object.gmaps4rails_description.nil? ? "" : object.gmaps4rails_description
        lat = object.gmaps4rails_latitude.nil? ? "" : object.gmaps4rails_latitude
        long = object.gmaps4rails_longitude.nil? ? "" : object.gmaps4rails_longitude
        
        xml.description  pic + desc
        xml.Point do
          str = long + "," + lat + ",0"
          xml.coordinates(str)
        end
      end
    end
  end
end