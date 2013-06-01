Locommun::Application.routes.draw do

  resources :projects
  resources :comments
  resources :sponsor_finder
  devise_for :users


  root :to => 'projects#index'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'


end
