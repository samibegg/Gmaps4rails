module Gmaps4rails
  class GmapsController < ApplicationController
    unloadable    
    
    def index
      @model = params["model"]
      @scope = params["scope"]
      @model = @model.constantize
      
      if @scope && !@scope.empty? && @model.gmaps4rails_trusted_scopes.include?(@scope)
        @objects = eval("#{@model}.#{@scope}") # Cannot use send with lambda scope 
                                                # because the arguments have to be separated
      else
        @objects = @model.all
      end 
    end        
  end
end