Rails.application.routes.draw do
  devise_for :u_sers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :books
root 'books#index'

end
