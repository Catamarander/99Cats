Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests
  post 'rental/:id/' => 'cat_rental_requests#approve_or_deny'
end
