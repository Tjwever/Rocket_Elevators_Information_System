Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'user/index'
  get 'user/show'
  get 'user/new'
  get 'user/edit'
  get 'user/create'
  get 'user/destroy'
  get 'user/update'
  devise_for :users
  
  get '/commercial', to: 'home#commercial'
  get '/residential', to: 'home#residential'
  get '/form', to: 'home#form'
  root 'home#home'
end
