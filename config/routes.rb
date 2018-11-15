Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#Old Routes from mod2 project

  # resources :books, :only => [:index, :show, :create, :new, :destroy] do
  #   resources :reviews, :only => [:new, :create]
  # end
  # resources :reviews, :only => [:destroy]
  # resources :authors, :except => [:index, :edit, :update ]
  # resources :users, :only => [:show, :new, :create]

#Refactored Routes for mod3 prework

  resources :books, :only => [:new] do
    resources :reviews, :only => [:new, :create]
  end

  get '/books', to: "books#index", as: 'books'
  get '/books/:id', to: "books#show"
  # get '/book/new', to: "books#new", as: 'new_book'
  post '/books', to: "books#create"
  delete '/books/:id', to: "books#destroy", as: 'book'

  delete '/reviews/:id', to: "reviews#destroy", as: 'review'

  get '/authors/new', to: "authors#new", as: 'new_author'
  post '/authors', to: "authors#create"
  get '/authors/:id', to: "authors#show", as: 'author'
  delete '/authors/:id', to: "authors#destroy"

  get '/users/:id', to: "users#show", as: 'user'
  get '/users/new', to: "users#new", as: 'new_user'
  post '/users', to: "users#create" 

end
