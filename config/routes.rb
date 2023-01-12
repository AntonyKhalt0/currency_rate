# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  use_doorkeeper
  mount Sidekiq::Web => '/sidekiq'

  root to: 'exchange_rates#index'
  post 'exchange_rates/parse'

  namespace :api do
    namespace :v1 do
      resources :exchange_rates, only: :index
    end
  end
end
