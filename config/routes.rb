SecretsForm::Application.routes.draw do

  resources :users do
    resources :secrets, only: :new
    resources :friendships, only: :create
  end

  resources :secrets, only: :create

  resource :session, only: [:new, :create, :destroy]
end
