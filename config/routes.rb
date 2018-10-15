Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, :only => [:index, :show, :create, :new]
  resources :authors, :only => [:show, :create]
  resources :reviews, :only => [:new, :destroy, :create]
  resources :users, :only => [:show, :new, :create]

end
