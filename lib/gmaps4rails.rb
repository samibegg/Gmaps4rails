if defined?(Rails) && Rails::VERSION::MAJOR == 3
  module Gmaps4rails
    require "rails"
    require "action_controller"
    require 'application_helper'
    require 'acts_as_gmappable/base'
  
    class Engine < Rails::Engine
       # config.autoload_paths += %W(#{config.root}/lib)
       # 
       # initializer "static assets" do |app|
       #   app.middleware.use ::ActionDispatch::Static, "#{root}/public%s"
       # end
       
       initializer "static assets" do |app|
         app.middleware.use ::ActionDispatch::Static, "#{root}/public"
       end
       
       # 
       # def self.activate
       #   Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*.rb")) do |c|
       #     Rails.env.production? ? require(c) : load(c)
       #   end
       # end
     end
  end
end

