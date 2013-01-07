KwAmigodarevenda::Application.routes.draw do |map|
  resources :product_requests
  resources :user_sessions
  resources :representants
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
      resources :import do
        collection do
          get :imp_sipais
          get :imp_siest
          get :imp_sicid
          get :imp_sizona          
          get :imp_sibai
          get :imp_sirev
          get :imp_sirepre
        end
      end
      resources :transporters
      resources :export
      resources :representants
      resources :users
      resources :product_requests
      resources :category_reseller_discounts
      resources :payments
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
      get :autocomplete_category_cod_sistema, :on => :collection
      get :autocomplete_product_cod_sistema, :on => :collection
      member do
        get 'passo2'
        get 'passo2_cod'
        get 'passo3'
        get 'passo4'
        post 'passo4'
        get 'finalizar'
      end 
    end
    
  end

  resources :downloads
  resources :noticias
  resources :ajax_pedidos do
    collection do
      get 'gravar'
      get 'finalizar'
      get 'limpar'
      get 'discount'
    end
  end
  resources :sessions
  resources :home
  resources :termos_de_uso
  resources :sobre
  resources :politica_privacidade
  resources :ajuda
  
  root :to => "home#index"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
end