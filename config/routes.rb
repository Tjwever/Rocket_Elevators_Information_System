Rails.application.routes.draw do
  
  authenticate :user, ->(user) { user.superadmin_role? } do
    mount Blazer::Engine, at: "blazer"
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'user/index'
  get 'user/show'
  get 'user/new'
  get 'user/edit'
  get 'user/create'
  get 'user/destroy'
  get 'user/update'
  devise_for :users
  
  get '/commercial', to: 'pages#commercial'
  get '/residential', to: 'pages#residential'
  get '/form', to: 'pages#form'  
  get '/thank-you', to: 'pages#thankyou'
  post '/form', to: 'form#create'
  post '/contact-us', to: 'contact_us_form#create'
  # get '/chart', to: 'application#postgres_update'

  get '/chart-page', to: 'pages#chart'
  get '/chart', to: 'application#view_chart'
  get '/warehouse-update', to: 'application#postgres_update'

  root 'pages#home'


  
end
