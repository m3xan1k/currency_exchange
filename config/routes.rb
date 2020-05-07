Rails.application.routes.draw do
  root 'currencies#index'
  resources :currencies, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
