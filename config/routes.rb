Rails.application.routes.draw do
  get 'residential/index'
  get 'application/index'
  root 'pages#index'
end
