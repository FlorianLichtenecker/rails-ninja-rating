Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "review_platforms#dashboard"
end
