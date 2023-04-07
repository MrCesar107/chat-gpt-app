Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resource :message, only: %i[create]
end
