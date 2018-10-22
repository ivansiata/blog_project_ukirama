Rails.application.routes.draw do
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/sample_blog_post', to: 'static_pages#sample_blog_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end