Stepstones::Application.routes.draw do

  match "me/" => "me#index"

  devise_for :users

  resources :adventures do
    resources :steps
  end

  get "front/index"
  root :to => 'front#index'
end
