Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  resources :items
  resources :users, only: [:show, :edit]
  resources :signup do
    collection do
      get 'step1'
      post 'step2'
    end
  end
end