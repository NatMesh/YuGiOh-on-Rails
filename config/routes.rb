Rails.application.routes.draw do
  get 'home/index'
  resources :cards, only: %i[index show]
end
