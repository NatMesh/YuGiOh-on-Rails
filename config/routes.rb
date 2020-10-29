Rails.application.routes.draw do
  resources :cards, only: %i[index show]
end
