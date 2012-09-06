Bathliving::Application.routes.draw do
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :posts,        only: [:show, :index]
  resources :products,     only: [:show, :index]
  resources :compositions, only: [:show, :index]

  root to: 'main#home'
end
