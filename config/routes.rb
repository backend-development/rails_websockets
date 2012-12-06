Stepstones::Application.routes.draw do

  get "front/index"

  resources :adventures do
    resources :steps
  end

  root :to => 'front#index'
end
