Rails.application.routes.draw do
  root to: "arrows#index"
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :arrows, only: %i[index create new show]
end
