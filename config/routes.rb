ActionController::Routing::Routes.draw do |map|
  SprocketsApplication.routes(map)

  map.resources :applications  
  map.root :controller => 'applications', :action => 'new'
end
