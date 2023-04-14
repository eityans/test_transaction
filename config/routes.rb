Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tickets
  get 'new_ticket', to: 'tickets#new'
  post 'create_tickets', to: 'tickets#create_tickets'
  get 'tickets', to: 'tickets#index'
end
