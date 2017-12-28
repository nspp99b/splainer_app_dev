Rails.application.routes.draw do
  root 'static_pages#home' #(creates root_path)
  get '/help', to: 'static_pages#help' #(help_path)
  get '/about', to: 'static_pages#about' #(about_path)
  get '/contact', to: 'static_pages#contact' #(contact_path)
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
