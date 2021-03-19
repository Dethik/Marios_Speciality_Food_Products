Rails.application.routes.draw do
  root to: 'products#index'
  resources :users do
    resources :products, :reviews
  end
  resources :products do
    resources :reviews
  end
  resources :reviews do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
