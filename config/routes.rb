Rails.application.routes.draw do
  namespace :api do
    get 'pets/index'
    get 'pets/create'
    get 'pets/edit'
    get 'pets/update'
    get 'pets/show'
  end
  root 'pets#index'

  namespace :api do
    resources :pets, only: [:index, :create, :edit, :update, :show]
  end

  get '*path', to: 'pets#omdex', via: :all
end
