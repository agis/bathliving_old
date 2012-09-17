Bathliving::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'main#home'

  get '/contact' => 'ContactForms#new'

  resources :posts,         only: [:show, :index]
  resources :products,      only: [:show, :index]
  resources :projects,      only: [:show, :index]
  resources :contact_forms, only: [:new, :create]
end
