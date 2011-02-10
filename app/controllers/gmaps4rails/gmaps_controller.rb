module Gmaps4rails
  class GmapsController < ApplicationController
    unloadable    
    
    def index
      if request.xhr?
        @model = params["model"]
        @scope = params["scope"]
        @filter = params["filter"]
        @options = params["options"]
        @model = @model.constantize

        return unless @model.is_gmappable? == true

        # Default scope (optional)
        if @scope && !@scope.empty?
          @objects = eval("#{@model}.#{@scope}") # Cannot use send with lambda scope 
                                                # because the arguments have to be separated
        else
          @objects = @model.scoped({})
        end
          
        # Filters (optional)
        # @objects = @objects.gmaps4rails_filter(@filter, @options) if @model.respond_to?("gmaps4rails_filters")

      end
   end        
  end
end