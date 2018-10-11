Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, :except => [:edit, :update]
  resources :authors, :except => [:index, :edit, :update ]
  resources :reviews, :only => [:new, :destroy, :create]
  resources :users, :only => [:show, :new, :create]
end
