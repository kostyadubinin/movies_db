Rails.application.routes.draw do
  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  resources :movies, path: "/", only: :index, concerns: :paginatable
  root "movies#index"
end
