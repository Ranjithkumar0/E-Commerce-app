Rails.application.routes.draw do
  resources :line_items
  
  resources :payments
  get "/payments/show" => "payments#index"
    resources :carts
  resources :instruments
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resources :instruments do 
    member do 
      put "add", to: "instruments#music"
      put "remove", to: "instruments#music"
    end 
    resources :music, only:[:index]
  end

  root 'instruments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


