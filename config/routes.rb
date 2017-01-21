Rails.application.routes.draw do
  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'
  get '/logout' => 'sessions#destroy'
end
