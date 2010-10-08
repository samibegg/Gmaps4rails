module Gmaps4rails
  module GmapsHelper
    def gmaps_sanitize(entity)
      entity.nil? ? "" : entity
    end
  end
end