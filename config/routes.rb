Rails.application.routes.draw do
  resources :movies, path: "/", only: :index
  root "movies#index"
end
