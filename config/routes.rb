Rails.application.routes.draw do
  root 'api/pets#index'

  namespace :api do
    resources :pets, only: [:index, :create, :edit, :update, :show]
  end

  get '*path', to: 'api/pets#omdex', via: :all
end
