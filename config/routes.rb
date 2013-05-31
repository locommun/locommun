Locommun::Application.routes.draw do
  
  resources :projects

  devise_for :users

  
  root :to => 'blogit/posts#index'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount Blogit::Engine => "/blog"
  
end
