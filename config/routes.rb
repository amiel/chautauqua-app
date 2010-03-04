ActionController::Routing::Routes.draw do |map|
  SprocketsApplication.routes(map)

  map.resources :applications, :member => { :complete => :get }, :collection => { :only_new => :get }
  map.root :controller => 'applications', :action => 'new'
end
