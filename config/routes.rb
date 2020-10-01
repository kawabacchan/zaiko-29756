Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection {post :import}
    collection {post :compare}
  end
  resources :companies do
    collection {get :select}
    collection {get :delivery}
    resources :shops, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :orders, only: [:index, :new, :create, :destroy]
    end
  end

end
