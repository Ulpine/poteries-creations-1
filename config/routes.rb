Rails.application.routes.draw do
  root to: "poteries#index"
  resources :poteries
end
