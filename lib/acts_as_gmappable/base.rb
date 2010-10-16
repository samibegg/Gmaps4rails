require 'net/http'
require 'uri'
require 'crack'

module Gmaps4rails
  module ActsAsGmappable

    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def acts_as_gmappable options = {}
          before_save :get_coordinates

          def self.is_gmappable?
            true
          end
          
          def self.gmaps4rails_markers_pic
            { "picture" =>'http://inmotionchiro.com/gmap_plugin/imgs/markers/marker.png',
              "width" => 22,
              "length" => 32 }
          end
          
          def gmaps4rails_map_options
            { "zoom" =>1, "latitude" => 0, "longitude" => 0}
          end
          
          include Gmaps4rails::ActsAsGmappable::Base::InstanceMethods
        end
      end
      
      module InstanceMethods

        def get_coordinates
           if self.gmaps4rails_address.nil? || self.gmaps4rails_address.empty?
             self.gmaps = false
           else
             geocoder = "http://maps.googleapis.com/maps/api/geocode/json?address="
             output = "&sensor=false"
             #send request to the google api to get the lat/lng
             request = geocoder + self.gmaps4rails_address + output
             url = URI.escape(request)
             resp = Net::HTTP.get_response(URI.parse(url))
             #parse result if result received properly
             if resp.inspect.include?('HTTPOK 200 OK')
               #parse the json
               parse = Crack::JSON.parse(resp.body)
               #check if google went well
               if parse["status"] == "OK"
                 #TODO maybe handle case when there are many results
                 #TODO store the country name and maybe other details?
                 latitude = parse["results"].first["geometry"]["location"]["lat"]
                 longitude = parse["results"].first["geometry"]["location"]["lng"]
                 self.gmaps4rails_latitude = latitude
                 self.gmaps4rails_longitude = longitude
                 #saves a boolean to remind the status
                 self.gmaps = true
               end
             else
               self.gmaps = false
             end
           end
           return true
        end
      end # InstanceMethods      
    end
  end
end

::ActiveRecord::Base.send :include, Gmaps4rails::ActsAsGmappable::Base
