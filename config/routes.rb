Rails.application.routes.draw do
  resources :about, only: %i[index]
  resources :cards, only: %i[index show]
  root to: "home#index"

end
