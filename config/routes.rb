Rails.application.routes.draw do
  resources :comments
  devise_for :users

  get 'home', to: 'home#index', as: 'home'
  root 'home#index'

  resources :boards do
    resources :posts, shallow: true do
      resources :comments, shallow: true
    end
  end

  get "posts/:id/upvote" => "posts#upvote"
  get "posts/:id/downvote" => "posts#downvote"

end
