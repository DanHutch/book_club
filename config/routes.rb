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

  get '/books/new', to: "books#new", as: 'new_book'
  get '/books', to: "books#index", as: 'books'
  get '/books/:id', to: "books#show"
  post '/books', to: "books#create"
  delete '/books/:id', to: "books#destroy", as: 'book'

  get '/books/:book_id/reviews/new', to: "reviews#new", as: 'new_book_review'
  post '/books/:book_id/reviews', to: "reviews#create", as: 'book_reviews'

  delete '/reviews/:id', to: "reviews#destroy", as: 'review'

  get '/authors/new', to: "authors#new", as: 'new_author'
  post '/authors', to: "authors#create"
  get '/authors/:id', to: "authors#show", as: 'author'
  delete '/authors/:id', to: "authors#destroy"

  get '/users/:id', to: "users#show", as: 'user'
  get '/users/new', to: "users#new", as: 'new_user'
  post '/users', to: "users#create" 

end
