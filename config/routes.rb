Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests
  resource :user
  resource :session

  post 'rental/:id/' => 'cat_rental_requests#approve_or_deny'
end
