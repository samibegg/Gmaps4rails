module Gmaps4rails
  class GmapsController < ApplicationController
  
    #unloadable
    
    #layout 'gmaps4rails'  # this allows you to have a gem-wide layout
    
    def index
      @model = params["model"]
      if @model.constantize.is_gmappable? == true
        if params["filter"].nil?
          @objects =  @model.constantize.all
        else
          @objects = @model.constantize.gmaps4rails_filter(params["filter"])
        end
      end
    end
    

    
  end
end