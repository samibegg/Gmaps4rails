require 'net/http'
require 'uri'

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
          
          include Gmaps4rails::ActsAsGmappable::Base::InstanceMethods
        end
      end
      
      module InstanceMethods

        def get_coordinates
               if self.adress.nil? || self.adress == ""
                 self.gmaps = false
               else
                 geocoder = "http://maps.google.com/maps/geo?q="
                 output = "&output=csv"
                 #send request to the google api to get the lat/lng
                 request = geocoder + self.adress + output
                 url = URI.escape(request)
                 resp = Net::HTTP.get_response(URI.parse(url))
                 #parse result if result received properly
                 if resp.inspect.include?('HTTPOK 200 OK')
                   fields = resp.body.split(',')
                   self.gmaps4rails_latitude = fields[2]
                   self.gmaps4rails_longitude = fields[3]
                   #saves a boolean to remind the status
                   self.gmaps = true
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
