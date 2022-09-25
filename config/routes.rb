# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/load' => 'filter#load', as: :load
      get '/clients/' => 'clients#index', as: :index
      get '/clients/:id' => 'clients#show', as: :show
      get '/clients/:id/payments' => 'clients#payments', as: :payments
    end
  end
end
