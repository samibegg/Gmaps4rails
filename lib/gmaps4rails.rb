if defined?(Rails) && Rails::VERSION::MAJOR == 3
  module Gmaps4rails
  #  require 'rails/all'
    require "rails"
    require "action_controller"
  #  require 'action_controller'
    require 'application_helper'
    require 'acts_as_gmappable/base'
  
    class Engine < Rails::Engine

       # config.autoload_paths += %W(#{config.root}/lib)
       # 
       # initializer "static assets" do |app|
       #   app.middleware.use ::ActionDispatch::Static, "#{root}/public"
       # end
       # 
       # def self.activate
       #   Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*.rb")) do |c|
       #     Rails.env.production? ? require(c) : load(c)
       #   end
       # end
       # 
       # config.to_prepare &method(:activate).to_proc
       # initializer 'gmaps.helper' do |app|
       #     ActionView::Base.send :include, Gmaps4rails::GmapsHelper
       # end
     end
  end
end

