Rails.application.routes.draw do
  resources :line_items
  resources :sold_to
  resources :payments
  get "/payments/show" => "payments#index"
    resources :carts
  resources :instruments
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resources :checkout
  resources :my_order
    resources :instruments do 
    member do 
      put "add", to: "instruments#music"
      put "remove", to: "instruments#music"
    end 
    resources :music, only:[:index]
  end
  post "/instruments/:id", to: 'instruments#add', as: 'add'
  get "/my_instruments", to: 'instruments#my_instruments', as: 'my_instruments'

  root 'instruments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


