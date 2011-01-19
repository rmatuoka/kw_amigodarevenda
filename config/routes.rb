ActionController::Routing::Routes.draw do |map|
  map.resources :home, :singular => :home_item
  map.resources :downloads
  map.resources :resellers
  map.resources :polls, :member => { :resultado => :get}
  map.resources :sessions
  map.resources :noticias
  
  map.root :controller => "home"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
