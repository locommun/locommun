Locommun::Application.routes.draw do

  resources :projects do
    post 'suggest_date', :on => :member
    get 'vote_date' , :on => :member
    get 'pick_date' , :on => :member
  end
  resources :comments

  devise_for :users


  root :to => 'blogit/posts#index'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount Blogit::Engine => "/blog"

end
