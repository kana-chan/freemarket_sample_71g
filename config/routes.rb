Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items 
  resources :cards, only: [:index, :new, :create] do
    collection do
      post 'pay', to: 'cards#pay'
      get 'done', to: 'cards#done'
    end
  end
  resources :users, only: [:show, :edit]
end