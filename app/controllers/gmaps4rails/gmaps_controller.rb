module Gmaps4rails
  class GmapsController < ApplicationController
    unloadable    
    
    def index
      respond_to do |format|
        format.js  {
          @model = params["model"]
          @filter = params["filter"]
          @options = params["options"]
          if @model.constantize.is_gmappable? == true
            @objects = @model.constantize.gmaps4rails_filter(@filter, @options)
          end
        }
      end
    end
        
  end
end