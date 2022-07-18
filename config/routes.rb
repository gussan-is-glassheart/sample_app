Rails.application.routes.draw do
    root 'posts#index'
  resources :posts
  resources :boards
  resources :posts do
    resources :comments
  end
end
