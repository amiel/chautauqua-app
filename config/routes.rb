ActionController::Routing::Routes.draw do |map|
  SprocketsApplication.routes(map)

  map.resources :applications, :member => { :complete => :get }, :collection => { :only_new => :get }
  
  if ApplicationDeadline.before_deadline? then
    map.root :controller => 'applications', :action => 'new'
  else
    map.root :controller => 'applications', :action => 'closed'
  end
end
