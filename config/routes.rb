Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :daily_targets, only: %i[new create edit update]
  resources :items, only: %i[index show] do
    resources :order_items, only: %i[create]
  end

end
