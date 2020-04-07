Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'  
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      post 'purchase'
      get 'purchased'
      get 'buy'
      get 'done'
    end
  end

  
  
 

  resources :cards, only: [:new, :show, :create, :destroy] 


  resources :users, only: [:show, :edit, :update]
end