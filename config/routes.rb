Rails.application.routes.draw do

  devise_for :users

  resources :tasks do
    member do
      put :change
    end
  end



  root 'pages#home'
  # get '/about', to: 'pages#about'
  get '/about' => 'pages#about'
  get '/dashboard' => 'pages#dashboard'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
