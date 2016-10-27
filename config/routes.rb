Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments, only: [:create]
    end
    resources :contacts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :categories
  resources :dashboard, only: [:index]
  resources :jobs, only: [:index]
  root to: 'companies#index'
end
