Rails.application.routes.draw do
  devise_for :users
  root to: "review_platforms#dashboard"
  get 'reviews/manage', to: 'reviews#manage'
  get 'reviews/next_review', to: 'reviews#next_review'
  get "dashboard", to: "review_platforms#dashboard"
  get "review_platforms/:id", to: "review_platforms#show", as: 'review_platform'
  post 'update_reviews', to: 'review_platforms#update_reviews'
  post 'user_review_platforms', to: 'user_review_platforms#create', as: 'create_user_review_platform'
  resources :review_platforms, only: [] do
    resources :user_review_platforms, only: [:create], as: 'create_user_review_platform'
  end

  resources :reviews, only: [] do
    resources :review_categories, only: [:create]
  end
  resources :reports, only: [:new, :create, :edit, :update] do
    resources :report_reviews, only: [:new, :create]
    resources :action_items, only: [:new, :create, :index]
  end
end
