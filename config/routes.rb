Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home' #(creates root_path)
  get '/help', to: 'static_pages#help' #(help_path)
  get '/about', to: 'static_pages#about' #(about_path)
  get '/contact', to: 'static_pages#contact' #(contact_path)
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :splains, only: [:index, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
