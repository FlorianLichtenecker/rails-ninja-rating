Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "review_platforms#dashboard"
  get "review_platforms/:id", to: "review_platforms#show", as: 'review_platform'
end
