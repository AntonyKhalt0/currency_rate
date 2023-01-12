Rails.application.routes.draw do
  get 'exchange_rates/index'
  post 'exchange_rates/parse'
end
