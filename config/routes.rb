Stepstones::Application.routes.draw do

  match "me/" => "me#index"
  match "me/:verb/:id" => "me#index"

  devise_for :users

  resources :adventures do
    member { post :reorder_stepstones }
    resources :stepstones
  end

  get "front/index"
  root :to => 'front#index'
end
