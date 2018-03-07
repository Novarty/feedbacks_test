Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: "users/registrations" }

  namespace :users do
    resources :feedbacks, only: [:new, :create]
    root 'feedbacks#new'
  end
  namespace :admins do
    resources :feedbacks, only: :index
    root to: "feedbacks#index"
  end

  authenticated :admin do
    root 'admins/feedbacks#index', as: :manager_root
  end

  authenticated :user do
    root 'users/feedbacks#new', as: :user_root
  end
  root 'users/feedbacks#new'
end
