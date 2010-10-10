module Gmaps4rails
  class GmapsController < ApplicationController
    #unloadable
    #layout 'gmaps4rails'  # this allows you to have a gem-wide layout
    
    def index
      @model = params["model"]
      if @model.constantize.is_gmappable? == true
          @objects = @model.constantize.gmaps4rails_filter(params["filter"], params["options"])
      end
    end
        
  end
end