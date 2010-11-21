require 'rails'
require 'action_controller'
require 'application_helper'
require 'acts_as_gmappable/base'
#require 'gmaps4rails'

# module Gmaps4rails
#   class Engine < Rails::Engine
#     # Config defaults
#     config.widget_factory_name = "gmaps4rails"
#     config.mount_at = '/'
#     
#     # Check the gem config
#     initializer "check config" do |app|
#       # make sure mount_at ends with trailing slash
#       config.mount_at += '/'  unless config.mount_at.last == '/'
#     end
#     
#     initializer "static assets" do |app|
#       app.middleware.use ::ActionDispatch::Static, "#{root}/public"
#     end
#     
#   end
# end

module Gmaps4rails
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)
    
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
