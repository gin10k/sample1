Rails.application.routes.draw do
  devise_for :users
  root to: 'contacts#index'
  resources :contacts do #, only: [:index, :new, :create, :destroy, :edit, :update, :show]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
