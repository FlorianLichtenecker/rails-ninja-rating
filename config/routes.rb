Rails.application.routes.draw do
  devise_for :users
  root to: "review_platforms#dashboard"
end
