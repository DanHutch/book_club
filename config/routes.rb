Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, :has_many => [:authors, :reviews]
  resources :authors, :except => :index, :has_many => :books
  resources :reviews, :only => [:new, :destroy], :has_one => [:user, :book]
  resources :users, :only => [:show, :new], :has_many => :reviews
end
