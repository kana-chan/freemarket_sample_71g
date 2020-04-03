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
    member do
      get :done
    end
  end

  resources :items do
    resources :cards, only: [:index] do
      collection do
        get 'done', to: 'cards#done'
      end
    end
  end

  resources :items do
    resources :cards, only: [:]
  end
  
  resources :cards,
  resources :users, only: [:show, :edit] 
end
