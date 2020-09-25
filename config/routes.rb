Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :companies, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :shops, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
