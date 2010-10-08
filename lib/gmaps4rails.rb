module Gmaps4rails
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'acts_as_gmappable/base'
end
