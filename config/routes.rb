Rails.application.routes.draw do
  root to: "landing#index"
  devise_for :users
  resources :arrows, only: %i[index create new show]
end
