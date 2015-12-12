Rails.application.routes.draw do
  devise_for :users

  get 'home', to: 'home#index', as: 'home'
  root 'home#index'

  resources :boards do
    resources :posts, shallow: true
  end

  get "posts/:id/upvote" => "posts#upvote"
  get "posts/:id/downvote" => "posts#downvote"

end
