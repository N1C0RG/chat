Rails.application.routes.draw do
  devise_for :users
  get 'rooms/index'
  get 'home/index', as: 'home'
  root 'home#index'
  resources :rooms
  resources :users
  resources :rooms do
    resources :messages
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #problema al cerrar la sesion con devise 
  devise_scope :user do 
    get 'users/sign_out' => "devise/sessions#destroy"
  end 
end
