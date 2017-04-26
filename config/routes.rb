Rails.application.routes.draw do
  devise_for :u_sers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :books do
	resources :reviews
end
root 'books#index'

post 'books/search', to: 'books#search'

require 'sidekiq/web'
mount Sidekiq::Web => "/sidekiq"

end
