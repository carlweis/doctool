Rails.application.routes.draw do
  root to: "static#home"

  resources :documents
  resources :attachments, only: [:create, :show]

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    passwords: "users/passwords",
    unlocks: "users/unlocks",
  }
end
