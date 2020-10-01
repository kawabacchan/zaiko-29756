Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection {post :import}
    collection {post :compare}
  end
  resources :companies do
    collection {post :import}
    collection {get :select}
    collection {get :increase}
    collection {get :delivery}
    resources :shops, only: [:index, :new, :create, :edit, :update, :destroy] do
      collection {post :import}
      resources :orders, only: [:index, :new, :create, :destroy]
    end
  end

end
