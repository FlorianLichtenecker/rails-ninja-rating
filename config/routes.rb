Rails.application.routes.draw do
  devise_for :users
  root to: "users#dashboard"
  get 'reviews/manage', to: 'reviews#manage'
  get 'reviews/next_review', to: 'reviews#next_review'
  get "dashboard", to: "review_platforms#dashboard"
  get "review_platforms/:id", to: "review_platforms#show", as: 'review_platform'

  resources :reviews, only: [] do
    resources :review_categories, only: [:create]
  end
  resources :reports, only: [:new, :create, :edit, :update] do
    resources :report_reviews, only: [:new, :create]
    resources :action_items, only: [:new, :create, :index]
  end
end
