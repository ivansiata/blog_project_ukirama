Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :users
  resources :blog_posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
