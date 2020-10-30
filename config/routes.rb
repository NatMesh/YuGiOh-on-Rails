Rails.application.routes.draw do
  get 'about/index'
  resources :cards, only: %i[index show]
  root to: "home#index"

end
