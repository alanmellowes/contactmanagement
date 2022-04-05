Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  #get 'home/index'
  get 'home/about'
  root 'home#index' #set as home page
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
