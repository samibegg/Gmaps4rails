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
         
          #attr_accessor :goptions

          #write_inheritable_attribute(:goptions, {}) if goptions.nil?
          # 
          # def goptions
          #   read_inheritable_attribute(:goptions)
          # end
          # This is where arbitrary code goes that you want to 
          # add to the class that declared "acts_as_widget"
          
          #has_many :widgets,  :class_name => 'Gmaps4rails::Widget'
          
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
                 if resp.inspect.include?('HTTPOK 200 OK')
                   fields = resp.body.split(',')
                   self.latitude = fields[2]#TODO Check if proper field
                   self.longitude = fields[3]
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
