Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  get 'array_product/index'
  get 'array_product/calculate'
  root 'array_product#index'
end
