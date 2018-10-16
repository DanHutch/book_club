Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, :only => [:index, :show, :create, :new] do
    resources :reviews, :only => [:new, :create]
  end
  resources :reviews, :only => [:destroy]
  resources :authors, :except => [:index, :edit, :update ]
  resources :users, :only => [:show, :new, :create]

end
