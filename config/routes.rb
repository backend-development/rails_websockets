Rails.application.routes.draw do
  resources :steps, only: [:create, :update, :destroy]
  resources :adventures do
    resources :stepstones, only: [:new, :create, :edit, :update, :destroy]
    member do
      post 'sort'
    end
  end

  root 'adventures#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#failure'
  get '/logout' => 'sessions#destroy'
  if Rails.env.development? or Rails.env.test? 
    get '/auth/testing', to: 'sessions#login_for_testing'
  end
end
