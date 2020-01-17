Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      get 'attendances/log'
      
    end
    collection do
      get '/search', to: 'users#search'
      get 'attendances/work', to: 'attendances#work'
    end
    collection { post :import }
    resources :attendances, only: :update
    
  end
  resources :bases
  
  
end