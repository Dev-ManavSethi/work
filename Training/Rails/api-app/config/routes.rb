require 'api_constraints'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users
      resources :companies
    end

    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
    end
  end
end
