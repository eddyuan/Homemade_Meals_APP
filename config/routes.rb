Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :meals do
    resources :reviews
    resources :orders, only:[:create, :new]
  end
  root "welcome#index"
  resources :users, only:[:create, :new, :show]
  resource :session, only: [:new, :create, :destroy]
  get 'users/:id/admin_panel', to: 'users#admin_panel', as: :show_admin_panel_user

resources :orders, only:[:show]

resources :ingredients, only:[:show]

get 'search', to: 'searches#show'

end
