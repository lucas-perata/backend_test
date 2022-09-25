# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api/v1/docs'
  mount Rswag::Api::Engine => '/api/v1/docs'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :filter
      get '/clients/' => 'clients#index', as: :index
      get '/clients/:id' => 'clients#show', as: :show
      get '/clients/:id/payments' => 'clients#payments', as: :payments
    end
  end
end
