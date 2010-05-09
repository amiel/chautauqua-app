ActionController::Routing::Routes.draw do |map|
  SprocketsApplication.routes(map)

  map.resources :applications, :member => { :complete => :get, :add_reply => :get, :read_reply => :get }, :collection => { :only_new => :get, :accepted => :get, :wait_list => :get }
  
  if ApplicationDeadline.before_deadline? then
    map.root :controller => 'applications', :action => 'new'
  else
    map.root :controller => 'applications', :action => 'closed'
  end
end
