Rails.application.routes.draw do
  root 'pets#index'

  namespace :api do
    resources :pets, only: [:index, :create, :edit, :update, :show]
  end

  get '*path', to: 'pets#index', via: :all
end
