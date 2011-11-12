KwAmigodarevenda::Application.routes.draw do
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
  end

  resources :downloads
  resources :noticias
  resources :aax_pedidos
  resources :sessions
  resources :home
  
  root :to => "home#index"
  #match '/' => 'home#index'
  #match '/admin' => 'admin/downloads#index', :as => :admin
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match '/:controller(/:action(/:id))'
end