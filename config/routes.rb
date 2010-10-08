Rails.application.routes.draw do |map|

  mount_at = Gmaps4rails::Engine.config.mount_at

  match mount_at => 'gmaps4rails/gmaps#index'
 
  map.resources :gmaps, :only => [ :index, :show ],
                         :controller => "gmaps4rails/gmaps",
                         :path_prefix => mount_at#,
                         #:name_prefix => "gmaps4rails_"

end
