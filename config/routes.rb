Rails.application.routes.draw do
  resources :about, only: %i[index]
  resources :cards, only: %i[index show] do
    collection do
      get "search"
    end
  end
  root to: "home#index"

end
