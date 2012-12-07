Stepstones::Application.routes.draw do

  devise_for :users

  get "front/index"

  resources :adventures do
    resources :steps
  end

  root :to => 'front#index'
end
