Rails.application.routes.draw do
  devise_for :users
  root to: "users#dashboard"
  get 'reviews/manage', to: 'reviews#manage'
  get 'reviews/next_review', to: 'reviews#next_review'
  root to: "pages#home"
  get "dashboard", to: "review_platforms#dashboard"
end
