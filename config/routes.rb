Stepstones::Application.routes.draw do

  match "me/" => "me#index"
  match "me/:verb/:id" => "me#index"

  devise_for :users

  resources :adventures do
    resources :steps
  end

  get "front/index"
  root :to => 'front#index'
end
