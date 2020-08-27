Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :daily_targets, only: %i[new create show edit update]

  resources :items, only: %i[index new create edit update] do
    resources :order_items, only: %i[create]
  end

  resources :order_items, only: %i[edit update]

  resources :orders, only: %i[show update]

  # resources :categories, only: %i[show]
  get 'categories/:id', to: 'items#index', as: :category

end
