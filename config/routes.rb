Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:update, :create]
  resources :items, only: [:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:show, :edit]
end