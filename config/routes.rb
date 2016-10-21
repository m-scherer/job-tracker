Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments, only: [:show, :new, :create]
    end
  end

  resources :categories

end
