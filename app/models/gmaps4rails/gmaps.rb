module Gmaps4rails
  class Gmaps < ActiveRecord::Base
    set_table_name "gmaps4rails_widgets"

    def make
      puts "widget made"
    end
    
  end
end