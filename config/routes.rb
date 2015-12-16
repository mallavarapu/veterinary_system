Rails.application.routes.draw do
  resources :doctors, only: [:index, :show]
  resources :customers, only: [:index, :show, :new, :create] do
    resources :pets, only: [:show, :new, :create] do
      resources :appointments, only: [:show, :new, :create]
    end
  end
end
