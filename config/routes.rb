Rails.application.routes.draw do
  resources :adventures do
    resources :stepstones
    member do
      post 'sort'
    end
  end

  root 'adventures#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'
  get '/auth/testing',            to: 'sessions#login_for_testing'
  get '/logout' => 'sessions#destroy'
end
