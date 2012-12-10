Stepstones::Application.routes.draw do

  devise_for :users

  resources :adventures do
    member do
      post :join
      post :reorder_stepstones 
    end
    resources :stepstones 
  end

  post "/adventures/:adventure_id/stepstones/:id/trans/:transition" => "stepstones#trans", :via => :post, :as => :transition
  post "/adventures/:adventure_id/stepstones/:id/join"              => "stepstones#join", :via => :post, :as => :join_stepstone

  get "front/index"
  root :to => 'front#index'

end
