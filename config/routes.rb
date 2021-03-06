Locommun::Application.routes.draw do


  resources :projects do
    resources :comments, :except => [:new,:edit]
    resources :appointments do
      resources :date_time_suggestions
    end


    post 'suggest_date', :on => :member
    get 'vote_date' , :on => :member
    get 'pick_date' , :on => :member
  end

  resources :comments
  resources :sponsor_finder

  
  devise_for :users


  root :to => 'projects#index'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'


end
