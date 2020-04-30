Rails.application.routes.draw do
  devise_for :users
  root to: 'contacts#index'
  resources :contacts #, only: [:index, :new, :create, :destroy, :edit, :update, :show]
  resources :users, only: :show
end
