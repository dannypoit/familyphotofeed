Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  # devise_scope :user do
  #   authenticated :user do
  #     root 'posts#index', as: :authenticated_root
  #   end
  #
  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end

  root 'posts#index'

  resources :posts do
    resources :comments, only: :create
  end

  resources :users, only: [:show, :edit, :update]

  get '/users/:id/change_avatar', to: 'users#change_avatar', as: 'change_avatar'
end
