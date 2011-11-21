KwAmigodarevenda::Application.routes.draw do |map|
  resources :representants
  resources :user_sessions
  resources :users
  namespace :admin do
      resources :resellers
      resources :updates
      resources(:polls){
        resources :poll_questions
      }
      resources :notices
      resources :offers
      resources :downloads
      resources :import
      resources :transporters
      resources :export
      
      root :to => "downloads#index"
  end

  namespace :revenda do
      resources :home
      resources :resellers
      resources :polls do
        member do
          get :resultado
        end
    end
      resources :pedidos do
        collection do
          get :gravar
          get :limpar
          get :finalizar
        end
    end
      resources :categories
  end

  namespace :representante do
    resources :home
    resources :pedidos do
      member do
        get 'passo2'
        get 'passo3'
        get 'passo4'
        post 'passo4'
        get 'finalizar'
      end 
    end
    resources :representants
    resources :product_requests
  end

  resources :downloads
  resources :noticias
  resources :ajax_pedidos do
    collection do
      get 'gravar'
      get 'finalizar'
      get 'limpar'
    end
  end
  resources :sessions
  resources :home
  resources :termos_de_uso
  resources :sobre
  resources :politica_privacidade
  resources :ajuda
  
  root :to => "home#index"
  #match '/' => 'home#index'
  #match '/admin' => 'admin/downloads#index', :as => :admin
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
end