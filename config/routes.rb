Rails.application.routes.draw do
  root 'dashboard#show'

  get 'current_location/new' => 'location#new', as: :new_location

  post 'current_location' => 'location#locate', as: :current_location

  delete 'session' => 'session#destroy', as: :sign_out


end
