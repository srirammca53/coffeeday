Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :orders do
  	get 'notify'
  	get 'deliver'
  	resources :products
  end
  # Defines the root path route ("/")
  root "welcome#index"
end
