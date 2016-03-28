Rails.application.routes.draw do

  mount API::Base, at: "/"

  # resources :countries
  # root 'countries#index'
end
